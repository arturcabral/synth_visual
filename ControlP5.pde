import controlP5.*;
ControlP5 cp5;
RadioButton r1;
Knob KnobA, KnobB, KnobC, KnobD;

int StateRadioButton = -1;
int StateKnobA, StateKnobB, StateKnobC, StateKnobD = 0;


void Controlp5() {
  cp5 = new ControlP5(this);

  //Configurações Knobs
  KnobA = cp5.addKnob("posX")
    .setRange(0, 255)
    .setValue(50)
    .setPosition(810, 70)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;
  KnobB = cp5.addKnob("posY")
    .setRange(0, 255)
    .setValue(50)
    .setPosition(870, 70)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;
  KnobC = cp5.addKnob("sizeX")
    .setRange(0, 255)
    .setValue(50)
    .setPosition(810, 140)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;
  KnobD = cp5.addKnob("sizeY")
    .setRange(0, 255)
    .setValue(50)
    .setPosition(870, 140)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;               
  //Configurações Botões
  r1 = cp5.addRadioButton("radioButton")
    .setPosition(810, 20)
    .setSize(20, 20)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setItemsPerRow(4)
    .setSpacingColumn(20)
    .addItem("R", 1)
    .addItem("P", 2)
    .addItem("X", 3)
    ;
  //Style Lista
  for (Toggle t : r1.getItems()) {
    //t.getCaptionLabel().setColorBackground(color(255, 80));
    t.getCaptionLabel().getStyle().moveMargin(-7, 0, 0, -3);
    t.getCaptionLabel().getStyle().movePadding(7, 0, 0, 3);
    t.getCaptionLabel().getStyle().backgroundWidth = 45;
    t.getCaptionLabel().getStyle().backgroundHeight = 13;
  }
}

//Eventos

void posX(int theValue) {
  StateKnobA = int(map(theValue, 0, 255, 0, w));
  println("Evento posX "+theValue);
}

void posY(int theValue) {
  StateKnobB = int(map(theValue, 0, 255, 0, h));
  println("Evento posY "+theValue);
}
void sizeX(int theValue) {
  StateKnobC = int(map(theValue, 0, 255, 0, w));
  println("Evento SizeX "+theValue);
}
void sizeY(int theValue) {
  StateKnobD = int(map(theValue, 0, 255, 0, h));
  println("Evento sizeY "+theValue);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(r1)) {
    print("Evento RadioButton "+theEvent.getName()+"\t");
    println("\t "+theEvent.getGroup().getValue());
    StateRadioButton = int(theEvent.getGroup().getValue());
  }
}
