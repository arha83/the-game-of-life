class MS {

  private int rez;
  private int cols, rows;
  private int[][] grid;
  private int[][] next;
  private float scale;
  private float z;
  private int state;

  MS(int r, float s) {

    rez= r;
    cols= width/rez;
    rows= height/rez;
    grid= new int[cols][rows];
    next= new int[cols][rows];
    scale= s;
    z=0;

    generate();
  }

  void generate() {
    
    for (float i=0; i<cols; i++){
      for (float j=0; j<rows; j++){
        state= int(map(noise(i*scale,j*scale,z*scale),0,1,0,255));
        if(state<128) grid[int(i)][int(j)]= 0;
        else grid[int(i)][int(j)]=1;
      }
    }
    z++;   
  }

  void display(int f) {

    noStroke();
    fill(f);

    int a, b, c, d;
    int n;
    int x, y, h;

    h= rez/2;
    for (int i=0; i < cols-1; i++) {
      for (int j=0; j < rows-1; j++) {
        a=grid [i]  [j];
        b=grid [i+1][j];
        c=grid [i+1][j+1];
        d=grid [i]  [j+1];
        n= convert(a, b, c, d);
        x= i*rez;
        y= j*rez;

        beginShape();
        switch(n) {
        case 0:
          // Nothing
          break;
        case 1:
          vertex(x, y);
          vertex(x+h, y);
          vertex(x, y+h);
          break;
        case 2:
          vertex(x+h, y);
          vertex(x+rez, y);
          vertex(x+rez, y+h);
          break;
        case 3:
          vertex(x, y);
          vertex(x+rez, y);
          vertex(x+rez, y+h);
          vertex(x, y+h);
          break;
        case 4:
          vertex(x+rez, y+h);
          vertex(x+rez, y+rez);
          vertex(x+h, y+rez);
          break;
        case 5:
          vertex(x, y);
          vertex(x+h, y);
          vertex(x+rez, y+h);
          vertex(x+rez, y+rez);
          vertex(x+h, y+rez);
          vertex(x, y+h);
          break;
        case 6:
          vertex(x+h, y);
          vertex(x+rez, y);
          vertex(x+rez, y+rez);
          vertex(x+h, y+rez);
          break;
        case 7:
          vertex(x, y);
          vertex(x+rez, y);
          vertex(x+rez, y+rez);
          vertex(x+h, y+rez);
          vertex(x, y+h);
          break;
        case 8:
          vertex(x, y+h);
          vertex(x, y+rez);
          vertex(x+h, y+rez);
          break;
        case 9:
          vertex(x, y);
          vertex(x+h, y);
          vertex(x+h, y+rez);
          vertex(x, y+rez);
          break;
        case 10:
          vertex(x+h, y);
          vertex(x+rez, y);
          vertex(x+rez, y+h);
          vertex(x+h, y+rez);
          vertex(x, y+rez);
          vertex(x, y+h);
          break;
        case 11:
          vertex(x, y);
          vertex(x+rez, y);
          vertex(x+rez, y+h);
          vertex(x+h, y+rez);
          vertex(x, y+rez);
          break;
        case 12:
          vertex(x, y+h);
          vertex(x+rez, y+h);
          vertex(x+rez, y+rez);
          vertex(x, y+rez);
          break;
        case 13:
          vertex(x, y);
          vertex(x+h, y);
          vertex(x+rez, y+h);
          vertex(x+rez, y+rez);
          vertex(x, y+rez);
          break;
        case 14:
          vertex(x+h, y);
          vertex(x+rez, y);
          vertex(x+rez, y+rez);
          vertex(x, y+rez);
          vertex(x, y+h);
          break;
        case 15:
          square(x, y, rez);
          break;
        }
        endShape(CLOSE);
      }
    }
  }

  private int convert(int a, int b, int c, int d) {
    return a*1 + b*2 + c*4 + d*8;
  }
}
