import os
import numpy as np
import tensorflow as tf
from tensorflow.keras.applications import MobileNetV2
from tensorflow.keras.models import Sequential, Model
from tensorflow.keras.layers import Dense, Dropout, GlobalAveragePooling2D, BatchNormalization
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.callbacks import EarlyStopping, ReduceLROnPlateau, ModelCheckpoint
from tensorflow.keras.regularizers import l2
import matplotlib.pyplot as plt

# ============================================================
# VERİ YOLU (Önceki koddan devam)
# ============================================================
balanced_dir = '/content/balanced_dataset'

# Veri setini kontrol et
if not os.path.exists(balanced_dir):
    print("❌ Dengeli veri seti bulunamadı!")
    print("Lütfen önce önceki kodu çalıştırın.")
    raise FileNotFoundError("balanced_dataset klasörü yok!")

print("=" * 60)
print("VERİ SETİ KONTROLDEKİ SINIFLAR")
print("=" * 60)
for class_name in os.listdir(balanced_dir):
    class_path = os.path.join(balanced_dir, class_name)
    if os.path.isdir(class_path):
        count = len([f for f in os.listdir(class_path) if f.lower().endswith(('.jpg', '.png', '.jpeg'))])
        print(f"{class_name:25s}: {count:5d} görüntü")

# ============================================================
# VERİ YÜKLEME - RGB İçin (Transfer Learning)
# ============================================================
# MobileNetV2 RGB görüntü bekliyor (3 kanal)
img_height, img_width = 96, 96  # Daha yüksek çözünürlük
batch_size = 32

# Eğitim augmentation
train_datagen = ImageDataGenerator(
    rescale=1./255,
    rotation_range=20,
    width_shift_range=0.2,
    height_shift_range=0.2,
    shear_range=0.15,
    zoom_range=0.2,
    horizontal_flip=True,
    brightness_range=[0.8, 1.2],
    fill_mode='nearest',
    validation_split=0.25
)

# Validation sadece rescale
val_datagen = ImageDataGenerator(
    rescale=1./255,
    validation_split=0.25
)

train_generator = train_datagen.flow_from_directory(
    balanced_dir,
    target_size=(img_height, img_width),
    batch_size=batch_size,
    color_mode="rgb",  # RGB'ye çevir (gri değil)
    class_mode='categorical',
    subset='training',
    shuffle=True
)

validation_generator = val_datagen.flow_from_directory(
    balanced_dir,
    target_size=(img_height, img_width),
    batch_size=batch_size,
    color_mode="rgb",
    class_mode='categorical',
    subset='validation',
    shuffle=False
)

num_classes = len(train_generator.class_indices)
print(f"\n✓ Eğitim: {train_generator.samples} görüntü")
print(f"✓ Doğrulama: {validation_generator.samples} görüntü")
print(f"✓ Sınıf sayısı: {num_classes}")
print(f"✓ Sınıflar: {list(train_generator.class_indices.keys())}")

# ============================================================
# TRANSFER LEARNING MODELİ (MobileNetV2)
# ============================================================
print("\n" + "=" * 60)
print("TRANSFER LEARNING MODELİ OLUŞTURULUYOR...")
print("=" * 60)

# Pre-trained MobileNetV2 (ImageNet ağırlıkları ile)
base_model = MobileNetV2(
    input_shape=(img_height, img_width, 3),
    include_top=False,  # Son katmanları ekleme
    weights='imagenet'   # ImageNet ağırlıkları
)

# İlk katmanları dondur (fine-tuning için)
base_model.trainable = False

print(f"✓ Base model yüklendi: {base_model.name}")
print(f"✓ Base model katman sayısı: {len(base_model.layers)}")

# Kendi sınıflandırma katmanlarını ekle
model = Sequential([
    base_model,
    GlobalAveragePooling2D(),
    BatchNormalization(),
    Dense(256, activation='relu', kernel_regularizer=l2(0.001)),
    Dropout(0.5),
    BatchNormalization(),
    Dense(128, activation='relu', kernel_regularizer=l2(0.001)),
    Dropout(0.4),
    Dense(num_classes, activation='softmax')
])

model.compile(
    optimizer=Adam(learning_rate=0.001),  # İlk aşama için daha hızlı
    loss='categorical_crossentropy',
    metrics=['accuracy']
)

print("\n" + "=" * 60)
print("MODEL YAPISI")
print("=" * 60)
model.summary()

# ============================================================
# AŞAMA 1: DONDURULMUŞ BASE MODEL İLE EĞİTİM
# ============================================================
print("\n" + "=" * 60)
print("AŞAMA 1: Base Model Dondurulmuş Eğitim (Hızlı)")
print("=" * 60)

early_stop_1 = EarlyStopping(
    monitor='val_accuracy',
    patience=10,
    restore_best_weights=True,
    mode='max',
    verbose=1
)

