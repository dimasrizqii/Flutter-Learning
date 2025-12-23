import 'dart:io';

void main() {
  bool running = true;

  while (running) {
    print("\n=== MENU SOAL FUNCTION ===");
    print("1. Soal No. 1 - Function Teriak");
    print("2. Soal No. 2 - Function Kalikan");
    print("3. Soal No. 3 - Function Introduce");
    print("4. Soal No. 4 - Function Faktorial");
    print("5. Keluar");
    print("==========================");

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

String teriak() {
  return "Halo Sanbers!";
}

void soalNomor1() {
  print("\n=== SOAL NO. 1 - FUNCTION TERIAK ===\n");
  print(teriak());
}

int kalikan(int num1, int num2) {
  return num1 * num2;
}

void soalNomor2() {
  print("\n=== SOAL NO. 2 - FUNCTION KALIKAN ===\n");

  var num1 = 12;
  var num2 = 4;

  var hasilKali = kalikan(num1, num2);
  print("$num1 x $num2 = $hasilKali");
}

String introduce(String name, int age, String address, String hobby) {
  return "Nama saya $name, umur saya $age tahun, alamat saya di $address, dan saya punya hobby yaitu $hobby!";
}

void soalNomor3() {
  print("\n=== SOAL NO. 3 - FUNCTION INTRODUCE ===\n");

  var name = "Dimas Rizqi Ibadurrahim";
  var age = 23;
  var address = "Sidoarjo";
  var hobby = "Gaming";

  var perkenalan = introduce(name, age, address, hobby);
  print(perkenalan);
}

int faktorial(int angka) {
  if (angka <= 0) {
    return 1;
  } else {
    return angka * faktorial(angka - 1);
  }
}

void soalNomor4() {
  print("\n=== SOAL NO. 4 - FUNCTION FAKTORIAL ===\n");

  stdout.write("Masukkan nilai faktorial: ");
  int angka = int.parse(stdin.readLineSync()!);

  if (angka <= 0) {
    print("$angka! = ${faktorial(angka)} (*angka <= 0 return 1)");
  } else {
    print("$angka! = ${faktorial(angka)}");
  }
}
