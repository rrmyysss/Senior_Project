import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/organisms/dashed_oval_painter.dart';
import '../../../infrastructure/mood/tflite_emotion_detector.dart';
import '../../core/state/player_state.dart';

class MoodDetectionPage extends StatefulWidget {
  const MoodDetectionPage({super.key});

  @override
  State<MoodDetectionPage> createState() => _MoodDetectionPageState();
}

class _MoodDetectionPageState extends State<MoodDetectionPage>
    with SingleTickerProviderStateMixin {
  bool _isScanning = false;
  bool _cameraReady = false;
  String? _cameraError;

  late AnimationController _pulseController;
  CameraController? _cameraController;
  final TfliteEmotionDetector _detector = TfliteEmotionDetector();

  @override
  void initState() {
    super.initState();
    PlayerState.isMiniPlayerVisible.value = false; // Tara sayfasında gizle

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _initCamera();
    _detector.initialize();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() => _cameraError = 'Kamera bulunamadı');
        return;
      }

      // Ön kamerayı tercih et (selfie için)
      final camera = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _cameraController!.initialize();
      if (mounted) {
        setState(() => _cameraReady = true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _cameraError = 'Kamera açılamadı');
      }
    }
  }

  @override
  void dispose() {
    PlayerState.isMiniPlayerVisible.value = true; // Sayfadan çıkınca geri göster
    _pulseController.dispose();
    _cameraController?.dispose();
    _detector.dispose();
    super.dispose();
  }

  Future<void> _startScan() async {
    if (_isScanning) return;
    setState(() => _isScanning = true);

    try {
      String detectedEmotion;

      if (_cameraReady && _cameraController != null) {
        // Kameradan fotoğraf çek
        final XFile photo = await _cameraController!.takePicture();
        // Model üzerinde inference çalıştır
        detectedEmotion = await _detector.detectEmotion(photo.path);
      } else {
        // Kamera yoksa (emülatör) sadece demo modu çalıştır
        detectedEmotion = await _detector.detectEmotion('');
      }

      if (mounted) {
        if (detectedEmotion == 'no_face_detected') {
          setState(() => _isScanning = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Yüz algılanamadı, lütfen kameraya bakarak tekrar deneyin.'),
              backgroundColor: Colors.orange,
            ),
          );
        } else {
          // Duyguyu parametre olarak scan-result sayfasına ilet
          context.pushReplacement('/scan-result', extra: detectedEmotion);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isScanning = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tarama başarısız, tekrar deneyin.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEDF2F9), Color(0xFFDCE8F5), Color(0xFFCFDCEE)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar
                Row(
                  children: [
                    _CircleBackButton(onTap: () => Navigator.of(context).pop()),
                    const SizedBox(width: 16),
                    const Text(
                      'Duygunu Tara',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1A2A3A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Camera box
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF6B7280),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // --- Kamera önizlemesi veya placeholder ---
                        if (_cameraReady && _cameraController != null)
                          Positioned.fill(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: 100,
                                // Portre modunda olduğumuz için en/boy oranını ters çevirmeliyiz (uzun kenar height olmalı)
                                height: 100 * _cameraController!.value.aspectRatio,
                                child: CameraPreview(_cameraController!),
                              ),
                            ),
                          )
                        else
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF8A9BB8), Color(0xFF6B7D96)],
                              ),
                            ),
                            child: Center(
                              child: _cameraError != null
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('🧑',
                                            style: TextStyle(fontSize: 90)),
                                        const SizedBox(height: 8),
                                        Text(
                                          _cameraError!,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const Text(
                                          '(Demo mod aktif)',
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const CircularProgressIndicator(
                                      color: Colors.white54,
                                    ),
                            ),
                          ),

                        // LIVE / TARANYOR badge
                        Positioned(
                          top: 14,
                          right: 14,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: _isScanning
                                  ? AppColors.primary
                                  : const Color(0xFFEF4444),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedBuilder(
                                  animation: _pulseController,
                                  builder: (context, _) => Opacity(
                                    opacity: _pulseController.value,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  _isScanning ? 'TARANYOR' : 'CANLI',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Yüz ovalı çerçeve
                        Center(
                          child: Transform.translate(
                            offset: const Offset(0, -20),
                            child: CustomPaint(
                              size: const Size(200, 240),
                              painter: DashedOvalPainter(
                                color: _isScanning
                                    ? AppColors.primary
                                    : Colors.white.withValues(alpha: 0.7),
                                strokeWidth: 2.5,
                                dashWidth: 12,
                                dashSpace: 8,
                              ),
                            ),
                          ),
                        ),

                        // Tarama animasyonu (yatay ışık çizgisi)
                        if (_isScanning)
                          AnimatedBuilder(
                            animation: _pulseController,
                            builder: (context, _) {
                              final t = _pulseController.value;
                              return Positioned(
                                top: 80 + (t * 200),
                                left: 40,
                                right: 40,
                                child: Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        AppColors.primary.withValues(alpha: 0.8),
                                        Colors.transparent,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              );
                            },
                          ),

                        // Alt ipucu
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.72),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                _isScanning
                                    ? 'Duygun analiz ediliyor...'
                                    : 'Yüzünü çerçeveye hizala',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // İpucu
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Text('🔆', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10),
                      Text(
                        'İyi ışıklı bir ortamda olduğundan emin ol',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF6A8AAA),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Tara butonu
                _GradientButton(
                  label: _isScanning ? '⏳ Taranıyor...' : 'Tara →',
                  isLoading: _isScanning,
                  onTap: _isScanning ? null : _startScan,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CircleBackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.65),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text('←',
              style: TextStyle(fontSize: 20, color: Color(0xFF1A2A3A))),
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isLoading;

  const _GradientButton({
    required this.label,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFA78BFA), Color(0xFF60B8F0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8264F0).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
