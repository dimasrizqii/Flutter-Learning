import 'dart:io';
import 'Lingkaran.dart';

void main(List<String> args) {
  bool lanjut = true;

  while (lanjut) {
    print('\n=== Program Hitung Luas Lingkaran ===');
    print('Pilih menu:');
    print('1. Hitung Luas Lingkaran');
    print('2. Keluar');
    stdout.write('Pilihan Anda: ');

    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        print('\n=== Menghitung Luas Lingkaran ===');
        stdout.write('Masukkan jari-jari lingkaran: ');
        String? input = stdin.readLineSync();

        if (input != null && input.isNotEmpty) {
          try {
            double nilaiInput = double.parse(input);

            Lingkaran lingkaran = Lingkaran();
            lingkaran.setRuas(nilaiInput);

            print('\n=== HASIL ===');
            print('Input yang Anda masukkan: $nilaiInput');

            if (nilaiInput < 0) {
              print('Status: Nilai negatif terdeteksi!');
              print('Nilai telah dikonversi menjadi positif: ${lingkaran.getRuas()}');
            } else {
              print('Status: Nilai positif');
              print('Jari-jari: ${lingkaran.getRuas()}');
            }

            print('Luas Lingkaran: ${lingkaran.hitungLuas().toStringAsFixed(2)}');
          } catch (e) {
            print('Error: Input harus berupa angka!');
          }
        } else {
          print('Input tidak valid!');
        }
        break;

      case '2':
        print('\nTerima kasih telah menggunakan program ini!');
        lanjut = false;
        break;

      default:
        print('\nPilihan tidak valid! Silakan pilih 1 atau 2.');
        break;
    }
  }
}
