class GOL {

  private int resolution;
  private int cols, rows;
  private int neighbors;
  private int[][] grid;
  private int[][] next;

  GOL(int rez) {
    resolution= rez;
    cols= width/resolution;
    rows= height/resolution;
    grid= new int[cols][rows];
    init();
  }

  void init() {
    
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        grid[i][j]= 0;
      }
    }

    for (int i=1; i<cols-1; i++) {
      for (int j=1; j<rows-1; j++) {
        grid[i][j]= int(random(2));
      }
    }
  }

  void generate() {

    next= new int[cols][rows];

    for (int x=1; x<cols-1; x++) {
      for (int y=1; y<rows-1; y++) {

        neighbors=0;

        for (int i=-1; i<=1; i++) {
          for (int j=-1; j<=1; j++) {

            neighbors+= grid[x+i][y+j];
          }
        }

        neighbors-= grid[x][y];

        if      ((neighbors <  2) && (grid[x][y] == 1)) next[x][y]= 0;   // Death
        else if ((neighbors >  3) && (grid[x][y] == 1)) next[x][y]= 0;   // Death
        else if ((neighbors == 3) && (grid[x][y] == 0)) next[x][y]= 1;   // Birth
        else                                            next[x][y]= grid[x][y];   // Remain
      }
    }

    grid= next;
  }

  void display() {
    stroke(0);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        if (grid[i][j] == 1) fill(0);
        else fill(255);
        rect(i*resolution, j*resolution, resolution, resolution);
      }
    }
  }
}
