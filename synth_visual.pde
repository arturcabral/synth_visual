  //cria um array dos objetos shape
  Shape[] shapes = new Shape[3];

void setup() {
  size(800, 600);
  x = loadShape("x.svg"); //carrega svg

  //cria um novo shape
  shapes[0] = new Shape("x"); // r = rect / ellipse , t = triangle e x = letter x
}

void draw() {
  background(255); // zera o fundo
  
  shapes[0].render(); //rederiza
  //shapes[0].seter(100, 100, 0, 200, 200, 100); //seta os valores

}
