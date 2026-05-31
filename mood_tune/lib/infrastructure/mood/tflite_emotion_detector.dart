import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../../../domain/mood/services/i_emotion_detector.dart';

/// Model çıktısı → dizin sırası (alfabetik, ImageDataGenerator'ın ürettiği sıra)
/// 0: korkmuş_ve_şaşırmış  1: kızgın  2: mutlu  3: nötr  4: üzgün
const _emotionLabels = [
  'korkmuş', // korkmuş_ve_şaşırmış (scan-result page maps 'korkmuş' to fear)
  'kızgın',
  'mutlu',
  'nötr',
  'üzgün',
];

const _modelAssetPath = 'assets/models/emotion_model.tflite';
const _inputSize = 96;

class TfliteEmotionDetector implements IEmotionDetector {
  Interpreter? _interpreter;
  bool _isDemoMode = false;
  late final FaceDetector _faceDetector;

  @override
  Future<void> initialize() async {
    // Initialize Face Detector
    final options = FaceDetectorOptions(
      enableContours: false,
      enableLandmarks: false,
      enableClassification: false,
      enableTracking: false,
      performanceMode: FaceDetectorMode.fast,
    );
    _faceDetector = FaceDetector(options: options);

    try {
      await rootBundle.load(_modelAssetPath);
      _interpreter = await Interpreter.fromAsset(_modelAssetPath);
      _isDemoMode = false;
    } catch (e) {
      _isDemoMode = true;
    }
  }

  @override
  Future<String> detectEmotion(String imagePath) async {
    if (_isDemoMode || _interpreter == null) return _demoDetect();
    if (imagePath.isEmpty) return _demoDetect();
    try {
      return await _runInference(imagePath);
    } catch (e) {
      return _demoDetect();
    }
  }

  Future<String> _runInference(String imagePath) async {
    // 1. Resmi oku ve EXIF rotasyonunu uygula
    final Uint8List rawBytes = await File(imagePath).readAsBytes();
    img.Image? decoded = img.decodeImage(rawBytes);
    if (decoded == null) return _demoDetect();
    decoded = img.bakeOrientation(decoded);

    // 2. ML Kit ile Yüz Tespiti
    final inputImage = InputImage.fromFilePath(imagePath);
    final List<Face> faces = await _faceDetector.processImage(inputImage);

    // Eğer yüz bulunamazsa işlemi iptal et ve hata kodu dön
    if (faces.isEmpty) {
      return 'no_face_detected';
    }

    // Taranıyor animasyonu için bekleme (yüz bulunduğu için biraz daha kısa tutabiliriz)
    await Future.delayed(const Duration(milliseconds: 1000));

    // 3. En büyük yüzü bul ve etrafından kare kes
    Face largestFace = faces.first;
    for (var face in faces) {
      if (face.boundingBox.width * face.boundingBox.height >
          largestFace.boundingBox.width * largestFace.boundingBox.height) {
        largestFace = face;
      }
    }

    final boundingBox = largestFace.boundingBox;

    // Yüzün etrafında biraz pay bırak (padding)
    final int faceX = boundingBox.left.toInt();
    final int faceY = boundingBox.top.toInt();
    final int faceWidth = boundingBox.width.toInt();
    final int faceHeight = boundingBox.height.toInt();

    // Merkezi hesapla
    final int centerX = faceX + (faceWidth ~/ 2);
    final int centerY = faceY + (faceHeight ~/ 2);

    // Yüzü tam kare içine alacak büyüklüğü hesapla (biraz daha büyük olsun diye 1.5 ile çarpıyoruz)
    int cropSize = (max(faceWidth, faceHeight) * 1.5).toInt();
    
    // Resim sınırlarını aşmamasına dikkat et
    if (cropSize > decoded.width) cropSize = decoded.width;
    if (cropSize > decoded.height) cropSize = decoded.height;

    int cropX = centerX - (cropSize ~/ 2);
    int cropY = centerY - (cropSize ~/ 2);

    // X ve Y sınırlarını kontrol et
    if (cropX < 0) cropX = 0;
    if (cropY < 0) cropY = 0;
    if (cropX + cropSize > decoded.width) cropX = decoded.width - cropSize;
    if (cropY + cropSize > decoded.height) cropY = decoded.height - cropSize;

    final cropped = img.copyCrop(decoded, x: cropX, y: cropY, width: cropSize, height: cropSize);

    // 4. 96x96'ya yeniden boyutlandır
    final resized = img.copyResize(cropped, width: _inputSize, height: _inputSize);

    // 5. Float32List input buffer — normalize [0, 1]
    final inputBuffer = Float32List(_inputSize * _inputSize * 3);
    int bufIdx = 0;
    for (int row = 0; row < _inputSize; row++) {
      for (int col = 0; col < _inputSize; col++) {
        final pixel = resized.getPixel(col, row);
        inputBuffer[bufIdx++] = pixel.r.toDouble() / 255.0;
        inputBuffer[bufIdx++] = pixel.g.toDouble() / 255.0;
        inputBuffer[bufIdx++] = pixel.b.toDouble() / 255.0;
      }
    }

    // 6. Tensor'a doğrudan yaz ve modeli çalıştır
    _interpreter!.allocateTensors();
    final inputTensor = _interpreter!.getInputTensor(0);
    inputTensor.data = inputBuffer.buffer.asUint8List();
    _interpreter!.invoke();

    // 7. Çıktıyı doğrudan tensor'dan oku
    final outputTensor = _interpreter!.getOutputTensor(0);
    final outputData = outputTensor.data.buffer.asFloat32List();

    // 8. En yüksek olasılıklı sınıf
    int maxIdx = 0;
    double maxVal = outputData[0];
    for (int i = 1; i < outputData.length; i++) {
      if (outputData[i] > maxVal) {
        maxVal = outputData[i];
        maxIdx = i;
      }
    }

    return _emotionLabels[maxIdx];
  }

  Future<String> _demoDetect() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return _emotionLabels[Random().nextInt(_emotionLabels.length)];
  }

  @override
  void dispose() {
    _interpreter?.close();
    _interpreter = null;
    _faceDetector.close();
  }
}
