# 🔐 VPN Connection Manager

A modern Flutter-based VPN connection manager application featuring a sleek UI, real-time connection monitoring, and multi-country server selection. Built with GetX state management and MVVM architecture for optimal performance and maintainability.

## 🚀 Features

- **Real-time Connection Monitoring**: Live connection status with timer display
- **Multi-Country Server Selection**: Browse and connect to VPN servers across different countries
- **Speed Analytics**: Monitor download/upload speeds in real-time
- **Search Functionality**: Quickly find countries or cities
- **Premium Features**: Crown access for premium functionalities
- **Responsive Design**: Optimized for various screen sizes and orientations

## 📋 Prerequisites

- Flutter SDK (≥ 3.10)
- Dart SDK (≥ 3.0)
- Android Studio / VS Code with Flutter extensions
- Android SDK / Xcode (for iOS development)

## 📦 Dependencies / Üçüncü Parti Paketler

### Core Dependencies / Temel Bağımlılıklar

Bu projede kullanılan üçüncü parti paketler ve kullanım amaçları:

- **flutter_svg**: ^2.0.12

  - **Amaç**: SVG formatındaki ikon ve grafiklerin desteklenmesi
  - **Kullanım**: Uygulamadaki vektörel iconların render edilmesi

- **cached_network_image**: ^3.4.1

  - **Amaç**: Network üzerinden gelen görsellerin önbelleklenmesi ve optimize edilmesi
  - **Kullanım**: Ülke bayrakları ve diğer görsellerin performanslı yüklenmesi

- **shared_preferences**: ^2.3.3

  - **Amaç**: Yerel veri saklama (key-value storage)
  - **Kullanım**: Kullanıcı tercihlerinin ve uygulama ayarlarının saklanması

- **connectivity_plus**: ^6.1.0 (şuanda mock data ile çalışma yaptığımız için bu paketi kaldırdım servicelere bağladıkdan sonra gerekli bir paket )

  - **Amaç**: Ağ bağlantı durumunun izlenmesi
  - **Kullanım**: İnternet bağlantısının kontrolü ve VPN durumu takibi

- **get**: ^4.6.6
  - **Amaç**: State management, dependency injection ve navigation
  - **Kullanım**: Uygulama genelinde durum yönetimi ve sayfa geçişleri

## 🏗️ Architecture / Proje Yapısı ve Mimari

Bu proje **MVVM (Model-View-ViewModel)** mimari desenini ve **GetX** state management çözümünü kullanır:

### Mimari Kararlar / Architectural Decisions

#### 1. MVVM Pattern Seçimi

- **Neden**: UI ve business logic'in ayrılması için
- **Avantaj**: Test edilebilirlik ve sürdürülebilirlik
- **Uygulama**: Controller sınıfları ViewModel görevi görür

#### 2. GetX State Management

- **Neden**: Minimal boilerplate kod ve yüksek performans
- **Avantaj**: Reactive programming ve dependency injection
- **Alternatifler**: Provider, BLoC, Riverpod (GetX tercih edildi)

#### 3. Feature-Based Folder Structure

- **Neden**: Modülerlik ve ölçeklenebilirlik
- **Avantaj**: Her özellik kendi klasöründe bağımsız
- **Sürdürülebilirlik**: Yeni özellik ekleme kolaylığı

### Proje Klasör Yapısı / Project Structure

```
lib/
├── core/                   # Çekirdek yardımcı sınıflar ve sabitler
│   ├── app_export.dart    # Merkezi export dosyası
│   └── utils/             # Yardımcı sınıflar
│       ├── image_constant.dart  # Görsel dosya yolları
│       └── size_utils.dart      # Responsive boyutlandırma
├── presentation/          # UI katmanı (Views)
│   ├── vpn_countries_selection_screen/
│   │   ├── vpn_countries_selection_screen.dart  # Ana ekran (View)
│   │   ├── controller/    # ViewModel katmanı (Controllers)
│   │   │   └── vpn_countries_selection_controller.dart
│   │   ├── models/        # Veri modelleri
│   │   │   ├── vpn_countries_selection_model.dart
│   │   │   └── country_item_model.dart
│   │   ├── widgets/       # Ekrana özel widget'lar
│   │   │   └── country_item_widget.dart
│   │   └── binding/       # Dependency injection
│   │       └── vpn_countries_selection_binding.dart
│   └── app_navigation_screen/  # Navigasyon ekranı
├── routes/                # Sayfa yönlendirme yapılandırması
│   └── app_routes.dart
├── theme/                 # Uygulama tema sistemi
│   ├── theme_helper.dart      # Ana tema tanımları
│   └── text_style_helper.dart # Metin stilleri
├── widgets/               # Tekrar kullanılabilir UI bileşenleri
│   ├── custom_icon_button.dart
│   └── custom_image_view.dart
└── main.dart             # Uygulama giriş noktası
```

### Key Components / Temel Bileşenler

#### Controllers (ViewModel Layer / ViewModel Katmanı)

- **VpnCountriesSelectionController**: VPN bağlantı durumu, ülke seçimi ve arama işlevlerini yönetir
- **GetX reactive programming** kullanır (`.obs` observables ile)

#### Models (Data Layer / Veri Katmanı)

- **VpnCountriesSelectionModel**: Ana bağlantı veri modeli
- **CountryItemModel**: Tekil ülke sunucu veri modeli

