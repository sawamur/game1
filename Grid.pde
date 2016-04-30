
class Grid {
  ArrayList<ArrayList> horizontal;
  int horizontalSize = 10;
  int verticalSize = 20;
  
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
  
  boolean isFull(){
    for(int i=0; i < horizontalSize; i ++){
      if(getAt(i,0) != null){
        return true;
      }
    }    
    return false;
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
      last = null;
      for(int j = 19; j >= 0; j --){
        current = getAt(i, j);        
        if(last != null && current != null && last.colorType == current.colorType){
          n ++;
        } else {
          n = 0;
        }
        if(n == 2 || n == 3){
          getAt(i, j).toBeRemoved = true;  
          getAt(i, j + 1).toBeRemoved = true;
          getAt(i, j + 2).toBeRemoved = true;
          if(n == 3){
            getAt(i, j + 3).toBeRemoved = true;
          }
          hit = true;
        }
        last = getAt(i,j);
      }
    }
    
    for(int j = 19; j >= 0; j --){
      last = null;
      for(int i = 0; i < 10; i++){
       current = getAt(i, j);        
        if(last != null && current != null && last.colorType == current.colorType){
          n ++;
        } else {
          n = 0;
        }
        if(n == 2 || n == 3){
          getAt(i, j).toBeRemoved = true;  
          getAt(i - 1, j).toBeRemoved = true;
          getAt(i - 2 , j).toBeRemoved = true;
          if(n == 3){
             getAt(i - 3 , j).toBeRemoved = true;
          }
          hit = true;
        }
        last = getAt(i,j);
      }
    }
        
    return hit;
  }
  
  int numOfToBeRemoved(){
    int num = 0;
    for(int i = (horizontalSize -1); i >= 0; i--){
      for(int j = (verticalSize -1); j >= 0; j--){
        if(getAt(i,j).toBeRemoved){
          num ++;
        }
      }
    }
    return num;
  }
  
  int slide(){
    boolean toSlide = false;
    ArrayList<Brick> separated = new ArrayList<Brick>();
     for(int i = 0; i < 10; i++){
       toSlide = false;
       for(int j = 19; j >= 0; j --){
        Brick b = getAt(i,j);
        if(b != null)
         if(b.toBeRemoved){
           setAt(i,j,null);
           if(b.pairTo != null){
             separated.add(b.pairTo);
           }
           b = null;
           toSlide = true;
         }else if(toSlide){
           b.slideDown(this);
         }
      }
     }
     for(int i=0; i < separated.size(); i++){
       Brick b = separated.get(i);
       if(b != null){
          if(!b.toBeRemoved){
            b.slideDownAll(grid);   
          } else {
            b = null;
          }
       }
     }

  }
  
  void showAll(){  
   for(int i =0; i < 10; i++){
    for(int j=0; j < 20; j ++){
      Brick b = getAt(i,j);
      if(b != null){
         b.showOnGrid(); 
      }
    }
   }
  }
}

  