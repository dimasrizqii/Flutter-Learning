void main(List<String> args) {
  dataHandling(input);
}

var input = [
  ['0001', 'Dimas Rizqi Ibadurrahim', 'Surabaya', '25/01/2002', 'Coding'],
  ['0002', 'Aisyah Putri Maharani', 'Bandung', '15/08/1998', 'Melukis'],
  ['0003', 'Fajar Ramadhan', 'Yogyakarta', '03/11/1995', 'Fotografi'],
  ['0004', 'Siti Nurhaliza', 'Malang', '22/06/2000', 'Menulis']
];

void dataHandling(List<List<String>> data) {
  for (var person in data) {
    String nomorId = person[0];
    String namaLengkap = person[1];
    String tempatLahir = person[2];
    String tanggalLahir = person[3];
    String hobi = person[4];

    print('Nomor Id : $nomorId');
    print('Nama Lengkap : $namaLengkap');
    print('TTL : $tempatLahir $tanggalLahir');
    print('Hobi : $hobi');
    print('');
  }
}
