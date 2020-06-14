//cria um array dos objetos shape
Shape[] shapes = new Shape[4];
int s = 0;

void setup() {
  size(800, 600);
  x = loadShape("x.svg"); //carrega svg

  noStroke();
  fill(0);

  //cria um novo shape
  shapes[0] = new Shape("r"); // r = rect / ellipse , t = triangle e x = letter x
}

void draw() {
  rect(0, 0, width, height); // zera o fundo

  for (Shape i : shapes) {
    if ( i == null ) {
    } else {
      i.render(); // renderiza todos os shapes dentro de Shape
    }
  }
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
    shapes[s].seter(100, 100, 0, 200, 200, 100); //seta os valores dist,sx,sy,r
  }

  if (key == BACKSPACE) {
    shapes[s].FillSeter(20, width, 2, 0);
  }
}
