import 'dart:io';

void main() {
  bool running = true;

  while (running) {
    print("\n=== MENU SOAL ===");
    print("1. Soal No. 1 - Membuat Kalimat");
    print("2. Soal No. 2 - Mengurai Kalimat");
    print("3. Soal No. 3 - Input Nama Lengkap");
    print("4. Soal No. 4 - Operasi Matematika");
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
  print("\n=== SOAL NO. 1 - MEMBUAT KALIMAT ===\n");

  var word = 'dart';
  var second = 'is';
  var third = 'awesome';
  var fourth = 'and';
  var fifth = 'I';
  var sixth = 'love';
  var seventh = 'it!';

  var firstWord = word[0].toUpperCase() + word.substring(1);

  var sentence = '$firstWord $second $third $fourth $fifth $sixth $seventh';

  print('Output: $sentence');
}

void soalNomor2() {
  print("\n=== SOAL NO. 2 - MENGURAI KALIMAT ===\n");

  var sentence = "I am going to be Flutter Developer";

  var exampleFirstWord = sentence[0];
  var exampleSecondWord = sentence[2].toString() + sentence[3];
  var thirdWord = sentence[5].toString() + sentence[6] + sentence[7] + sentence[8] + sentence[9];
  var fourthWord = sentence[11].toString() + sentence[12];
  var fifthWord = sentence[14].toString() + sentence[15];
  var sixthWord = sentence[17].toString() + sentence[18] + sentence[19] + sentence[20] + sentence[21] + sentence[22] + sentence[23];
  var seventhWord = sentence[25].toString() + sentence[26] + sentence[27] + sentence[28] + sentence[29] + sentence[30] + sentence[31] + sentence[32] + sentence[33];

  print('First Word: ' + exampleFirstWord);
  print('Second Word: ' + exampleSecondWord);
  print('Third Word: ' + thirdWord);
  print('Fourth Word: ' + fourthWord);
  print('Fifth Word: ' + fifthWord);
  print('Sixth Word: ' + sixthWord);
  print('Seventh Word: ' + seventhWord);
}

void soalNomor3() {
  print("\n=== SOAL NO. 3 - INPUT NAMA LENGKAP ===\n");

  stdout.write("Masukkan nama depan: ");
  var namaDepan = stdin.readLineSync();

  stdout.write("Masukkan nama belakang: ");
  var namaBelakang = stdin.readLineSync();

  print("\nNama lengkap anda adalah:");
  print('$namaDepan $namaBelakang');
}

void soalNomor4() {
  print("\n=== SOAL NO. 4 - OPERASI MATEMATIKA ===\n");

  stdout.write("Masukkan nilai a: ");
  var a = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan nilai b: ");
  var b = int.parse(stdin.readLineSync()!);

  print("=================");

  var perkalian = a * b;
  var penjumlahan = a + b;
  var pengurangan = a - b;
  var pembagian = a / b;

  print('Penjumlahan: $a + $b = $penjumlahan');
  print('Pengurangan: $a - $b = $pengurangan');
  print('Perkalian: $a * $b = $perkalian');
  print('Pembagian: $a / $b = $pembagian');
}
