
class Score {
  private int score = 0;
  private int size = 16;
  
  Score(){
  }
  
  void show(){
    textSize(size);
    fill(0,0,0);
    text( score, 5, 20);
  }  
  
  void up(int numOfRemove){
    if(numOfRemove == 3){          
      score = score + 10;
    }else {
      score = score + 20;
    }
  }
}