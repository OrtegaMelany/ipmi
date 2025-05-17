//variables
PImage img1, img2, img3, img4, img5, img6, img7;
PFont fuenteFrase1, fuenteFrase3, fuenteFrase6;

// movimiento de frases

float textoY = -200; // empieza abajo de la pantalla hacia arriba (frase1)
float textoX2 = -500; // empieza afuera de la pantalla de izquierda al centro (frase2)
int posX =0; // movimiento (frase3)
int dir=1;
float textSize4=10; //(frase4)
float textSize5=60; //(frase5)
float textoX6 =700; //empieza afuera de la pantalla de derecha al centro (frase6)
float textoY7=600; //(frase 7)

int estado = 0;
int contador = 0;
int tiempoLimite = 500; // tiempo entre diapositiva
boolean esperarReinicio= false;
int retrasoBoton=0;

void setup() {
  size(640, 480);

  // imagenes
  img1 = loadImage ("1MyHeroAcademia.jpg");
  img2 = loadImage ("2izuku.jpg");
  img3 = loadImage ("3_izuku_allMight.jpg");
  img4 = loadImage ("4U.A_school.jpg");
  img5 = loadImage ("5ligadevillanos.jpg");
  img6 = loadImage ("6izuku.jpg");
  img7 = loadImage ("7izuku.jpg");

  fuenteFrase1= loadFont("Agency.vlw"); // y frase 2
  fuenteFrase3= loadFont("Cooper.vlw"); // y frase 4 y 5
  fuenteFrase6= loadFont("Stencil.vlw");
}

void draw() {
  background(200);
  contador++; 

  // DIAPOSITIVA 1
  if (estado == 0) {
    image(img1, 0, 0, width, height);
    fill(0);
    textFont(fuenteFrase1);
    textAlign(CENTER, CENTER);
    textSize(35);
    text(" My Hero Academia es un anime que \nse desarrolla en un mundo donde la \nmayoria de la poblacion tiene \nsuperpoderes llamados Quirks. En este \nmundo, los héroes profesionales luchan \ncontra villanos para mantener la paz.", width/2, textoY);

    textoY +=2; // velocidad de bajada
    if (textoY >height/2) {
      textoY= height/2 ; // para que se detenga en el medio
    }

    if (contador >= tiempoLimite) {
      estado =1;
      contador =0;
      textoY = -200;
    }
  }
  //DIAPOSITIVA 2
  else if (estado == 1) {
    image(img2, 0, 0, width, height);
    fill(0);
    textAlign(LEFT, CENTER); // para que este alineado a la izquierda
    textSize(35);
    text("El protagonista es Izuku Midoriya, \nun chico nacido sin Quirk, pero que sueña \ncon convertirse en un gran héroe como su \nídolo, All Might, el héroe número uno.", textoX2, height/2 +100);

    if (textoX2 < width/2 -300) {
      textoX2 +=5;  
    }
    if (contador >= tiempoLimite) {
      estado = 2;
      contador = 0;
      textoX2 =-500;
    }
  }
  //DIAPOSITIVA 3
  else if (estado == 2) {
    image(img3, 0, 0, width, height);
    fill(0);
    textFont(fuenteFrase3);
    textAlign(CENTER, CENTER);
    textSize(35);
    text("Su vida cambia cuando All Might lo \nelige como su sucesor y le transfiere\n su Quirk, One For All, un poder \nheredado que otorga una fuerza \ninmensa y puede ser pasado\n de una persona a otra.", posX, height/2);
    posX = posX +dir;
    //para que el movimiento de la frase rebote
    if (posX > width -300) { //cuando llega al borde derecho
      dir=-1;
    }
    if (posX <300) {  //cuando llega al borde izquierdo
      dir=1;
    }

    if (contador >= tiempoLimite) {
      estado = 3;
      contador = 0;
    }
  }
  //DIAPOSITIVA 4
  else if (estado == 3) {
    image(img4, 0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    if (textSize4<35) {
      textSize4 += 0.2;
    }
    textSize(textSize4);
    text("Midoriya entra en la prestigiosa  \nU.A. High School, donde se \nentrena junto a otros jóvenes \ncon habilidades únicas para \nconvertirse en héroes profesionales.", width/2, height/2);

    if (contador >= tiempoLimite) {
      estado = 4;
      contador = 0;
      textSize4= 10; // para que la letra se agrande
    }
  }
  //DIAPOSITIVA 5
  else if (estado == 4) {
    image(img5, 0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(35);
    if (textSize5>35) {
      textSize5-=0.2;
    }
    textSize(textSize5);
    text("Enfrentan tanto desafíos escolares \ncomo amenazas reales de villanos,\n especialmente de la Liga de Villanos, \nliderada por Tomura Shigaraki.", width/2, height/2);

    if (contador >= tiempoLimite) {
      estado = 5;
      contador = 0;
      textSize5=60; //para que la letra se achique
    }
  }
  //DIAPOSITIVA 6
  else if (estado == 5) {
    image(img6, 0, 0, width, height);
    fill(0);
    textFont(fuenteFrase6);
    textAlign(CENTER, CENTER);
    textSize(35);
    text("A medida que Midoriya crece,\ntambién lo hacen sus \nresponsabilidades, enfrentando\n cada vez mayores desafíos en \nsu lucha por convertirse en \nel héroe número uno. ", textoX6, height/2 +130);

    if (textoX6>width/2) {
      textoX6-=5;
      if (textoX6<width/2) {
        textoX6=width/2;
      }
    }
    if (contador >= tiempoLimite) {
      estado = 6;
      contador = 0;
      textoX6=width;
    }
  }
  //DIAPOSITIVA 7
  else if (estado == 6) {
    image(img7, 0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(35);
    text("La serie mezcla acción, drama, \ndesarrollo de personajes y \nvalores como la perseverancia, \nla justicia, la amistad \ny el sacrificio. ", width/2, textoY7);

    if (textoY7>height/2+140) {
      textoY7-=2;
    } else {
      if (retrasoBoton<150) {
        retrasoBoton++;
      } else {
        esperarReinicio=true;
      }
    }
    if (esperarReinicio) {
      fill(50, 100, 200);
      rect(220, 420, 200, 40);
      fill(255);
      textSize(18);
      textAlign(CENTER, CENTER);
      text("REINICIAR", 320, 440);
    }
  }
}
void mouseClicked() {
  if (esperarReinicio) {
    if (mouseX > 220 && mouseX < 420 &&
      mouseY > 420 && mouseY < 460) {
      // reinicia todo
      estado = 0;
      contador = 0;
      textoY = -200;
      textoX2 = -500;
      posX = 0;
      dir = 1;
      textoY7 = 600;
      esperarReinicio = false;
      retrasoBoton=0;
    }
  }
}
