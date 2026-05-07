# MoodTune Constitution

## 1. Proje Vizyonu
MoodTune, kullanıcının yüz ifadesini kamera aracılığıyla gerçek zamanlı analiz edip (TFLite AI), anlık duygu durumuna uygun kişiselleştirilmiş müzik önerileri sunan ve bu verileri geçmişe dönük takip eden akıllı bir mobil asistandir.
✅ Kullanıcı kameraya bakar → AI duyguyu tespit eder → YouTube'dan müzik önerilir → Geçmiş kaydedilir

## 2. Tech Stack (Kesin Kurallar)
⚠️ Bu tablodaki teknolojiler dışında hiçbir paket projeye eklenemez. Eklenmesi gerekiyorsa önce PRD güncellenmeli, sonra kod yazılmalıdır.

*   **Flutter**: 3.24.x (stable) - Cross-platform, camera & TFLite desteği (NOT: 3.38.9 kullanılmamalıdır)
*   **Dart**: 3.5.x - Null-safety, strong typing
*   **State Management**: Flutter BLoC (Event-based) - Öngörülebilir state, test edilebilir
*   **AI / ML**: TFLite (tflite_flutter ^0.10.x) - On-device inference, offline çalışır
*   **Kamera**: camera ^0.10.x - Frame stream, yüz analizi için
*   **Database**: Cloud Firestore - Real-time, offline-first, scalable
*   **Auth**: Firebase Auth - Google, e-posta girişi
*   **Müzik API**: YouTube Data API v3 - Ücretsiz, quota yönetilebilir, geniş içerik
*   **YouTube Player**: youtube_player_flutter ^8.1.2 - WebView tabanlı gömülü oynatma
*   **HTTP Client**: http ^1.2.0 - YouTube API istekleri
*   **Cache (local)**: hive_flutter ^1.x - Offline şarkı cache, quota koruması
*   **Image Cache**: cached_network_image ^3.3.1 - YouTube thumbnail optimizasyonu
*   **Env Yönetimi**: flutter_dotenv ^5.1.0 - API key güvenliği (.env dosyası)
*   **Architecture**: DDCA (Domain-Driven Clean Arch.) - Katmanlı, test edilebilir, ölçeklenebilir
*   **Linter**: very_good_analysis - Sıfır tolerans, tutarlı kod kalitesi
*   **Serialization**: freezed + json_serializable - Immutable modeller, boilerplate yok

## 3. Mimari Katmanlar (DDCA)
ℹ️ Domain-Driven Clean Architecture: Her katman sadece bir alt katmana bağımlıdır. Domain katmanı hiçbir şeye bağımlı değildir.

### 3.1 Domain Layer (Pure Dart)
⚠️ Bu katmana Flutter import edilemez. Saf Dart mantığı ve interface'ler.
*   **Entities:** User, MoodEntry, MusicTrack, UserPreferences
*   **Value Objects:** ConfidenceScore, vb.
*   **Enums:** MoodTag, MoodMethod, TrackSource
*   **Repositories (Interfaces):** IMoodRepository, IAuthRepository, IMusicRepository, IYouTubeRepository

### 3.2 Application Layer (Use Cases + BLoC)
ℹ️ Use Case başına tek sorumluluk. BLoC'lar UI'dan bağımsızdır, Use Case'leri çağırır.
*   **MoodBloc**, **MusicBloc**, **AuthBloc**, **PreferencesBloc**, **AnalyticsBloc**

### 3.3 Infrastructure Layer (DataSources & Implementations)
⚠️ Dış dünyayla (Firebase, YouTube API, TFLite) konuşur. Domain interface'lerini implement eder.
*   TFLiteMoodDataSource, FirebaseMoodDataSource, YouTubeDataSource, FirebaseMusicDataSource, vs.

### 3.4 Presentation Layer (UI & BLoC Widgets)
ℹ️ Her ekran kendi BLoC'unu kullanır. Widget'lar iş mantığı içermez.

## 4. AI & Kamera Akışı (Kritik Bölüm)
1. frame stream başlatılır (camera)
2. AnalyzeFaceEvent tetiklenir (her 500ms bir frame)
3. Frame normalize edilip TFLite modeline gönderilir
4. TFLite model sınıflandırma yapar
5. Güven skoru kontrol (>= 0.60)
6. Başarılı ise YouTube/Firestore'dan müzik bulunur.
7. Oynatılır ve MoodEntry olarak kaydedilir.

## 5. Kod Disiplini ve Hata Yönetimi
*   **KURAL C-01 Immutability:** Tüm entity'ler freezed ile üretilir.
*   **KURAL C-02 Null Safety:** Zorunlu alanlar null olamaz.
*   **KURAL C-03 Single Responsibility:** BLoC'lar Use Case çağırır, iş mantığı yazmaz.
*   **KURAL C-04 Dependency Injection:** get_it kullanılır.
*   **KURAL C-05 Error Propagation:** Either<Failure, Success> (FpDart) kullanılır. Exception yok.
*   **KURAL C-06 No Business Logic in UI:** Kararlar BLoC'ta verilir.
*   **KURAL C-07 Linter Compliance:** very_good_analysis kuralları ihlal edilemez.

## 6. Notion & Araç Entegrasyonları (MCP Talimatları)
*   **KURAL N-01:** PRD'ye Bağlılık
*   **KURAL N-02:** Katman Disiplini
*   **KURAL N-03:** Tek platform YouTube Data API v3'tür. Spotify vb. kullanılamaz.
*   **KURAL N-04:** Failure-First.
*   **KURAL N-05:** Test Oluşturma (1 unit test, 1 BLoC test).
