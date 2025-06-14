// https://youtu.be/DbY2D-CSUNc

PImage img;
boolean cambiarColor = false; 

int filas = 10;
int columnas = 10;

void setup() {
  size(800, 400);
  img = loadImage("F_42.png");  
}

void draw() {
  background(255);
  image(img, 0, 0, width/2, height);
  dibujarPatron(width/2, 0, width/2, height);
}

void dibujarPatron(float x, float y, float w, float h) {
  float espacioX = w / columnas;
  float espacioY = h / filas;

  for (int i = 0; i < columnas; i++) {
    for (int j = 0; j < filas; j++) {
      float posX = x + i * espacioX;
      float posY = y + j * espacioY;
      
      boolean esNegro = (i + j) % 2 == 0;
      
      if (esNegro) {
        fill(0);
      } else {
        if (cambiarColor) {
          fill(255, 0, 0);
        } else {
          fill(255);
        }
      }
      rect(posX, posY, espacioX, espacioY);
      

      float radio = calcularRadio(espacioX, espacioY);
      float centroX = posX + espacioX/2;
      float centroY = posY + espacioY/2;

      if (esNegro) {
   
        if (mouseSobreCirculo(centroX, centroY, radio)) {
          fill(255, 0, 0);
        } else {
          fill(255);
        }
      } else {
        fill(0);
      }
      
      ellipse(centroX, centroY, radio, radio);
    }
  }
}


float calcularRadio(float ancho, float alto) {
  float radio = min(ancho, alto) * 0.4;
  return radio;
}

boolean mouseSobreCirculo(float cx, float cy, float r) {
  float distancia = dist(mouseX, mouseY, cx, cy);
  return distancia < r/2;
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    cambiarColor = !cambiarColor;
  }
  
}
