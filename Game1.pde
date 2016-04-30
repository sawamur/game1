
BrickPair currentPair;
Grid grid;
Score score;
float speed = 1.0;

void setup() {
  size(300, 600);
  currentPair = new BrickPair();
  grid = new Grid();
  score = new Score();
  PFont font = loadFont("Futura-CondensedMedium-48.vlw");
  textFont(font);
}

void draw() {
  background(255);
  currentPair.b1.update();
  currentPair.b2.update();

  if ( currentPair.isDroppedOn(  grid )) {    
    currentPair.drop( grid );

    while (grid.detectToBeRemoved()) {
      int numOfRemoved = grid.numOfToBeRemoved();
      score.up(numOfRemoved);
      grid.slide();    
    }

    currentPair = new BrickPair();
    speed += 0.1;
    currentPair.setSpeed(speed);
  }

  currentPair.show();
  grid.showAll();
  score.show();

  if( grid.isFull() ){
    gameOver();
  }
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
    } else if (keyCode == DOWN) {
      bp.speedUp();
    }
  }
}

void keyReleased() {
  if (keyCode == DOWN) {
    currentPair.speedDown();
  }
}

void gameOver () {
  textSize(60);
  fill(200, 200, 200);
  text("Game Over", 42, 142);
  fill(0, 0, 0);
  text("Game Over", 40, 140);  
  noLoop();
}