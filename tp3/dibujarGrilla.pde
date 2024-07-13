void dibujarGrilla(int numVerticales, int numHorizontales, int grosor, int transparencia) {
  stroke(255, transparencia); 
  strokeWeight(grosor); 

  float espacioVertical = (width / 2) / numVerticales;
  float espacioHorizontal = height / numHorizontales;

  for (int i = 0; i <= numVerticales; i++) {
    float x = width / 2 + i * espacioVertical;
    line(x, 0, x, height);
    for (int j = 0; j <= numHorizontales; j++) {
      float y = j * espacioHorizontal;
      if (i > 0 && j > 0) { 
        point(x, y);
      }
    }
  }

  for (int j = 0; j <= numHorizontales; j++) {
    float y = j * espacioHorizontal;
    line(width / 2, y, width, y);
    for (int i = 0; i <= numVerticales; i++) {
      float x = width / 2 + i * espacioVertical;
      if (i > 0 && j > 0) { 
        point(x, y);
      }
    }
  }
}
