 
  

class Light{
  float cX;
  float cY;
  float cR;
  color lO;
  color lW;
  color lT;
  boolean isLightOn=false;
  boolean overCircle=false;
  

  int lightId;
  

  

 
  Light(float circleX, float circleY, float circleRadius, color levelOne, color levelTwo, color levelThree, int lid){
    cX = circleX;
    cY = circleY;
    cR = circleRadius;
    lO = levelOne;
    lW = levelTwo;
    lT = levelThree;
    lightId = lid;
    

  }
  
  void display(){
    fill(255);
    strokeWeight(2);
    stroke(140);
    ellipse(cX,cY,cR,cR);

  }
  
  void light(){
    if(balanceBridge >=6){
    fill(lO);
    strokeWeight(2);
    stroke(140);
    ellipse(cX,cY,cR,cR);

  }else if((balanceBridge >=3) && (balanceBridge < 6)){
    fill(lW);
    strokeWeight(2);
    stroke(140);
    ellipse(cX,cY,cR,cR);
    
  }else{
    fill(lT);
    strokeWeight(2);
    stroke(140);
    ellipse(cX,cY,cR,cR);
    
  }
  }
  
    void checklight(){
    if(balance >=6){
    fill(lO);
    strokeWeight(2);
    stroke(140);
    ellipse(cX,cY,cR,cR);

  }else if((balance >=3) && (balance < 6)){
    fill(lW);
    strokeWeight(2);
    stroke(140);
    ellipse(cX,cY,cR,cR);
    
  }else{
    fill(lT);
    strokeWeight(2);
    stroke(140);
    ellipse(cX,cY,cR,cR);
    
  }
  }
  
  boolean overCircle() {
  float disX = cX - mouseX;
  float disY = cY - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < cR/2 ) {
    return true;
  } else {
    return false;
  }
}
   
}
