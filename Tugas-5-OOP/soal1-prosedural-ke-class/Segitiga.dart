class Segitiga {
  double setengah;
  double alas;
  double tinggi;

  Segitiga({
    required this.setengah,
    required this.alas,
    required this.tinggi,
  });

  double hitungLuas() {
    return setengah * alas * tinggi;
  }

  void tampilkanLuas() {
    double luas = hitungLuas();
    print('Luas Segitiga: $luas');
  }
}