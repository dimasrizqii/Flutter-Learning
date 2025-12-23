import 'dart:io';

void main() {
  bool running = true;

  while (running) {
    print("\n=== MENU SOAL ===");
    print("1. Soal No. 1 - Ternary Operator");
    print("2. Soal No. 2 - If-Else (Werewolf Game)");
    print("3. Soal No. 3 - Switch Case (Quotes Harian)");
    print("4. Soal No. 4 - Switch Case (Format Tanggal)");
    print("5. Keluar");
    print("=================");

    stdout.write("Pilih nomor soal yang ingin dilihat (1-5): ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        soalNomor1();
        break;
      case '2':
        soalNomor2();
        break;
      case '3':
        soalNomor3();
        break;
      case '4':
        soalNomor4();
        break;
      case '5':
        print("\nTerima kasih! Program selesai.");
        running = false;
        break;
      default:
        print("\nPilihan tidak valid! Silakan pilih nomor 1-5.");
    }

    if (running && choice != '5') {
      print("\nTekan Enter untuk kembali ke menu...");
      stdin.readLineSync();
    }
  }
}

void soalNomor1() {
  print("\n=== SOAL NO. 1 - TERNARY OPERATOR ===\n");

  stdout.write("Apakah Anda ingin menginstall aplikasi? (Y/T): ");
  String? jawaban = stdin.readLineSync();

  String hasil = (jawaban?.toUpperCase() == 'Y')
      ? "Anda akan menginstall aplikasi dart"
      : "Aborted";

  print(hasil);
}

void soalNomor2() {
  print("\n=== SOAL NO. 2 - IF-ELSE (WEREWOLF GAME) ===\n");

  stdout.write("Masukkan nama: ");
  String? nama = stdin.readLineSync();

  stdout.write("Masukkan peran (Penyihir/Guard/Werewolf): ");
  String? peran = stdin.readLineSync();

  if (nama == null || nama.isEmpty || nama == '') {
    print("\nNama harus diisi!");
  } else if (peran == null || peran.isEmpty || peran == '') {
    print("\nHalo $nama, Pilih peranmu untuk memulai game!");
  } else {
    print("\nSelamat datang di Dunia Werewolf, $nama");

    if (peran.toLowerCase() == 'penyihir') {
      print("Halo Penyihir $nama, kamu dapat melihat siapa yang menjadi werewolf!");
    } else if (peran.toLowerCase() == 'guard') {
      print("Halo Guard $nama, kamu akan membantu melindungi temanmu dari serangan werewolf.");
    } else if (peran.toLowerCase() == 'werewolf') {
      print("Halo Werewolf $nama, Kamu akan memakan mangsa setiap malam!");
    } else {
      print("Peran tidak valid! Pilih antara Penyihir, Guard, atau Werewolf.");
    }
  }
}

void soalNomor3() {
  print("\n=== SOAL NO. 3 - SWITCH CASE (QUOTES HARIAN) ===\n");

  stdout.write("Masukkan hari (Senin/Selasa/Rabu/Kamis/Jumat/Sabtu/Minggu): ");
  String? hari = stdin.readLineSync();

  switch (hari?.toLowerCase()) {
    case 'senin':
      print("\nQuotes Hari Senin:");
      print("Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.");
      break;

    case 'selasa':
      print("\nQuotes Hari Selasa:");
      print("Setiap detik sangatlah berharga karena waktu mengetahui banyak hal, termasuk rahasia hati.");
      break;

    case 'rabu':
      print("\nQuotes Hari Rabu:");
      print("Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.");
      break;

    case 'kamis':
      print("\nQuotes Hari Kamis:");
      print("Jika hatimu banyak merasakan sakit, maka belajarlah dari rasa sakit itu untuk tidak memberikan rasa sakit pada orang lain.");
      break;

    case 'jumat':
      print("\nQuotes Hari Jumat:");
      print("Hidup tak selamanya tentang pacar.");
      break;

    case 'sabtu':
      print("\nQuotes Hari Sabtu:");
      print("Rumah bukan hanya sebuah tempat, tetapi itu adalah perasaan.");
      break;

    case 'minggu':
      print("\nQuotes Hari Minggu:");
      print("Hanya seseorang yang takut yang bisa bertindak berani. Tanpa rasa takut itu tidak ada apapun yang bisa disebut berani.");
      break;

    default:
      print("\nHari tidak valid! Masukkan nama hari dengan benar.");
  }
}

void soalNomor4() {
  print("\n=== SOAL NO. 4 - SWITCH CASE (FORMAT TANGGAL) ===\n");

  int tanggal;
  while (true) {
    stdout.write("Masukkan tanggal berapa (1-31): ");
    tanggal = int.parse(stdin.readLineSync()!);

    if (tanggal < 1 || tanggal > 31) {
      print("Tanggal tidak valid! Harus antara 1-31\n");
    } else {
      break;
    }
  }

  int bulan;
  while (true) {
    stdout.write("Masukkan bulan berapa (1-12): ");
    bulan = int.parse(stdin.readLineSync()!);

    if (bulan < 1 || bulan > 12) {
      print("Bulan tidak valid! Harus antara 1-12\n");
    } else {
      break;
    }
  }

  int tahun;
  while (true) {
    stdout.write("Masukkan tahun berapa (1900-2200): ");
    tahun = int.parse(stdin.readLineSync()!);

    if (tahun < 1900 || tahun > 2200) {
      print("Tahun tidak valid! Harus antara 1900-2200\n");
    } else {
      break;
    }
  }

  String? namaBulan;

  switch (bulan) {
    case 1:
      namaBulan = "Januari";
      break;
    case 2:
      namaBulan = "Februari";
      break;
    case 3:
      namaBulan = "Maret";
      break;
    case 4:
      namaBulan = "April";
      break;
    case 5:
      namaBulan = "Mei";
      break;
    case 6:
      namaBulan = "Juni";
      break;
    case 7:
      namaBulan = "Juli";
      break;
    case 8:
      namaBulan = "Agustus";
      break;
    case 9:
      namaBulan = "September";
      break;
    case 10:
      namaBulan = "Oktober";
      break;
    case 11:
      namaBulan = "November";
      break;
    case 12:
      namaBulan = "Desember";
      break;
  }

  print("Output: $tanggal $namaBulan $tahun");
}
