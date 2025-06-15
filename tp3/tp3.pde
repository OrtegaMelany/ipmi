//https://youtu.be/afPyQFCA6qI (enlace del video en youtube)

PImage miImagen;   
boolean mostrarLineasVerticales =false;
boolean mostrarLineasVerticalesAbajo =false; 
boolean mostrarLineasHorizontales =false;
boolean mostrarLineasHorizontalesAbajo =false;

float escalaRombo =1;
boolean animarRombo =false;
boolean achicando =true;

color colorIzquierdaArriba = color(247, 190, 218);
color colorIzquierdaAbajo = color(247, 190, 218);
color colorDerechaArriba = color(247, 190, 218);
color colorDerechaAbajo = color(247, 190, 218);

boolean reiniciarBoolean(boolean valor, boolean reiniciar) {
  if (reiniciar) return false;
  return valor;
}

float reiniciarFloat(float valor, boolean reiniciar) {
  if (reiniciar) return 1.0;
  return valor;
}

color reiniciarColor(color c, boolean reiniciar) {
  if (reiniciar) return color(247, 190, 218);
  return c;
}

void setup(){
size(800,400);
noFill();
miImagen = loadImage("Op_art.png");
}

void draw(){ 
  background(188,0,3);
  image(miImagen, 0, 0, 400, 400);
  dibujarObra();
  dibujarRombo();
  strokeWeight(1);
}
  

void mousePressed(){
  //cuadrante izquiedo arriba
  if (mouseX >= 420 && mouseX <= 598 && mouseY >= 20 && mouseY <= 195) {
  mostrarLineasVerticales= !mostrarLineasVerticales;
  colorIzquierdaArriba = color(random(255), random(255), random(255));
  }
  //cuadrante izquierda abajo
  if (mouseX >=421  && mouseX <=594  && mouseY >=202  && mouseY <=379 ) {
  mostrarLineasHorizontalesAbajo=!mostrarLineasHorizontalesAbajo;
  colorIzquierdaAbajo = color(random(255), random(255), random(255));
  }  
  //cuadrante derecho abajo
  if (mouseX >= 603 && mouseX <= 780 && mouseY >= 206 && mouseY <= 380) {
  mostrarLineasVerticalesAbajo= !mostrarLineasVerticalesAbajo;
  colorDerechaAbajo = color(random(255), random(255), random(255));
 }
  //cuadrante derecho arriba
  if (mouseX >= 601 && mouseX <= 780 && mouseY >= 20 && mouseY <= 199) {
  mostrarLineasHorizontales= !mostrarLineasHorizontales;
  colorDerechaArriba = color(random(255), random(255), random(255));
  }
  
  //centro del rombo
   if (mouseX >= 550 && mouseX <= 650 && mouseY >= 150 && mouseY <= 250 && !animarRombo) {
    animarRombo = true;
   }
   }
  
   // funcion con parametros que no retorna un valor
   void reiniciarColores(color c1, color c2, color c3, color c4) {
  colorIzquierdaArriba = c1;
  colorIzquierdaAbajo = c2;
  colorDerechaArriba = c3;
  colorDerechaAbajo = c4;
}

void reiniciarTodo(boolean reiniciar) {
  mostrarLineasVerticales = reiniciarBoolean(mostrarLineasVerticales, reiniciar);
  mostrarLineasVerticalesAbajo = reiniciarBoolean(mostrarLineasVerticalesAbajo, reiniciar);
  mostrarLineasHorizontales = reiniciarBoolean(mostrarLineasHorizontales, reiniciar);
  mostrarLineasHorizontalesAbajo = reiniciarBoolean(mostrarLineasHorizontalesAbajo, reiniciar);
  
  escalaRombo = reiniciarFloat(escalaRombo, reiniciar);
  animarRombo = false;
  
  colorIzquierdaArriba = reiniciarColor(colorIzquierdaArriba, reiniciar);
  colorIzquierdaAbajo = reiniciarColor(colorIzquierdaAbajo, reiniciar);
  colorDerechaArriba = reiniciarColor(colorDerechaArriba, reiniciar);
  colorDerechaAbajo = reiniciarColor(colorDerechaAbajo, reiniciar);
}

void keyPressed() {
  if (key == ' ') {  // espacio
    reiniciarTodo(true);
  } 
} 
 
