class Human {
  String name = "Nama Character One Piece";

  Future<void> getName() async {
    await Future.delayed(Duration(seconds: 3));
    name = "Deemaz Rizz Q\n";
    print("Get Data[DONE]");
    print("======");
  }
}

void main(List<String> args) async {
  var h = Human();

  print("Luffy");
  print("Zorro");
  print("Killer");
  print("======");
  print(h.name);

  await h.getName();

  print(h.name);
}
