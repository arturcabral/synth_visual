//Configurações Shape
PShape x;


class Shape {
  PVector position;
  PVector size;
  int radius;
  String type;

  int FillDistance;
  PVector FillSize;
  float FillRotate;

  PGraphics pg; //cria canvas
  PGraphics PGfill; //cria canvas do fill

  //Configurações Shape
  Shape(String Type) {
    position = new PVector(width/2, height/2, 0); //x , y e rotation
    size = new PVector(100, 100);
    radius = 0;
    type = Type;
    
    FillDistance = 5;
    FillSize = new PVector(width, 2);
    FillRotate = 0;
  }

  void render() {
    Fill();
    pg = createGraphics(width, height); //size of mask
    pg.beginDraw();
    //maskImage.fill(0);
    if (type.equals("r") ) {
      pg.rectMode(CENTER);
      pg.rect(position.x, position.y, size.x, size.y, radius);
    } else if (type.equals("t")) {
      simpletriangle(position.x, position.y, size.x, size.y);
    } else if (type.equals("x")) {
      pg.shapeMode(CENTER);
      x.disableStyle();
      pg.shape(x, position.x, position.y, size.x, size.y);
    }
    pg.endDraw();
    PGfill.mask(pg);
    image(PGfill, 0, 0);
  }
  
  //Seta configurações do shape
  void seter(int px, int py, int pr, int x, int y, int r)  { 
    position.set(px, py, pr);
    size.set(x, y);
    radius = r;
  }
  //Seta configurações do Fill
  void FillSeter(int dist, int sx, int sy, int r) {
    FillDistance = dist;
    FillSize.set(sx, sy);
    FillRotate = r;
  }


  void Fill() {

    PGfill = createGraphics(width, height);
    PGfill.beginDraw();
    PGfill.fill(255);
    for (int i = 0; i < height; i = i+FillDistance) {
      PGfill.shapeMode(CENTER);
      PGfill.rect(0, i, FillSize.x, FillSize.y);
    }
    PGfill.endDraw();
  }

  // Cria a função do simpletriangle() básico. 
  void simpletriangle(float x, float y, float w, float h) {
    triangle(x, y, 
      x+w/2, y-h, 
      x+w, y);
  }
}
