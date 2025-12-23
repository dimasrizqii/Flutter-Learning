List<int> rangeWithStep(int num1, int num2, int step) {
  List<int> result = [];

  if (num1 < num2) {
    for (int i = num1; i <= num2; i += step) {
      result.add(i);
    }
  } else {
    for (int i = num1; i >= num2; i -= step) {
      result.add(i);
    }
  }

  return result;
}

void main(List<String> args) {
  print(rangeWithStep(30, 23, 3));
}
