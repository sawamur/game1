
BrickPair currentPair;
Grid grid;
int numBrick = 0;

void setup(){
  size(300, 600);
  currentPair = new BrickPair();
  grid = new Grid();
}

void draw(){
  
  background(255);
  currentPair.b1.update();
  currentPair.b2.update();
  
  if( currentPair.isDroppedOn(  grid )){    
    currentPair.drop( grid );
    
    while(grid.markAndSeep()){
      grid.slide(); 
    }
    
    currentPair = new BrickPair();
  }
  currentPair.show();
  grid.showAll();
}

void keyPressed() {
  BrickPair bp = currentPair;
  
  if (key == CODED) {     
    if (keyCode == RIGHT && bp.rightMostCol() < 9) {    
        bp.moveRight();
    } else if (keyCode == LEFT && bp.leftMostCol() > 0) {
        bp.moveLeft();
    } else if (keyCode == UP) {
        bp.turn(grid);
    }
  }
}