
class BrickPair {
  public Brick b1;
  public Brick b2;
  
  BrickPair(Brick _b1, Brick _b2){
    b1 = _b1;
    b2 = _b2;
  }
 
  BrickPair(){
    int c = (int) random(9);
    b1 = new Brick(c);
    b2 = new Brick(c + 1);
    
    b1.pairTo = b2;
    b2.pairTo = b1;
  }
  
  int rightMostCol(){
    return b2.col;
  }
  
  int leftMostCol(){
    return b1.col;
  }
  
  void moveRight(){
    move(1);
  }
  
  void moveLeft(){
    move(-1);
  }
  
  void move(int delta){
    b1.col += delta;
    b2.col += delta;
  }
  
  void drop(Grid grid){
    grid.setAt(b1.col, b1.row, b1);
    grid.setAt(b2.col, b2.row, b2);
  }
  
  boolean isDroppedOn(Grid grid){
    int max = grid.maxVerticalSize();
    if(b1.row == max -1  || b2.row == max -1){
      return true; 
    }else if( grid.getAt(b1.col, b1.row + 1) != null){
      return true; 
    }else if( grid.getAt(b2.col, b2.row + 1) != null){
      return true;
    }
    return false;
  }
  
  void show(){
    b1.show();
    b2.show();
  }
}