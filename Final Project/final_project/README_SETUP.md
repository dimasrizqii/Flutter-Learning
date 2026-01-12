# ShopApp - Final Project Flutter

Aplikasi e-commerce yang dibuat menggunakan Flutter dengan fitur lengkap seperti authentication, API integration, dan state management menggunakan Bloc.

## Fitur Aplikasi

### 1. Splash Screen
- Tampilan awal aplikasi dengan animasi loading
- Otomatis redirect ke halaman login setelah 3 detik

### 2. Authentication (Firebase Auth)
- **Login**: User bisa login dengan email dan password
- **Register**: User bisa membuat akun baru dengan nama, email, dan password
- Validasi form dan error handling
- Auto-login jika user sudah pernah login

### 3. Home Page
- Menampilkan informasi user yang sedang login
- Grid kategori produk yang bisa diklik
- Kategori dari FakeStore API: Electronics, Jewelery, Men's Clothing, Women's Clothing
- Tombol "All Products" untuk melihat semua produk

### 4. Products Page (Data dari API)
- Menampilkan list produk dalam grid view
- Filter berdasarkan kategori
- Menampilkan gambar, nama, harga, dan rating produk
- Data dari API: https://fakestoreapi.com
- Bisa klik produk untuk melihat detail

### 5. Product Detail Page
- Menampilkan detail lengkap produk
- Gambar produk besar
- Nama, kategori, harga, rating, dan deskripsi
- Tombol "Add to Cart" (simulasi)

### 6. Profile Page
- Menampilkan informasi user (nama dan email)
- Menu About untuk informasi aplikasi
- Menu Help & Support dan Privacy Policy (placeholder)
- Tombol Logout dengan konfirmasi dialog

## Teknologi yang Digunakan

### State Management
- **flutter_bloc**: ^8.1.6
- **equatable**: ^2.0.5

### Routing
- **go_router**: ^14.6.2

### Firebase
- **firebase_core**: ^3.8.1
- **firebase_auth**: ^5.3.3

### API & Network
- **http**: ^1.2.2
- **dio**: ^5.7.0

### UI & Assets
- **cached_network_image**: ^3.4.1
- **smooth_page_indicator**: ^1.2.0+3

### Utils
- **intl**: ^0.19.0
- **shared_preferences**: ^2.3.3

## Struktur Folder

```
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   │   └── app_theme.dart
│   ├── utils/
│   └── router.dart
├── data/
│   ├── datasources/
│   │   └── product_remote_datasource.dart
│   ├── models/
│   │   └── product_model.dart
│   └── repositories/
│       └── product_repository_impl.dart
├── domain/
│   ├── entities/
│   └── repositories/
├── presentation/
│   ├── blocs/
│   │   ├── auth/
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   └── product/
│   │       ├── product_bloc.dart
│   │       ├── product_event.dart
│   │       └── product_state.dart
│   ├── pages/
│   │   ├── splash/
│   │   │   └── splash_page.dart
│   │   ├── auth/
│   │   │   ├── login_page.dart
│   │   │   └── register_page.dart
│   │   ├── home/
│   │   │   └── home_page.dart
│   │   ├── products/
│   │   │   ├── products_page.dart
│   │   │   └── product_detail_page.dart
│   │   └── profile/
│   │       └── profile_page.dart
│   └── widgets/
├── firebase_options.dart
└── main.dart
```

## Setup Firebase

### Langkah 1: Buat Project Firebase
1. Buka [Firebase Console](https://console.firebase.google.com/)
2. Klik "Add project" atau "Create a project"
3. Masukkan nama project (contoh: "ShopApp")
4. Ikuti langkah-langkah setup

### Langkah 2: Setup Firebase untuk Flutter
1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Login ke Firebase:
   ```bash
   firebase login
   ```

3. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```

4. Konfigurasi Firebase untuk project:
   ```bash
   flutterfire configure
   ```
   - Pilih project Firebase yang sudah dibuat
   - Pilih platform yang akan digunakan (Android/iOS/Web)
   - File `firebase_options.dart` akan otomatis ter-generate

### Langkah 3: Enable Firebase Authentication
1. Di Firebase Console, buka menu "Authentication"
2. Klik tab "Sign-in method"
3. Enable "Email/Password"
4. Klik "Save"

### Langkah 4: (Opsional) Setup untuk Android
Jika ingin menjalankan di Android:
1. Download file `google-services.json` dari Firebase Console
2. Letakkan file tersebut di `android/app/`
3. Update `android/build.gradle`:
   ```gradle
   dependencies {
       classpath 'com.google.gms:google-services:4.3.15'
   }
   ```
4. Update `android/app/build.gradle`:
   ```gradle
   apply plugin: 'com.google.gms.google-services'
   ```

## Cara Menjalankan Aplikasi

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Setup Firebase (Jika belum)
Ikuti langkah-langkah di atas untuk setup Firebase.

### 3. Jalankan Aplikasi
```bash
flutter run
```

atau untuk web:
```bash
flutter run -d chrome
```

## API yang Digunakan

### FakeStore API
- **Base URL**: https://fakestoreapi.com
- **Endpoints**:
  - `GET /products` - Mendapatkan semua produk
  - `GET /products/categories` - Mendapatkan semua kategori
  - `GET /products/category/{category}` - Mendapatkan produk berdasarkan kategori
  - `GET /products/{id}` - Mendapatkan detail produk

## Testing

### Test Login (Setelah Register)
1. Jalankan aplikasi
2. Klik "Sign Up" di halaman login
3. Isi form register dengan email dan password
4. Login dengan kredensial yang sudah dibuat

### Test Fitur
1. **Home**: Lihat kategori produk yang muncul dari API
2. **Products**: Klik salah satu kategori untuk melihat list produk
3. **Detail**: Klik salah satu produk untuk melihat detail
4. **Profile**: Klik icon profile di home untuk melihat halaman profile
5. **Logout**: Klik logout di halaman profile

## Troubleshooting

### Error: Firebase not initialized
Pastikan sudah menjalankan `flutterfire configure` dan file `firebase_options.dart` sudah ter-generate dengan benar.

### Error: API tidak bisa diakses
1. Pastikan device/emulator terkoneksi dengan internet
2. Cek apakah API FakeStore masih aktif: https://fakestoreapi.com/products

### Error: Build failed
```bash
flutter clean
flutter pub get
flutter run
```

## Catatan

- Aplikasi ini menggunakan FakeStore API yang merupakan public API gratis
- Firebase Authentication menggunakan Email/Password provider
- State management menggunakan Bloc pattern untuk scalability
- Clean Architecture untuk maintainability
- Go Router untuk navigation yang modern

## Screenshot

(Anda bisa menambahkan screenshot aplikasi di sini)

## Kontak

Jika ada pertanyaan atau masalah, silakan hubungi developer.

---
Dibuat dengan Flutter 💙
