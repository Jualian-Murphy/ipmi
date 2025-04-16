PImage miImagen;

void setup(){
   size(800, 400);
   miImagen = loadImage("Reloj.jpg");
}

void draw(){
   background(134, 65, 0);
   
   // Imagen
   image(miImagen, 0, 0, 400, 400);
   
   // Correa
   fill(51, 144, 15); 
   noStroke(); 
   rect(550, 50, 50, 400); 
   
   // Las cosas de metal que tienen el reloj que no se como se llama
   fill(180);
   rect(550, 280, 50, 10);
   rect(550, 100, 50, 10);
   rect(550, 60, 50, 10);
   
   // Hebilla en la parte superior
   fill(160);
   rect(545, 30, 60, 20);
   rect(572, 20, 6, 20);
   fill(134, 65, 0); 
   rect(555, 35, 40, 10);
   fill(103);
   rect(572, 20, 6, 30);

   // Reloj
   fill(49, 49, 49);     
   ellipse(575, 200, 130, 130); // Marco
   fill(212, 252, 196);     
   ellipse(575, 200, 100, 100);
   fill(144, 250, 103);     
   ellipse(575, 200, 60, 60);
   fill(212, 252, 196); 
   ellipse(575, 200, 50, 50);
   rect(570, 210, 10, 20);

   // Agujas
   fill(71, 255, 0); 
   rect(572, 160, 6, 40);
   fill(255); 
   rect(573, 165, 2, 30);

   fill(71, 255, 0); 
   rect(575, 197, 40, 6); 
   fill(255); 
   rect(580, 198, 30, 2);

   // Botones laterales del reloj
   fill(49, 49, 49); 
   rect(630, 170, 10, 15); 
   rect(635, 195, 10, 15);
   rect(630, 220, 10, 15); 
}
