//Configurações Shape
PShape x;

class Shape {
  PVector position;
  PVector size;
  int radius;
  String type;
  //Configurações Shape
  Shape(String Type) {
    position = new PVector(width/2, height/2, 0); //x , y e rotation
    size = new PVector(100, 100);
    radius = 0;
    type = Type;
  }

  void render() {
    if (type.equals("r") ) {
      rectMode(CENTER);
      rect(position.x, position.y, size.x, size.y, radius);
    } 
    else if (type.equals("t")) {
        simpletriangle(position.x, position.y, size.x, size.y);
    }
    else if (type.equals("x")) {
      shapeMode(CENTER);
      x.disableStyle();
      shape(x, position.x, position.y, size.x, size.y);

    }
  }
  
  void seter(int px, int py, int pr, int x, int y, int r) {
    position.set(px,py,pr);
    size.set(x, y);
    radius = r;
  }

}

// Cria a função do simpletriangle() básico. 
void simpletriangle(float x, float y, float w, float h) {
  triangle(x, y, 
  x+w/2, y-h, 
  x+w, y);
}
