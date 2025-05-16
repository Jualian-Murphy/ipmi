PImage Imagen1, Imagen2, Imagen3;
float posX;
boolean startMoving = false;
boolean textOffScreen = false;
boolean fadeInText = false;
boolean fadeOutText = false;
boolean showImagen3 = false;
float alpha = 0;
boolean fadeInImagen3Text = false;

void setup() {
  size(640, 480);
  Imagen1 = loadImage("Mario1.jpg");
  Imagen2 = loadImage("Mario2.jpg");
  Imagen3 = loadImage("Mario3.jpg");
  posX = width / 2;
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);

  
  if (!textOffScreen) {
    image(Imagen1, 0, 0, width, height);
  }

 
  if (textOffScreen && !showImagen3) {
    image(Imagen2, 0, 0, width, height);
  }

  
  if (showImagen3) {
    image(Imagen3, 0, 0, width, height);

    if (!fadeInImagen3Text) {
      alpha = 0;
      fadeInImagen3Text = true;
    }

    if (alpha < 255) {
      alpha += 5;
    } else {
      alpha = 255;
    }

    fill(255, 255, 255, alpha);
    text("Si agarras la bandera del final ganas", width / 2, height / 2);
  }

  textSize(24);
  if (millis() >= 4000 && !startMoving) {
    startMoving = true;
  }

  if (startMoving) {
    posX += 2;
  }

  if (posX - textWidth("Mario es un juego de plataformas.") / 2 > width && !textOffScreen) {
    textOffScreen = true;
  }

  if (textOffScreen && !showImagen3) {
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
    } else if (fadeOutText) {
      alpha -= 2;
      if (alpha <= 0) {
        alpha = 0;
        fadeInText = false;
        fadeOutText = false;
        showImagen3 = true;
      }
    }

    fill(255, 255, 255, alpha);
    text("Los controles son moverse a los lados y saltar.", width / 2, height / 2);
  }

  if (!textOffScreen) {
    fill(0);
    text("Mario es un juego de plataformas.", posX, height / 2 + 50);
  }
}

void keyPressed() {
  if (key == ' ') {
    posX = width / 2;
    startMoving = false;
    textOffScreen = false;
    fadeInText = false;
    fadeOutText = false;
    showImagen3 = false;
    fadeInImagen3Text = false;
    alpha = 0;
  }
}
