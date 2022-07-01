class Wall{
  float x, y, w, h;
  public Wall(float xPos, float yPos, float wid, float hig){
    x = xPos;
    y = yPos;
    w = wid;
    h = hig;
  }
  
  void show(){
    fill(150);
    strokeWeight(3);
    stroke(100);
    rect(x,y,w,h);  
  }
}
