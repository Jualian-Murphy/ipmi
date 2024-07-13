// https://youtu.be/oNalO-H0cLo

PImage ObraReferencia;
void setup() {
  size(800, 400);
  ObraReferencia=loadImage("obra elegida.jpg");
}
void draw () {
  image(ObraReferencia, 0, 0, width/2, height);
 Colores();
 dibujarGrilla(7, 7, 10, 127);
  
}
