
BrickPair currentPairs;
ArrayList<ArrayList> grid;
int numBrick = 0;

void setup(){
  size(300, 600);
  currentPairs = new BrickPair();
  
  grid = new ArrayList();
  for(int i =0; i < 10; i++){    
    ArrayList<Brick> al = new ArrayList<Brick>();
    for(int j =0; j < 20; j++){
       al.add(null); 
    }
    grid.add( al );
  }
}

void draw(){
  BrickPair bp = currentPairs;
  background(255);
  bp.b1.update();
  bp.b2.update();
  
  if( bp.isDroppedOn(  grid )){    
    bp.drop( grid );
    currentPairs = new BrickPair();
  }
  showAll();
}

void keyPressed() {
  BrickPair bp = currentPairs;
  
  if (key == CODED) {     
    if (keyCode == RIGHT && bp.rightMostCol() < 9) {    
        bp.moveRight();
    } else if (keyCode == LEFT && bp.leftMostCol() > 0) {
        bp.moveLeft();
    }
  }
}

void showAll(){
  currentPairs.show();
  for(int i =0; i < 10; i++){
    for(int j=0; j < 20; j ++){
      Brick b = (Brick) grid.get(i).get(j);
      if(b != null){
         b.showOnGrid(); 
      }
    }
  }
}