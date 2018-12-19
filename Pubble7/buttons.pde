// the Button class
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
 
  
  color myColor;
  color myDarkColor;
  color clickColor;
  
  float pa;
  float pb;
  

  boolean rectOver = false;
  
  int buttonId;
  
  float prices=0;
  
  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB, color tempColor,  int bid, float pricesa, float pricesb) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    buttonId=bid;
    pa = pricesa;
    pb = pricesb;
    
    myColor = tempColor;
    myDarkColor = lerpColor(0, myColor, 0.9);

  }
  
  void Draw() {


    if(overRect()){
      fill(myColor);
    }else{
      fill(myDarkColor);
    }

    
    stroke(141);
    rect(x, y, w, h, 10);
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x + (w / 2), y + (h / 2));

  }
  

  
  boolean overRect()  {
  mX = mouseX;
  mY = mouseY;
    if((mouseX> x && mouseX< x+w)&&(mouseY>y && mouseY< y+h)){   
    return true;}
    else{ return false;}
  }
  
  void postpay(){
   prices=random(pa,pb);
   balanceBridge=balance-prices; 
  }

   void pay(){
   balance=balanceBridge;
  }
  

  
}