#### Views (UI Layer / UI Katmanı)

- **VpnCountriesSelectionScreen**: Birincil VPN arayüzü
- **CountryItemWidget**: Tekrar kullanılabilir ülke liste öğesi bileşeni

### State Management Pattern / Durum Yönetimi Deseni

#### GetX Kullanımı

```dart
// Controller örneği
class VpnCountriesSelectionController extends GetxController {
  Rx<VpnCountriesSelectionModel> vpnCountriesSelectionModelObj =
      VpnCountriesSelectionModel().obs;

  // Reactive değişkenler
  var isConnected = false.obs;
  var connectionTime = '00:00:00'.obs;

  void toggleConnection() {
    isConnected.value = !isConnected.value;
    update(); // UI'ı güncelle
  }
}

// View'da kullanım
class VpnCountriesSelectionScreen extends GetWidget<VpnCountriesSelectionController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
      controller.connectionTime.value,  // Reactive güncelleme
      style: theme.textTheme.headlineLarge,
    ));
  }
}
```

## 🎨 Design System / Tasarım Sistemi

### Color Palette / Renk Paleti

```dart
// Ana renkler
Color(0xFF1A3B5C) // Primary Blue
Color(0xFF000008) // Dark Text
Color(0xFFF0F5FF) // Background
Color(0xFF3B74AA) // Secondary Blue

// Durum renkleri
Color(0xFF00C851) // Success/Download (Yeşil)
Color(0xFFFF4444) // Error/Upload (Kırmızı)
```

### Responsive Design / Duyarlı Tasarım

Uygulama Figma spesifikasyonlarına dayalı duyarlı tasarım sistemi kullanır:

- **Base Width**: 360px
- **Base Height**: 800px
- **Responsive Units**: Yükseklik tabanlı ölçeklendirme için `.h` uzantısı

```dart
// Kullanım örneği
Container(
  width: 50.h,    // Duyarlı genişlik
  height: 20.h,   // Duyarlı yükseklik
  margin: EdgeInsets.symmetric(horizontal: 16.h),
)
```

## 🔧 Key Features Implementation / Ana Özellik Uygulamaları

### 1. Connection Status Display / Bağlantı Durumu Gösterimi

```dart
// Gerçek zamanlı bağlantı sayacı
Obx(() => Text(
  '${controller.hours}:${controller.minutes}:${controller.seconds}',
  style: CustomTextStyles.headlineLarge,
))
```

### 2. Country Search / Ülke Arama

```dart
// Gerçek zamanlı filtreleme ile arama işlevi
void onSearchChanged(String value) {
  final filteredList = countryItemsList.where((country) {
    return country.countryName!.toLowerCase().contains(value.toLowerCase());
  }).toList();
  countryItemsList.value = filteredList;
}
```

### 3. Speed Monitoring / Hız İzleme

```dart
// Renk kodlamalı indirme/yükleme hız kartları
Container(
  decoration: BoxDecoration(
    color: Color(0xFF00C851), // İndirme için yeşil
    borderRadius: BorderRadius.circular(8.h),
  ),
  child: SpeedWidget(speed: controller.downloadSpeed),
)
```

## 🚀 Getting Started / Yeni Özellik Ekleme

### Adding New Screens / Yeni Ekran Ekleme

1. Ekran dizin yapısını oluşturun:

```
lib/presentation/new_screen/
├── new_screen.dart
├── controller/
│   └── new_screen_controller.dart
├── models/
│   └── new_screen_model.dart
├── binding/
│   └── new_screen_binding.dart
└── widgets/
    └── custom_widget.dart
```

2. `app_routes.dart` dosyasına route kaydedin:

```dart
static const String newScreen = '/new_screen';

static List<GetPage> pages = [
  GetPage(
    name: newScreen,
    page: () => NewScreen(),
    bindings: [NewScreenBinding()],
  ),
];
```

## 📱 Platform Support / Platform Desteği

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 12.0+)
- ✅ **Web** (Progressive Web App)

## 📊 Performance / Performans

### Optimization Features / Optimizasyon Özellikleri

- **Cached Network Images**: Bant genişliği azaltır ve yükleme süresini iyileştirir
- **Lazy Loading**: Verimli kaydırma için ListView.separated
- **State Management**: Minimal rebuild için GetX
- **Asset Optimization**: Ölçeklenebilirlik için SVG iconlar

### Memory Management / Bellek Yönetimi

- `onClose()` ile uygun controller disposal
- GetX ile verimli observable kullanımı
- Otomatik temizlemeli görsel önbellekleme

## 🔐 Security / Güvenlik

### Best Practices Implemented / Uygulanan En İyi Uygulamalar

- **No Hardcoded Secrets**: Hassas veriler için environment variables kullanımı
- **Network Security**: Üretim için certificate pinning uygulaması
- **Data Encryption**: Hassas kullanıcı verileri için güvenli depolama

### Code Style Guidelines / Kod Stil Kılavuzu

- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style) takip edin
- State management için GetX patternleri kullanın
- MVVM mimari yapısını koruyun
- Yeni özellikler için kapsamlı testler yazın

## 🙏 Acknowledgments

- **Flutter Team** - Amazing framework için
- **GetX Community** - Güçlü state management çözümü için
- **Material Design** - Tasarım ilhamı ve bileşenler için
- Modern Flutter geliştirme uygulamaları ile ❤️ ile yapılmıştır
