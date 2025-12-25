class Lingkaran {
  late double _ruas;

  void setRuas(double value) {
    if (value < 0) {
      _ruas = value * -1;
    } else {
      _ruas = value;
    }
  }

  double getRuas() => _ruas;

  double hitungLuas() {
    const double phi = 3.14;
    return phi * _ruas * _ruas;
  }
}