reduce_lr_1 = ReduceLROnPlateau(
    monitor='val_accuracy',
    factor=0.5,
    patience=3,
    min_lr=1e-7,
    mode='max',
    verbose=1
)

checkpoint_1 = ModelCheckpoint(
    'transfer_phase1.h5',
    monitor='val_accuracy',
    save_best_only=True,
    mode='max',
    verbose=1
)

history_1 = model.fit(
    train_generator,
    epochs=30,
    validation_data=validation_generator,
    callbacks=[early_stop_1, reduce_lr_1, checkpoint_1],
    verbose=1
)

# ============================================================
# AŞAMA 2: FINE-TUNING (Son Katmanları Aç)
# ============================================================
print("\n" + "=" * 60)
print("AŞAMA 2: Fine-Tuning (Son Katmanlar Açılıyor)")
print("=" * 60)

# Base modelin son 30 katmanını eğitilebilir yap
base_model.trainable = True
fine_tune_at = len(base_model.layers) - 30

for layer in base_model.layers[:fine_tune_at]:
    layer.trainable = False

# Daha yavaş öğrenme hızı ile yeniden derle
model.compile(
    optimizer=Adam(learning_rate=0.0001),  # Daha yavaş
    loss='categorical_crossentropy',
    metrics=['accuracy']
)

print(f"✓ Eğitilebilir katmanlar: {sum([1 for layer in model.layers if layer.trainable])}")

early_stop_2 = EarlyStopping(
    monitor='val_accuracy',
    patience=15,
    restore_best_weights=True,
    mode='max',
    verbose=1
)

reduce_lr_2 = ReduceLROnPlateau(
    monitor='val_accuracy',
    factor=0.5,
    patience=5,
    min_lr=1e-8,
    mode='max',
    verbose=1
)

checkpoint_2 = ModelCheckpoint(
    'transfer_best_model.h5',
    monitor='val_accuracy',
    save_best_only=True,
    mode='max',
    verbose=1
)

history_2 = model.fit(
    train_generator,
    epochs=50,
    validation_data=validation_generator,
    callbacks=[early_stop_2, reduce_lr_2, checkpoint_2],
    verbose=1
)

# ============================================================
# SONUÇLAR VE GRAFİKLER
# ============================================================
model.save('final_transfer_model.h5')

# Tüm geçmişi birleştir
all_history = {
    'accuracy': history_1.history['accuracy'] + history_2.history['accuracy'],
    'val_accuracy': history_1.history['val_accuracy'] + history_2.history['val_accuracy'],
    'loss': history_1.history['loss'] + history_2.history['loss'],
    'val_loss': history_1.history['val_loss'] + history_2.history['val_loss']
}

# En iyi sonuçlar
best_idx = np.argmax(all_history['val_accuracy'])

print("\n" + "=" * 60)
print("TRANSFER LEARNING SONUÇLARI")
print("=" * 60)
print(f"\nEn İyi Epoch: {best_idx + 1}")
print(f"Eğitim Doğruluğu: {all_history['accuracy'][best_idx]:.4f} ({all_history['accuracy'][best_idx]*100:.2f}%)")
print(f"Doğrulama Doğruluğu: {all_history['val_accuracy'][best_idx]:.4f} ({all_history['val_accuracy'][best_idx]*100:.2f}%)")
print(f"Eğitim Kaybı: {all_history['loss'][best_idx]:.4f}")
print(f"Doğrulama Kaybı: {all_history['val_loss'][best_idx]:.4f}")

gap = all_history['accuracy'][best_idx] - all_history['val_accuracy'][best_idx]
print(f"\nGenelleme Farkı: {gap:.4f} ({gap*100:.2f}%)")

if gap < 0.05:
    print("✅ Mükemmel genelleme!")
elif gap < 0.10:
    print("✓ İyi genelleme")
elif gap < 0.15:
    print("⚠️ Kabul edilebilir")
else:
    print("❌ Overfitting var")

# Grafik çiz
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# Doğruluk grafiği
axes[0].plot(all_history['accuracy'], label='Eğitim')
axes[0].plot(all_history['val_accuracy'], label='Doğrulama')
axes[0].axvline(x=len(history_1.history['accuracy']), color='r', linestyle='--', label='Fine-tuning başlangıcı')
axes[0].set_title('Model Doğruluğu')
axes[0].set_xlabel('Epoch')
axes[0].set_ylabel('Doğruluk')
axes[0].legend()
axes[0].grid(True, alpha=0.3)

# Kayıp grafiği
axes[1].plot(all_history['loss'], label='Eğitim')
axes[1].plot(all_history['val_loss'], label='Doğrulama')
axes[1].axvline(x=len(history_1.history['loss']), color='r', linestyle='--', label='Fine-tuning başlangıcı')
axes[1].set_title('Model Kaybı')
axes[1].set_xlabel('Epoch')
axes[1].set_ylabel('Kayıp')
axes[1].legend()
axes[1].grid(True, alpha=0.3)

