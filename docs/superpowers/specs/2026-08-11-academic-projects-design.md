# Akademik Projeler Accordion Güncellemesi

## Amaç

`academic-projects.html` sayfasında güncel araştırma projelerini görsel referanstaki gibi başlık ve tarih satırlarıyla göstermek; ayrıntıları satır açıldığında görünür hale getirmek.

## Tasarım kararı

- Açılır-kapanır yapı için native HTML `details/summary` bileşenleri kullanılacak.
- Projeler, sitede zaten kullanılan `academic-accordion` sınıflarının görsel stilini yeniden kullanacak.
- Her satırda solda çalışma adı, sağda tarih ve açılır-kapanır ok gösterilecek.
- Yeni proje ilk satırda yer alacak.
- Mevcut Schwarzschild projesi ikinci ve son satırda yer alacak.
- Türkçe sayfada yeni projenin tarihi `AĞUSTOS 2026 - GÜNCEL` olarak yazılacak.
- İngilizce sayfada yeni projenin tarihi `AUGUST 2026 - CURRENT` olarak yazılacak.
- Türkçe sayfadaki mevcut projenin başlığı `Schwarzschild Uzay-Zamanının Konformal Kompaktlaştırılması ve Penrose Diyagramı` olacak.
- Türkçe sayfadaki mevcut projenin tarihi `KASIM 2025 - DEVAM EDİYOR` olarak yazılacak.
- İngilizce sayfada aynı proje İngilizce başlık ve açıklamalarla, `NOVEMBER 2025 - ONGOING` tarihiyle gösterilecek.
- Detay metni yalnızca ilgili satır açıldığında gösterilecek.

## Yeni proje içeriği

- Başlık: `Çıplak Tekillikler Etrafında Saçılma Dinamiği`
- Durum: `ÇALIŞMA AŞAMASINDA`
- Ortak çalışma: Sena Yarar
- Çalışma biçimi: Herhangi bir akademik danışmana bağlı olmadan bağımsız yürütülüyor.

## Mevcut proje içeriği

- Türkçe başlık: `Schwarzschild Uzay-Zamanının Konformal Kompaktlaştırılması ve Penrose Diyagramı`
- Türkçe tarih: `KASIM 2025 - DEVAM EDİYOR`
- İngilizce başlık: `Conformal Compactification and Penrose Diagram of the Schwarzschild Spacetime`
- İngilizce tarih: `NOVEMBER 2025 - ONGOING`
- Mevcut açıklama, durum ve bağımsız çalışma notu accordion detay alanında korunacak.

## Kapsam

- `academic-projects.html` ve `en/academic-projects.html` içindeki açık araştırma kartları native accordion satırlarına dönüştürülecek.
- İngilizce sayfada yeni projenin başlığı `Scattering Dynamics Around Naked Singularities` olacak; detay metni, durum ve danışmansız çalışma bilgisi İngilizce yazılacak.
- Mevcut `academic-accordion` CSS sınıfları yeniden kullanılacak; yeni bir stil sistemi eklenmeyecek.
- JavaScript, navigasyon ve diğer sayfalar değiştirilmeyecek.

## Kabul ölçütleri

1. Yeni proje ilk accordion satırı olarak görünür.
2. Türkçe yeni satırda çalışma adı, `AĞUSTOS 2026 - GÜNCEL` tarihi ve açılır ok bulunur.
3. Yeni satır açıldığında `ÇALIŞMA AŞAMASINDA`, Sena Yarar ile ortak çalışma ve bağımsız/danışmansız çalışma bilgisi görünür.
4. Türkçe Schwarzschild projesi ikinci ve son accordion satırı olarak görünür, Türkçe başlığı ve `KASIM 2025 - DEVAM EDİYOR` tarihini taşır.
5. Türkçe Schwarzschild satırı açıldığında mevcut açıklama, durum ve bağımsız çalışma notu görünür.
6. İngilizce sayfada iki accordion aynı sırada görünür; yeni proje İngilizce başlık, `AUGUST 2026 - CURRENT` tarihi, detay ve `IN PROGRESS` durumu taşır.
7. İngilizce Schwarzschild satırı İngilizce başlık, açıklama ve `NOVEMBER 2025 - ONGOING` tarihini taşır.
8. Mevcut iletişim kutusu ve sayfa navigasyonu korunur.
9. Accordion görünümü mevcut blog sayfasındaki tasarımla uyumludur ve klavye ile açılıp kapanabilir.

## Doğrulama

- Değişiklik sonrası `git diff --check` çalıştırılacak.
- Yeni accordion sayısı, içerik sırası ve tarih metinleri dosya içinden aranarak kontrol edilecek.
- Native `details/summary` etiketlerinin ve mevcut accordion CSS sınıflarının kullanıldığı doğrulanacak.
