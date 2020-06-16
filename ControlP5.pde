import controlP5.*;
ControlP5 cp5;
RadioButton r1, r2;
Knob KnobA, KnobB, KnobC, KnobD, KnobE;

int StateRadioButtonA, StateRadioButtonB = 0;
int StateKnobA, StateKnobB, StateKnobC, StateKnobD, StateKnobE = 0;
int radiusA, Nsides = 0;

void Controlp5() {
  cp5 = new ControlP5(this);


  //Configurações Knobs
  KnobA = cp5.addKnob("posX")
    .setRange(-60, w-60)
    .setValue((w-60)/2)
    .setPosition(810, 90)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;
  KnobB = cp5.addKnob("posY")
    .setRange(-360, h -360)
    .setValue((h-360)/2)
    .setPosition(880, 90)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;
  KnobC = cp5.addKnob("sizeX")
    .setRange(0, 255)
    .setValue(50)
    .setPosition(810, 160)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;
  KnobD = cp5.addKnob("sizeY")
    .setRange(0, 255)
    .setValue(50)
    .setPosition(880, 160)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;               
  KnobE = cp5.addKnob("rotation")
    .setRange(0, 260)
    .setValue(0)
    .setPosition(880, 350)
    .setRadius(25)
    .setDragDirection(Knob.VERTICAL)
    ;            
  //Configurações Botões
  r1 = cp5.addRadioButton("radioButtonA")
    .setPosition(810, 20)
    .setSize(20, 20)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setItemsPerRow(4)
    .setSpacingColumn(15)
    .addItem("0", 1)
    .addItem("1", 2)
    .addItem("2", 3)
    .addItem("3", 4)
    ;
  //Style Lista
  for (Toggle t : r1.getItems()) {
    //t.getCaptionLabel().setColorBackground(color(255, 80));
    t.getCaptionLabel().getStyle().moveMargin(-7, 0, 0, -3);
    t.getCaptionLabel().getStyle().movePadding(7, 0, 0, 3);
    t.getCaptionLabel().getStyle().backgroundWidth = 45;
    t.getCaptionLabel().getStyle().backgroundHeight = 13;
  }

  r2 = cp5.addRadioButton("radioButtonB")
    .setPosition(810, 55)
    .setSize(20, 20)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setItemsPerRow(3)
    .setSpacingColumn(15)
    .addItem("Q", 1)
    .addItem("T", 2)
    .addItem("X", 3)
    ;
  //Style Lista
  for (Toggle t : r2.getItems()) {
    //t.getCaptionLabel().setColorBackground(color(255, 80));
    t.getCaptionLabel().getStyle().moveMargin(-7, 0, 0, -3);
    t.getCaptionLabel().getStyle().movePadding(7, 0, 0, 3);
    t.getCaptionLabel().getStyle().backgroundWidth = 45;
    t.getCaptionLabel().getStyle().backgroundHeight = 13;
  }
  ///Configurações Slider
  cp5.addSlider("radiusA")
    .setPosition(810, 250)
    .setRange(0, 80)
    ;

  cp5.addSlider("Nsides")
    .setPosition(810, 300)
    .setWidth(100)
    .setRange(8, 1) // values can range from big to small as well
    .setValue(3)
    .setNumberOfTickMarks(8)
    .setSliderMode(Slider.FLEXIBLE)
    ;
}

//Eventos

void posX(int theValue) {
  StateKnobA = theValue;
  println("Evento posX "+theValue);
}

void posY(int theValue) {
  StateKnobB = theValue;
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

void rotation(int theValue) {
  StateKnobE = int(map(theValue, 0, 255, 0, h));
  println("Evento rotation "+theValue);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(r1)) {
    print("Evento RadioButtonA "+theEvent.getName()+"\t");
    println("\t "+theEvent.getGroup().getValue());
    StateRadioButtonA = int(theEvent.getGroup().getValue());

    KnobA.setValue((w-60)/2);
    KnobB.setValue((h-300)/2);
    KnobC.setValue(50);
    KnobD.setValue(50);
  }
  if (theEvent.isFrom(r2)) {
    print("Evento RadioButtonB "+theEvent.getName()+"\t");
    println("\t "+theEvent.getGroup().getValue());
    StateRadioButtonB = int(theEvent.getGroup().getValue());
  }
}
