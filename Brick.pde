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
  public  color c1;
  
  Brick(){
    col = (int) random(10);
    c1 = getColor(); 
  }
  
  Brick(int c){
    col = c;
    c1 = getColor();
  }

  color getColor(){
      int colorType = (int) random(5);
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
  
  void update(){
    x = 30 * col;
    y += 3;
    row = (int) y / 30;
    print(row);
  }
  
  void show(){
      noStroke();
      fill(c1);
      rect(x,y,w,h);
  
  }
  
  boolean isDropedOn( int num ){
     num ++;
      return y  >=  (600 - (30* num) );
  }
}