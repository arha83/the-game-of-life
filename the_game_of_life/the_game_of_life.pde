
GOL gol;

void setup(){
  fullScreen();
  gol= new GOL(10);
}

void draw(){
  background(255);
  
  gol.display();
  gol.generate();
}

void mousePressed(){
  gol.init();
}
