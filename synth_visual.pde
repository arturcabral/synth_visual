//cria um array dos objetos shape
Shape[] shapes = new Shape[5];
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

  //cria os shapes (4)
  for (int i = 1; i < 5; i++) {
    shapes[i] = new Shape();
  }
}

void draw() {
  rect(0, 0, w, h); // zera o fundo


  for (Shape i : shapes) {
    if ( i == null ) {
    } else {
      i.render(); // renderiza todos os shapes dentro de Shape
    }
  }
  if (StateRadioButtonA == 1 || StateRadioButtonA == 2 || StateRadioButtonA == 3 || StateRadioButtonA == 4) {
    shapes[StateRadioButtonA].seter(StateKnobA, StateKnobB, StateKnobE, StateKnobC, StateKnobD, radiusA, StateRadioButtonB, Nsides);
  }
}

void keyPressed() {
  if (key == TAB) {
    if ( s ==4) {
      s =0;
    }
    s++;
    println("criou outro shape");
    println(shapes);
  }

  if (key == ENTER) {
    //shapes[s].seter(StateKnobA, StateKnobB, 0, StateKnobC, StateKnobD, 0); //  position x, position y, rotation , size x,size y, radius
  }

  if (key == BACKSPACE) {
    shapes[s].FillSeter(20, w, 2, 0);
  }
}
