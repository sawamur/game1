
class Grid {
  ArrayList<ArrayList> horizontal;
  
  Grid(){
    horizontal = new ArrayList<ArrayList>();
    for(int i =0; i < 10; i++){    
      ArrayList<Brick> vertical = new ArrayList<Brick>();
      for(int j =0; j < 20; j++){
       vertical.add(null); 
      }
      horizontal.add( vertical );
    }
  }
  
  Brick getAt(int colNum, int rowNum){
    return (Brick)horizontal.get(colNum).get(rowNum);
  }
  
  void setAt(int colNum, int rowNum, Brick brickOrNull){
    horizontal.get(colNum).set(rowNum, brickOrNull);  
  }
  
  ArrayList<Brick> getVertical(int colNum){
     return horizontal.get(colNum); 
  }
  
  int maxVerticalSize(){
    return horizontal.get(0).size();
  }
  
  boolean markAndSeep(){
    int n = 0;
    boolean hit = false;
    Brick last = null;
    Brick current = null;
    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 20; j ++){
        current = getAt(i, j);        
        if(last != null && current != null && last.colorType == current.colorType){
          n ++;
        } else {
          n = 0;
        }
        print( i + ":" + j + ":" + n + "\n");
        if(n == 2){
          setAt(i, j, null);
          setAt(i, j - 1 , null);
          setAt(i, j - 2 , null);
          hit = true;
        }
        last = getAt(i,j);
      }
    }
        
    return hit;
  }
  
  void slide(){
  }
}

  