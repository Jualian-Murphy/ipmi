PImage Imagen1, Imagen2, Imagen3;
float posX;
float posY;
PFont font;
boolean startMoving = false;
boolean textOffScreen = false;
boolean fadeInText = false;
boolean fadeOutText = false;
boolean showImagen3 = false;
boolean moveTextDown = false;
float alpha = 0;

void setup() {
  size(600, 480);
  Imagen1 = loadImage("Mario1.jpg");
  Imagen2 = loadImage("Mario2.jpg");
  Imagen3 = loadImage("Mario3.jpg");
  posX = width/2;
  posY = height/2;
  textAlign(CENTER, CENTER);
  font = createFont("Arial", 24); // Crear la fuente Arial de tamaño 24
  textFont(font);
}

void draw() {
  background(255);
  image(Imagen1, 0, 0);
  
  textSize(24);
  if (millis() >= 4000 && !startMoving) {
    startMoving = true;
  }
  if (startMoving) {
    posX += 2; 
  }
  if (posX - textWidth("Mario Bross consta de 8 mundos con 4 niveles cada uno")/2 > width && !textOffScreen) {
    textOffScreen = true;
  }
  if (textOffScreen) {
    image(Imagen2, 0, 0, width, height); 
    if (millis() >= 7000 && !fadeInText) {
      fadeInText = true;
    }
    if (fadeInText && !fadeOutText) {
      alpha += 5;
      if (alpha >= 255) {
        alpha = 255;
        if (millis() >= 10000) {
          fadeOutText = true;
        }
      }
      fill(0, 0, 0, alpha);
      textAlign(CENTER);
      text("El juego consta de ir a la derecha esquivando obstáculos", width/2, height/2);
    }
    else if (fadeOutText) {
      alpha -= 2;
      if (alpha <= 0) {
        alpha = 0;
        fadeInText = false;
        showImagen3 = true;
      }
      fill(0, 0, 0, alpha);
      textAlign(CENTER);
      text("El juego consta de ir a la derecha esquivando obstáculos", width/2, height/2);
    }
  }
  else {
    text("Mario Bross consta de 8 mundos con 4 niveles cada uno", posX, height/2 + 50);
  }
  
  if (showImagen3) {
    image(Imagen3, 0, 0, width, height); 
    if (alpha < 255 && !moveTextDown) {
      alpha += 5; 
    } else if (alpha >= 255) {
      moveTextDown = true;
    }

    if (moveTextDown) {
      posY += 2; // Mover el texto hacia abajo
    }

    fill(255, 255, 255, alpha);
    textAlign(CENTER);
    text("El nivel termina cuando tocas la bandera del final del nivel", width/2, posY);
  }
}

void keyPressed() {
  if (key == 'r') { 
    posX = width/2;
    posY = height/2;
    startMoving = false;
    textOffScreen = false;
    fadeInText = false;
    fadeOutText = false;
    showImagen3 = false;
    moveTextDown = false;
    alpha = 0;
  }
}
