import java.lang.Math;

class Platform{
  public ArrayList<Integer> arrx = new ArrayList<Integer>();
  public ArrayList<Integer> arry = new ArrayList<Integer>();
  int y;
  public int size;
  public Platform(){
  }
  //draw platforms
   public void drawNewStage(){
    //clear arrays
    arrx.clear();
    arry.clear();
    y = height;
    for(int i = 0; i<8;i++){
      arry.add(y);
      //random x pos, have to cast int
      arrx.add((int)(Math.random()*399));
      y-=100;
           
    }
  }
  //checks if there is a collision
  public boolean checkCollision(){
    for(int i = 0;i<8;i++){
      if(arry.get(i)-20<ypos && ypos<arry.get(i)-15 && speed>=0){
        if(arrx.get(i)-20<xpos && xpos<arrx.get(i)+100){
        return true;
        }
      }
    }
    return false;
  }
}
