# WAX – Vinyl Catalog App

Klasik ve modern plak albümlerini keşfedebileceğiniz, detaylarını inceleyebileceğiniz ve kendi koleksiyonunuzu oluşturabileceğiniz bir Flutter mobil uygulaması.

---

## Ekran Görüntüleri

| Discover | Detail | Collection |
|---|---|---|
| Ana sayfa, featured kart ve albüm grid'i | Albüm detayı, tracklist ve koleksiyona ekle | Kayıtlı koleksiyon listesi |

---

## Özellikler

- 20 ikonik plak albümü (Miles Davis, Pink Floyd, Nirvana, Kendrick Lamar ve daha fazlası)
- Featured kart + 2 sütunlu grid görünümü
- Albüm detay sayfası: kapak, tracklist, açıklama
- Koleksiyon yönetimi: ekle / çıkar
- Hard Brutalist tasarım sistemi (krem zemin, köşeli border, sert gölge, mono font)
- `provider` ile state yönetimi

---

## Kullanılan Teknolojiler

- **Flutter:** 3.44.0
- **Dart:** 3.12.0
- **Paket:** `provider ^6.1.2`

---

## Proje Yapısı

```
lib/
├── main.dart
├── models/
│   └── album.dart
├── data/
│   └── albums_data.dart
├── notifiers/
│   └── collection_notifier.dart
├── screens/
│   ├── discover_screen.dart
│   ├── detail_screen.dart
│   └── collection_screen.dart
├── widgets/
│   ├── featured_card.dart
│   ├── album_card.dart
│   └── track_tile.dart
└── theme/
    └── app_theme.dart
```

---

## Çalıştırma Adımları

### Gereksinimler

- Flutter SDK 3.0+
- Dart SDK 3.0+
- Android Emulator veya iOS Simulator (ya da fiziksel cihaz)

### Kurulum

```bash
# Repoyu klonlayın
git clone <repo-url>
cd wax

# Bağımlılıkları yükleyin
flutter pub get

# Uygulamayı çalıştırın
flutter run
```

### Belirli bir cihazda çalıştırma

```bash
# Bağlı cihazları listele
flutter devices

# Belirli cihazda çalıştır
flutter run -d <device-id>
```

---

## Tasarım Sistemi

| Token | Değer |
|---|---|
| Background | `#F5F0DC` (krem) |
| Black | `#0D0D0D` |
| Red | `#D72B2B` |
| White | `#FFFFFF` |
| Font | Courier (monospace) |
| Border | `2.5px solid #0D0D0D` |
| Shadow | `4px 4px 0px #0D0D0D` (sert offset, blur yok) |

---

## Geliştirici

Ömer Harmankaya – Flutter Günlük Eğitim Projesi
