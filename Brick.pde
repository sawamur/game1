class Brick {
  public int col;
  public int row = 0;
  public int x = 0;
  public float y = 0;
  private int w = 30;
  private int h = 30;
  public int colorType;
  public  color c1; 
  public Brick pairTo;
  public boolean toBeRemoved = false;
  public float baseSpeed = 1.0; 
  private boolean speedUped = false;
  private float highSpeed = 6.0;
  
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
         return color(240,0,0);
        case 1:
          return color(0,0,240);
         case 2:
          return color(255,255,0);
        case 3:
          return  color(255, 00, 204);
        default:
          return  color(0,200,0);       
    }
  }
      
  void update(){
    x = 30 * col;
    y += speed();
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
  
  void speedUp(){
    speedUped = true; 
  }
  
  void speedDown(){
    speedUped = false; 
  }
  
  float speed(){   
    if(speedUped){
      return highSpeed;
    }
    return baseSpeed;
  }
  
  
  void slideDown(Grid grid){
    pairTo = null;
    ArrayList<Brick> column = grid.getVertical(col);
    while(row < column.size() - 1 &&
          column.get(row + 1) == null){
       column.set(row, null);
       row ++;
       column.set(row, this);
    }
  }
  
  void slideDownAll(Grid grid){
     int from = row;
     slideDown(grid);
     
     for(int j = from; j >= 0; j--){
        Brick b = grid.getAt(col,j);
        if(b != null){
          b.slideDown(grid);
        }
     }
  }
  
  boolean isDropedOn( int num ){
     num ++;
     return y  >=  (600 - (30* num) );
  }
}