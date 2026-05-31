abstract class IEmotionDetector {
  /// Modeli ve kamerayı başlatır.
  Future<void> initialize();

  /// Verilen görüntü dosyasından duyguyu tespit eder.
  /// [imagePath]: Geçici dosyadan alınan fotoğrafın yolu.
  /// Döner: Türkçe duygu etiketi (örn. "Mutlu 😊")
  Future<String> detectEmotion(String imagePath);

  /// Kaynakları serbest bırakır.
  void dispose();
}
