---
description: Kullanıcı onayı olmadan otonom analiz ve commit işlemi
---

# Title: direct-commit
# Description: Staged Changes alanındaki kodları otonom olarak analiz eder ve onay beklemeden commit/push yapar.

## Steps:
1. **Analiz:** dart analyzer ve flutter format araçlarını kullanarak **SADECE** staged olan dosyaların Proje standartlarına uygunluğunu denetle. (Örn: `git diff --cached --name-only | grep "\.dart$" | xargs dart format -o none --set-exit-if-changed` ve `git diff --cached --name-only | grep "\.dart$" | xargs dart analyze`)
2. **Review:** Değişiklikleri Clean Architecture ve SOLID prensiplerine göre hızlıca gözden geçir. (Değişiklikleri `git diff --cached` ile oku).
3. **Draft:** Yapılan değişiklikleri özetleyen, teknik derinliği olan bir commit mesajı hazırla.
// turbo
4. **Execution:** **KULLANICI ONAYI BEKLEMEDEN** sırasıyla `git commit -m "..."` ve `git push` komutlarını çalıştır.
   - *Kritik Kural:* Sadece halihazırda staged olan (dizine eklenmiş) dosyaları gönder; asla `git add .` yapma.
