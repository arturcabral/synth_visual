//cria um array dos objetos shape
Shape[] shapes = new Shape[4];
int s = 0;

//Tamanho Tela
int w = 800;
int h = 600;

void setup() {
  size(950, 600);
  x = loadShape("x.svg"); //carrega svg

  noStroke();
  fill(0);
  
  //Botão tipo radio do Control P5
  Controlp5();

  //cria um novo shape
  shapes[0] = new Shape("r"); // r = rect / ellipse , t = triangle e x = letter x
}

void draw() {
  rect(0, 0, w, h); // zera o fundo

  for (Shape i : shapes) {
    if ( i == null ) {
    } else {
      i.render(); // renderiza todos os shapes dentro de Shape
    }
  }
  //shapes[s].seter(StateKnobA, StateKnobB, 0, StateKnobC, StateKnobD, 0);
}

void keyPressed() {
  if (key == TAB) {
    if ( s ==4) {
      s =0;
    }
    s++;
    shapes[s] = new Shape("x");
    println("criou outro shape");
    println(shapes);
  }

  if (key == ENTER) {
    shapes[s].seter(StateKnobA, StateKnobB, 0, StateKnobC, StateKnobD, 0); //  position x, position y, rotation , size x,size y, radius
  }

  if (key == BACKSPACE) {
    shapes[s].FillSeter(20, w, 2, 0);
  }
}
