//Configurações Shape
PShape x;


class Shape {
  PVector position;
  PVector size;
  int radius;
  int type;
  int nslides;
  int FillDistance;
  PVector FillSize;
  float FillRotate;

  PGraphics pg; //cria canvas
  PGraphics PGfill; //cria canvas do fill
  PGraphics PGout; //cria canvas do fill

  //Configurações Shape
  Shape() {
    position = new PVector(0, 0, 0); //x , y e rotation
    size = new PVector(100, 100);
    radius = 0;
    type = 0;
    nslides = 3;
    
    FillDistance = 5;
    FillSize = new PVector(w, 2);
    FillRotate = 0;
  }

  void render() {
    Fill();
    pg = createGraphics(w, h); //size of mask
    pg.beginDraw();
     
    pg.translate(w/2,h/2);
    pg.pushMatrix();
    pg.translate(-300, 60);

    pg.rotate(radians(position.z));
    //pg.translate(-position.x, -position.y);

    //rect
    if (type == 1) {
      pg.rectMode(CENTER);
      pg.rect(0, 0, size.x, size.y, radius);
    //polygon
    } else if (type == 2) {
      polygon(0, 0, size.x, size.y, nslides);
    //x  
    } else if (type == 3) {
      pg.shapeMode(CENTER);
      x.disableStyle();
      pg.shape(x, 0, 0, size.x, size.y);
    } else{

    }
    pg.popMatrix();
    pg.endDraw();
    PGfill.mask(pg);
    
    PGout = createGraphics(w, h); //size of mask

    PGout.beginDraw();
    PGout.image(PGfill, position.x, position.y);
    PGout.endDraw();
    image(PGout,0,0);
}

  //Seta configurações do shape
  void seter(int px, int py, int pr, int x, int y, int r, int t, int ns) { 
    position.set(px, py, pr);
    size.set(x, y);
    radius = r;
    type = t;
    nslides = ns;
  }

  //Seta configurações do Fill
  void FillSeter(int dist, int sx, int sy, int r) {
    FillDistance = dist;
    FillSize.set(sx, sy);
    FillRotate = r;
  }


  void Fill() {

    PGfill = createGraphics(w, h);
    PGfill.beginDraw();
    PGfill.fill(255);
    for (int i = 0; i < h; i = i+FillDistance) {
      PGfill.shapeMode(CENTER);
      PGfill.rect(0, i, FillSize.x, FillSize.y);
    }
    PGfill.endDraw();
  }

  // Cria a função do polygon() básico. 
  void polygon(float x, float y, float radiusx, float radiusy, int npoints) {
    float angle = TWO_PI / npoints;
    pg.beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radiusx;
      float sy = y + sin(a) * radiusy;
      pg.vertex(sx, sy);
    }
    pg.endShape(CLOSE);
  }
}
