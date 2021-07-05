
MS ms;

void setup(){
  //size(640, 360);
  fullScreen();
  background(255);
  ms= new MS(4,0.01);
  
}

void draw(){
  background(255);
  ms.generate();
  ms.display(0);
}

void mousePressed(){
  exit();
}
