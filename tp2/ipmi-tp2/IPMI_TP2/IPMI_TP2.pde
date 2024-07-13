PImage imagen1, imagen2, imagen3;
float posX;
float posY;
PFont fuente;
boolean comenzarMovimiento = false;
boolean textoFueraDePantalla = false;
boolean mostrarImagen3 = false;
boolean moverTextoAbajo = false;
int tiempoInicial; 

void setup() {
  size(600, 480);
  imagen1 = loadImage("Mario1.jpg");
  imagen2 = loadImage("Mario2.jpg");
  imagen3 = loadImage("Mario3.jpg");
  posX = width / 2;
  posY = height / 2;
  textAlign(CENTER, CENTER);
  fuente = createFont("Arial", 24);
  textFont(fuente);
  tiempoInicial = millis(); 
}

void draw() {
  background(255);
  image(imagen1, 0, 0);

  int tiempoTranscurrido = millis() - tiempoInicial; 

  textSize(24);
  if (tiempoTranscurrido >= 4000 && !comenzarMovimiento) {
    comenzarMovimiento = true;
  }
  if (comenzarMovimiento) {
    posX += 2;
  }
  if (posX - textWidth("Mario Bross consta de 8 mundos con 4 niveles cada uno") / 2 > width && !textoFueraDePantalla) {
    textoFueraDePantalla = true;
  }
  if (textoFueraDePantalla) {
    image(imagen2, 0, 0, width, height); 
    if (tiempoTranscurrido >= 7000) {
      textAlign(CENTER);
      text("El juego consta de ir a la derecha esquivando obstáculos", width / 2, height / 2);
      if (tiempoTranscurrido >= 10000) {
        mostrarImagen3 = true;
      }
    }
  } else {
    text("Mario Bross consta de 8 mundos con 4 niveles cada uno", posX, height / 2 + 50);
  }

  if (mostrarImagen3) {
    image(imagen3, 0, 0, width, height); 
    moverTextoAbajo = true;

    if (moverTextoAbajo) {
      posY += 2; 
    }

    fill(255, 255, 255);
    textAlign(CENTER);
    text("El nivel termina cuando tocas la bandera del final del nivel", width / 2, posY);
  }
}

void keyPressed() {
  if (key == 'r') { 
    posX = width / 2;
    posY = height / 2;
    comenzarMovimiento = false;
    textoFueraDePantalla = false;
    mostrarImagen3 = false;
    moverTextoAbajo = false;
    tiempoInicial = millis(); 
  }
}
