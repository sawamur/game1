
BrickPair currentPair;
Grid grid;
Score score;
float speed = 1.0;

void setup(){
  size(300, 600);
  currentPair = new BrickPair();
  grid = new Grid();
  score = new Score();
}

void draw(){
  
  background(255);
  currentPair.b1.update();
  currentPair.b2.update();
  
  if( currentPair.isDroppedOn(  grid )){    
    currentPair.drop( grid );
    
    while(grid.markAndSeep()){
      grid.slide(); 
      score.up();
    }
    
    currentPair = new BrickPair();
    speed += 0.1;
    currentPair.setSpeed(speed);
  }
  currentPair.show();
  grid.showAll();
  score.show();
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
    } else if (keyCode == DOWN){
        bp.speedUp();
    }
    
  }
}