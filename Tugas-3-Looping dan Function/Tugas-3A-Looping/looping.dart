import 'dart:io';

void main() {
  bool running = true;

  while (running) {
    print("\n=== MENU SOAL LOOPING ===");
    print("1. Soal No. 1 - Looping While");
    print("2. Soal No. 2 - Looping For dengan Kondisi");
    print("3. Soal No. 3 - Membuat Persegi Panjang #");
    print("4. Soal No. 4 - Membuat Tangga #");
    print("5. Keluar");
    print("=========================");

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
  print("\n=== SOAL NO. 1 - LOOPING WHILE ===\n");

  print("LOOPING PERTAMA");
  var a = 2;
  while (a <= 20) {
    print('$a - I love coding');
    a += 2;
  }

  print("LOOPING KEDUA");
  var b = 20;
  while (b >= 2) {
    print('$b - I will become a mobile developer');
    b -= 2;
  }
}

void soalNomor2() {
  print("\n=== SOAL NO. 2 - LOOPING FOR DENGAN KONDISI ===\n");

  for (var i = 1; i <= 20; i++) {
    if (i % 3 == 0 && i % 2 == 1) {
      print('$i - I Love Coding');
    } else if (i % 2 == 0) {
      print('$i - Berkualitas');
    } else {
      print('$i - Santai');
    }
  }
}

void soalNomor3() {
  print("\n=== SOAL NO. 3 - MEMBUAT PERSEGI PANJANG # ===\n");

  var tinggi = 4;
  var lebar = 8;
  var baris = 0;

  while (baris < tinggi) {
    var kolom = 0;
    var line = '';
    while (kolom < lebar) {
      line += '#';
      kolom++;
    }
    print(line);
    baris++;
  }
}

void soalNomor4() {
  print("\n=== SOAL NO. 4 - MEMBUAT TANGGA # ===\n");

  var tinggi = 7;

  for (var i = 1; i <= tinggi; i++) {
    var line = '';
    for (var j = 1; j <= i; j++) {
      line += '#';
    }
    print(line);
  }
}
