class Ball{
  PVector pos, vel, acc;
  float wid;
  public Ball(float x, float y, float speed, float dir, float w){
    pos = new PVector(x,y);
    vel = new PVector(speed * cos(dir), speed * sin(dir));
    acc = new PVector(0,0);
    wid = w;
  }
  
  void show(){
    noStroke();
    fill(255);
    ellipse(pos.x,pos.y,wid,wid);
  }
  
  void move(){
    vel.add(acc);
    pos.add(vel);
    acc.set(0,0);
  }
  
  void bounce(ArrayList<Wall> walls){
    float x = pos.x;
    float y = pos.y;
    for (Wall w : walls){
      
      boolean inside = (y < w.y + w.h && y > w.y) && ( x < w.x + w.w && x > w.x );
      //check if inside wall then bounce off closest walls

      if (inside){
        if(vel.x > 0 && abs(w.x - x) < vel.x){
          vel.x *= -1;
        } else if (vel.x <= 0 && abs(w.x + w.w - x) < -vel.x){
          vel.x *= -1; 
        }
        if(vel.y > 0 && abs(w.y - y) < vel.y){
          vel.y *= -1;  
        } else if (vel.y <= 0 && abs(w.y + w.h - y) < -vel.y){
          vel.y *= -1; 
        }
      }
    }
  }
}
