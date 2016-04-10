
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
          getAt(i, j).toBeRemoved = true;  
          getAt(i, j - 1).toBeRemoved = true;
          getAt(i, j - 2).toBeRemoved = true;
          hit = true;
        }
        last = getAt(i,j);
      }
    }
        
    return hit;
  }
  
  void slide(){
    boolean toSlide = false;
     for(int i = 0; i < 10; i++){
       toSlide = false;
       for(int j = 19; j >= 0; j --){
        Brick b = getAt(i,j);
        if(b != null)
         if(b.toBeRemoved){
           setAt(i,j,null);
           if(b.pairTo != null){
             b.pairTo.slideDownAll(this);
           }
           b = null;
           toSlide = true;
         }else if(toSlide){
           b.slideDown(this);
         }
      }
     }
  }
}

  