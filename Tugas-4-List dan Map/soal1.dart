List<int> range(int num1, int num2) {
  List<int> result = [];

  if (num1 < num2) {
    for (int i = num1; i <= num2; i++) {
      result.add(i);
    }
  } else {
    for (int i = num1; i >= num2; i--) {
      result.add(i);
    }
  }

  return result;
}

void main(List<String> args) {
  print(range(10, 1));
  print(range(1, 10));
}
