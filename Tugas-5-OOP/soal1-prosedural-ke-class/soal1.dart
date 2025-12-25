import 'Segitiga.dart';

void main(List<String> args) {
  Segitiga segitiga1 = Segitiga(
    setengah: 0.5,
    alas: 20.0,
    tinggi: 30.0,
  );

  segitiga1.tampilkanLuas();

  var luasSegitiga = segitiga1.hitungLuas();
  print(luasSegitiga);
}
