void main(List<String> args) {
  print('Life');

  Future.delayed(Duration(seconds: 3), () {
    print('Never Flat');
  });

  Future.delayed(Duration(seconds: 2), () {
    print('Is');
  });
}
