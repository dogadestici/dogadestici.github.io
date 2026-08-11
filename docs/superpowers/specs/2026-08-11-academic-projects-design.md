# Akademik Projeler Accordion Güncellemesi

## Amaç

`academic-projects.html` sayfasında güncel araştırma projelerini görsel referanstaki gibi başlık ve tarih satırlarıyla göstermek; ayrıntıları satır açıldığında görünür hale getirmek.

## Tasarım kararı

- Açılır-kapanır yapı için native HTML `details/summary` bileşenleri kullanılacak.
- Projeler, sitede zaten kullanılan `academic-accordion` sınıflarının görsel stilini yeniden kullanacak.
- Her satırda solda çalışma adı, sağda tarih ve açılır-kapanır ok gösterilecek.
- Yeni proje ilk satırda yer alacak.
- Mevcut Schwarzschild projesi ikinci ve son satırda yer alacak.
- Yeni projenin tarihi `2026 AUGUST - CURRENT` olarak yazılacak.
- Mevcut projenin tarihi `2025 NOVEMBER` olarak yazılacak.
- Detay metni yalnızca ilgili satır açıldığında gösterilecek.

## Yeni proje içeriği

- Başlık: `Çıplak Tekillikler Etrafında Saçılma Dinamiği`
- Durum: `ÇALIŞMA AŞAMASINDA`
- Ortak çalışma: Sena Yarar
- Çalışma biçimi: Herhangi bir akademik danışmana bağlı olmadan bağımsız yürütülüyor.

## Mevcut proje içeriği

- Başlık: `Conformal Compactification and Penrose Diagram of the Schwarzschild Spacetime`
- Tarih: `2025 NOVEMBER`
- Mevcut açıklama, durum ve bağımsız çalışma notu accordion detay alanında korunacak.

## Kapsam

- `academic-projects.html` içindeki açık araştırma kartları native accordion satırlarına dönüştürülecek.
- Mevcut `academic-accordion` CSS sınıfları yeniden kullanılacak; yeni bir stil sistemi eklenmeyecek.
- JavaScript, navigasyon ve diğer sayfalar değiştirilmeyecek.

## Kabul ölçütleri

1. Yeni proje ilk accordion satırı olarak görünür.
2. Yeni satırda çalışma adı, `2026 AUGUST - CURRENT` tarihi ve açılır ok bulunur.
3. Yeni satır açıldığında `ÇALIŞMA AŞAMASINDA`, Sena Yarar ile ortak çalışma ve bağımsız/danışmansız çalışma bilgisi görünür.
4. Schwarzschild projesi ikinci ve son accordion satırı olarak görünür ve `2025 NOVEMBER` tarihini taşır.
5. Schwarzschild satırı açıldığında mevcut açıklama, durum ve bağımsız çalışma notu görünür.
6. Mevcut iletişim kutusu ve sayfa navigasyonu korunur.
7. Accordion görünümü mevcut blog sayfasındaki tasarımla uyumludur ve klavye ile açılıp kapanabilir.

## Doğrulama

- Değişiklik sonrası `git diff --check` çalıştırılacak.
- Yeni accordion sayısı, içerik sırası ve tarih metinleri dosya içinden aranarak kontrol edilecek.
- Native `details/summary` etiketlerinin ve mevcut accordion CSS sınıflarının kullanıldığı doğrulanacak.