plt.tight_layout()
plt.savefig('training_history.png', dpi=150, bbox_inches='tight')
print("\n📊 Grafik kaydedildi: training_history.png")
plt.show()

print("\n💾 Modeller:")
print("   ✓ transfer_best_model.h5 (EN İYİ)")
print("   ✓ final_transfer_model.h5 (SON)")
print("   ✓ transfer_phase1.h5 (Aşama 1)")

# Performans karşılaştırması
print("\n" + "=" * 60)
print("PERFORMANS KARŞILAŞTIRMASI")
print("=" * 60)
print(f"Önceki CNN Model:    ~%40 doğruluk")
print(f"Transfer Learning:   {all_history['val_accuracy'][best_idx]*100:.1f}% doğruluk")
print(f"İyileşme:            +{(all_history['val_accuracy'][best_idx] - 0.40)*100:.1f}%")
---
import os
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from sklearn.metrics import classification_report, confusion_matrix

# ============================================================
# AYARLAR
# ============================================================
model_path = 'transfer_best_model.h5'  # En iyi modeli yüklüyoruz
data_dir = '/content/balanced_dataset' # Veri seti yolu
img_height, img_width = 96, 96
batch_size = 32

# ============================================================
# 1. VERİYİ HAZIRLA (SHUFFLE=FALSE ÇOK ÖNEMLİ)
# ============================================================
# Test/Doğrulama verisini aynen yüklüyoruz ama KARIŞTIRMIYORUZ
val_datagen = ImageDataGenerator(
    rescale=1./255,
    validation_split=0.25
)

print("Veriler yükleniyor...")
val_generator = val_datagen.flow_from_directory(
    data_dir,
    target_size=(img_height, img_width),
    batch_size=batch_size,
    class_mode='categorical',
    color_mode='rgb',      # Transfer learning için RGB şart
    subset='validation',
    shuffle=False          # DİKKAT: Rapor için False olmalı!
)

class_names = list(val_generator.class_indices.keys())
print(f"Sınıflar: {class_names}")

# ============================================================
# 2. MODELİ YÜKLE VE TAHMİN ET
# ============================================================
if os.path.exists(model_path):
    print(f"\nModel yükleniyor: {model_path}...")
    model = load_model(model_path)
    print("Model başarıyla yüklendi.")
else:
    raise FileNotFoundError("Model dosyası bulunamadı! Lütfen önce eğitimi tamamlayın.")

print("\nTahminler yapılıyor (Bu işlem biraz sürebilir)...")
# Modelden olasılıkları al (Örn: [%10, %80, %5, %2, %3])
predictions = model.predict(val_generator, verbose=1)

# En yüksek olasılıklı sınıfı seç (Örn: 1. index -> Kızgın)
y_pred = np.argmax(predictions, axis=1)

# Gerçek etiketleri al
y_true = val_generator.classes

# ============================================================
# 3. SINIFLANDIRMA RAPORU
# ============================================================
print("\n" + "="*60)
print("SINIFLANDIRMA RAPORU")
print("="*60)
print(classification_report(y_true, y_pred, target_names=class_names))

# ============================================================
# 4. KARMAŞIKLIK MATRİSİ (CONFUSION MATRIX)
# ============================================================
cm = confusion_matrix(y_true, y_pred)

plt.figure(figsize=(10, 8))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=class_names,
            yticklabels=class_names)

plt.title('Karmaşıklık Matrisi (Confusion Matrix)')
plt.ylabel('Gerçek Sınıflar')
plt.xlabel('Tahmin Edilen Sınıflar')
plt.show()

# ============================================================
# 5. HATALI TAHMİNLERİ GÖSTER (ANALİZ İÇİN)
# ============================================================
# Modelin en çok nerede hata yaptığını görmek için örnekler
errors = np.where(y_pred != y_true)[0]
print(f"\nToplam Hatalı Tahmin Sayısı: {len(errors)}")

if len(errors) > 0:
    print("\nHatalı tahminlerden 5 örnek:")
    plt.figure(figsize=(15, 5))

    # Rastgele 5 hatayı seç
    random_errors = np.random.choice(errors, min(5, len(errors)), replace=False)

    for i, error_idx in enumerate(random_errors):
        img_path = val_generator.filepaths[error_idx]
        img = plt.imread(img_path)

        true_label = class_names[y_true[error_idx]]
        pred_label = class_names[y_pred[error_idx]]
        confidence = np.max(predictions[error_idx])

        plt.subplot(1, 5, i+1)
        plt.imshow(img)
        plt.title(f"Gerçek: {true_label}\nTahmin: {pred_label}\n(Güven: {confidence:.2f})", color='red', fontsize=9)
        plt.axis('off')
    plt.tight_layout()
    plt.show()