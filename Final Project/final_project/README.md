# ShopApp - Dokumentasi Aplikasi

## 📱 Deskripsi Aplikasi

**ShopApp** adalah aplikasi e-commerce mobile yang dibangun menggunakan Flutter. Aplikasi ini memungkinkan pengguna untuk browsing produk berdasarkan kategori, menambahkan produk ke keranjang belanja, dan mengelola akun mereka dengan autentikasi Firebase. 

Aplikasi ini mengimplementasikan arsitektur Clean Architecture dengan BLoC (Business Logic Component) pattern untuk state management, memastikan kode yang terstruktur, scalable, dan mudah di-maintain.

---

## ✨ Fitur Utama

### 1. **Autentikasi Pengguna**
- **Login**: Pengguna dapat masuk menggunakan email dan password
- **Register**: Pendaftaran akun baru dengan validasi form
- **Firebase Authentication**: Autentikasi terintegrasi dengan Firebase Auth
- **State Persistence**: Session pengguna tersimpan secara otomatis

### 2. **Manajemen Produk**
- **Katalog Produk**: Menampilkan semua produk dari API
- **Kategori Produk**: Filter produk berdasarkan kategori (Electronics, Jewelry, Men's Clothing, Women's Clothing)
- **Detail Produk**: Halaman detail lengkap dengan informasi produk, gambar, harga, rating, dan deskripsi
- **Caching Gambar**: Implementasi cached network images untuk performa optimal

### 3. **Keranjang Belanja (Shopping Cart)**
- **Tambah ke Keranjang**: Menambahkan produk dengan quantity yang dapat disesuaikan
- **Update Quantity**: Increase/decrease quantity produk di keranjang
- **Hapus Item**: Menghapus item individual atau clear semua item
- **Firestore Integration**: Data keranjang tersimpan di Cloud Firestore
- **Real-time Sync**: Sinkronisasi real-time keranjang antar devices
- **Perhitungan Subtotal & Total**: Otomatis menghitung total harga

### 4. **Navigasi dan UI/UX**
- **Splash Screen**: Layar pembuka dengan branding aplikasi
- **Onboarding**: Pengenalan fitur aplikasi untuk pengguna baru
- **Bottom Navigation**: Navigasi mudah antar halaman utama
- **Responsive Design**: Tampilan responsive untuk berbagai ukuran layar
- **Material Design 3**: Menggunakan design system terbaru dari Flutter

### 5. **Profil Pengguna**
- **Informasi Akun**: Menampilkan data pengguna yang sedang login
- **Logout**: Keluar dari aplikasi dengan aman

---

## 🔌 API yang Digunakan

### 1. **Fake Store API** (https://fakestoreapi.com)

API eksternal untuk mendapatkan data produk e-commerce. Aplikasi menggunakan beberapa endpoint:

#### Endpoints:

| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/products` | GET | Mengambil semua produk |
| `/products/{id}` | GET | Mengambil detail produk berdasarkan ID |
| `/products/categories` | GET | Mengambil daftar kategori produk |
| `/products/category/{category}` | GET | Mengambil produk berdasarkan kategori |

#### Model Data Product:
```json
{
  "id": 1,
  "title": "Product Name",
  "price": 109.95,
  "description": "Product description",
  "category": "electronics",
  "image": "https://fakestoreapi.com/img/...",
  "rating": {
    "rate": 3.9,
    "count": 120
  }
}
```

### 2. **Firebase Services**

#### a. **Firebase Authentication**
- **Package**: `firebase_auth: ^6.1.3`
- **Fungsi**: Autentikasi pengguna dengan email dan password
- **Methods**:
  - `signInWithEmailAndPassword()` - Login pengguna
  - `createUserWithEmailAndPassword()` - Registrasi pengguna baru
  - `signOut()` - Logout pengguna
  - `updateDisplayName()` - Update nama pengguna

#### b. **Cloud Firestore**
- **Package**: `cloud_firestore: ^6.1.1`
- **Fungsi**: Menyimpan dan sinkronisasi data keranjang belanja
- **Collection Structure**:
  ```
  carts/
    ├── {userId}/
    │   └── items/
    │       └── {productId}
    │           ├── productId: int
    │           ├── title: string
    │           ├── price: double
    │           ├── quantity: int
    │           ├── image: string
    │           ├── userId: string
    │           ├── userName: string
    │           └── addedAt: timestamp
  ```

#### c. **Firebase Core**
- **Package**: `firebase_core: ^4.3.0`
- **Fungsi**: Inisialisasi Firebase dan konfigurasi platform

---

## 🏗️ Arsitektur Aplikasi

### Clean Architecture

Aplikasi menggunakan Clean Architecture dengan pembagian layer:

```
lib/
├── core/                    # Konfigurasi inti aplikasi
│   ├── router.dart          # Routing dengan GoRouter
│   └── theme/               # Tema aplikasi
├── data/                    # Data layer
│   ├── datasources/         # Remote data sources
│   │   └── product_remote_datasource.dart
│   ├── models/              # Data models
│   │   ├── cart_item.dart
│   │   └── product_model.dart
│   └── repositories/        # Repository implementations
│       ├── cart_repository_impl.dart
│       └── product_repository_impl.dart
├── domain/                  # Domain layer (business logic)
├── presentation/            # Presentation layer
│   ├── blocs/               # BLoC state management
│   │   ├── auth/            # Authentication BLoC
│   │   ├── cart/            # Cart BLoC
│   │   └── product/         # Product BLoC
│   └── pages/               # UI pages
│       ├── auth/            # Login & Register
│       ├── cart/            # Cart page
│       ├── home/            # Home page
│       ├── products/        # Product list & detail
│       ├── profile/         # Profile page
│       ├── splash/          # Splash screen
│       └── onboarding/      # Onboarding
└── main.dart                # Entry point
```

### State Management: BLoC Pattern

Aplikasi menggunakan **flutter_bloc** untuk state management:

- **AuthBloc**: Mengelola state autentikasi pengguna
- **ProductBloc**: Mengelola state produk dan kategori
- **CartBloc**: Mengelola state keranjang belanja

---

## 📦 Dependencies

### State Management
- `flutter_bloc: ^9.1.1` - BLoC pattern untuk state management
- `equatable: ^2.0.5` - Equality comparison untuk state

### Routing
- `go_router: ^17.0.1` - Declarative routing

### Firebase
- `firebase_core: ^4.3.0` - Firebase initialization
- `firebase_auth: ^6.1.3` - Authentication
- `cloud_firestore: ^6.1.1` - Cloud database

### Network & API
- `http: ^1.2.2` - HTTP client untuk REST API
- `dio: ^5.7.0` - Advanced HTTP client

### Storage
- `shared_preferences: ^2.3.3` - Local storage untuk preferences

### UI & Assets
- `cached_network_image: ^3.4.1` - Image caching
- `smooth_page_indicator: ^2.0.1` - Page indicators

### Utils
- `intl: ^0.20.2` - Internationalization & formatting (currency, date)

---

## 🚀 Cara Menjalankan Aplikasi

### Prerequisites
- Flutter SDK (^3.10.4)
- Firebase Project dengan konfigurasi (Android/iOS)
- Editor (VS Code / Android Studio)

### Langkah-langkah:

1. **Clone repository**
   ```bash
   git clone <repository-url>
   cd final_project
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup Firebase**
   - Pastikan file `firebase_options.dart` sudah dikonfigurasi
   - Setup Firebase project di console.firebase.google.com
   - Enable Authentication (Email/Password)
   - Enable Cloud Firestore

4. **Run aplikasi**
   ```bash
   flutter run
   ```

---

## 📸 Screenshots

### Flow Aplikasi:
1. **Splash Screen** → Layar pembuka
2. **Onboarding** → Pengenalan fitur (first time user)
3. **Login/Register** → Autentikasi
4. **Home** → Kategori produk
5. **Products** → Daftar produk
6. **Product Detail** → Detail dan add to cart
7. **Cart** → Keranjang belanja
8. **Profile** → Informasi pengguna

---

## 👨‍💻 Developer Notes

### Design Patterns
- **Repository Pattern**: Abstraksi data sources
- **BLoC Pattern**: Separation of concerns untuk UI dan business logic
- **Dependency Injection**: Passing dependencies via constructors

### Best Practices
- Validasi form pada login/register
- Error handling pada API calls
- Loading states untuk UX yang lebih baik
- Responsive layout
- Cached images untuk performa

### Future Enhancements
- [ ] Payment gateway integration
- [ ] Order history
- [ ] Product search & filters
- [ ] Wishlist feature
- [ ] User reviews & ratings
- [ ] Push notifications
- [ ] Multi-language support

---

**Versi**: 1.0.0  
**Last Updated**: January 2026  
**Built with**: Flutter & Firebase ❤️
