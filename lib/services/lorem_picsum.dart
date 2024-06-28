class LoremPicsum {
  int accIndex = 0;

  LoremPicsum();

  String generate(int width, int height) {
    return "https://picsum.photos/id/${accIndex++}/350/250";
  }
}

final loremPicsum = LoremPicsum();
