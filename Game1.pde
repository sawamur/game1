
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
  showAll();
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

void showAll(){
  currentPair.show();
  for(int i =0; i < 10; i++){
    for(int j=0; j < 20; j ++){
      Brick b = grid.getAt(i,j);
      if(b != null){
         b.showOnGrid(); 
      }
    }
  }
}