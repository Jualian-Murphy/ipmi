void Colores() {
  int r = int(map(mouseX, 0, width, 0, int(random(0, 255))));
  int g = int(map(mouseY, 0, height, 0, 255));
  int b = int(map(mouseY, 0, height, 0, 255));
  translate(400, 0);
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if ((i + j) % 2 == 0) {
        fill(r, 0, b);
      } else {
        fill(0, g, 0);
      }
      rect(100 * i, 100 * j, 100, 100);
    }
  }
}
