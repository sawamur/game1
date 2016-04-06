class Brick {
  public int col;
  public int row = 0;
  private int x = 0;
  private int y = 0;
  private int w = 30;
  private int h = 30;
  private int red = 0;
  private int green = 0;
  private int blue = 0;
  public int colorType;
  public  color c1; 
  public Brick pairTo;
  
  Brick(){
    col = (int) random(10);
    colorType = (int) random(5);
    c1 = getColor(); 
  }
  
  Brick(int c){
    col = c;
    colorType = (int) random(5);
    c1 = getColor();
  }

  color getColor(){
    switch(colorType){
      case 0:
         return color(255,0,0);
        case 1:
          return color(0,0,255);
         case 2:
          return color(255,255,0);
        case 3:
          return  color(255,0,180);
        default:
          return  color(0,255,0);       
    }
  }
  
  void crush(ArrayList<ArrayList> grid){
    ArrayList<Brick> column = grid.get(col);
    if(row < column.size() - 1){
       Brick next = column.get(row + 1);
       if(next != null && next.colorType == colorType){
         column.set(row, null);
         column.set(row + 1, null);
         pairTo.slideDown(grid);
       }
    }
  }
    
  void update(){
    x = 30 * col;
    y += 3;
    row = (int) y / 30;
  }
  
  void show(){
      noStroke();
      fill(c1);
      rect(x,y,w,h);
  
  }
  
  void showOnGrid(){
    x = col * 30;
    y = row * 30;
    show();
  }
  
  void slideDown(ArrayList<ArrayList> grid){
    pairTo = null;
    ArrayList<Brick> column = grid.get(col);
    while(row < column.size() - 1 &&
          column.get(row + 1) == null){
    
       row ++;
    }
  }
  
  boolean isDropedOn( int num ){
     num ++;
      return y  >=  (600 - (30* num) );
  }
}