# Akademik Projeler Sayfası Güncellemesi

## Amaç

`academic-projects.html` sayfasında güncel araştırma projelerini kronolojik ve açık biçimde göstermek.

## Tasarım kararı

- Sayfanın mevcut araştırma kartı düzeni korunacak.
- Yeni proje kartı mevcut kartın üstünde yer alacak.
- Mevcut Schwarzschild projesi sayfanın en altında kalacak.
- Her kartta tarih, durum etiketinin üstünde ayrı bir meta satırı olarak gösterilecek.
- Yeni projenin tarihi `2026 AUGUST - CURRENT` olarak yazılacak.
- Mevcut projenin tarihi `2025 NOVEMBER` olarak yazılacak.

## Yeni proje içeriği

- Başlık: `Çıplak Tekillikler Etrafında Saçılma Dinamiği`
- Durum: `ÇALIŞMA AŞAMASINDA`
- Ortak çalışma: Sena Yarar
- Çalışma biçimi: Herhangi bir akademik danışmana bağlı olmadan bağımsız yürütülüyor.

## Kapsam

- Yalnızca `academic-projects.html` değiştirilecek.
- Mevcut CSS değişkenleri ve kart görsel dili kullanılacak.
- JavaScript, navigasyon ve diğer sayfalar değiştirilmeyecek.

## Kabul ölçütleri

1. Yeni proje kartı sayfada ilk araştırma kartı olarak görünür.
2. Yeni kartta başlık, `ÇALIŞMA AŞAMASINDA`, `2026 AUGUST - CURRENT`, Sena Yarar ile ortak çalışma ve bağımsız/danışmansız çalışma bilgisi bulunur.
3. Schwarzschild kartı yeni kartın altında görünür ve `2025 NOVEMBER` tarihini taşır.
4. Mevcut iletişim kutusu ve sayfa navigasyonu korunur.
5. HTML yapısı doğrulanabilir ve yeni tarih satırı mevcut tasarımla uyumludur.

## Doğrulama

- Değişiklik sonrası `git diff --check` çalıştırılacak.
- Yeni içerik ve kart sırası dosya içinden aranarak kontrol edilecek.
