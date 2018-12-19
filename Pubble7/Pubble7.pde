
float mX;
float mY;
float balance;
float balanceBridge;
int lightOn;
int lightOff;
boolean Switch=false;
boolean SwitchOff=false;
boolean Check=false;
  
int[] numbers = new int[7];
int[] result;
int k;
int a=1;
int b=0;



Button[] buttons = new Button[7];
CheckButton[] checkbuttons = new CheckButton[1];
Light[] lights = new Light[7];
Light[] lightsOn;
Light[] lightsOff;
Light[] Bridge=new Light[1];



void setup() {
  size (375, 650);
  background(#FF9D36);
  smooth();
  

  balance=12;
  balanceBridge=0;
  
  
  
    
  buttons[0] = new Button("Level 1", 10, 10, 55,30, 200, 1, 0.01, 0.34);
  buttons[1] = new Button("Level 2", 10, 50, 55,30, 200, 2, 0.35, 0.49);
  buttons[2] = new Button("Level 3", 10, 90, 55,30, 200, 3, 0.50, 0.99);
  buttons[3] = new Button("Level 4", 10, 130, 55,30, 200, 4, 1, 1.99);
  buttons[4] = new Button("Level 5", 10, 170, 55,30, 200, 5, 2, 4.99);
  buttons[5] = new Button("Level 6", 10, 210, 55,30, 200, 6, 5, 9.99);
  buttons[6] = new Button("Level 7", 10, 250, 55,30, 200, 7, 10, 12);
  
  checkbuttons[0] = new CheckButton("Check", 10, 290, 55, 30, 200);
  
  lights[0] = new Light(142.5, 425, 27.5, #BEDB39, #FFE11A, #F2594B, 1);
  lights[1] = new Light(232.5, 425, 27.5, #BEDB39, #FFE11A, #F2594B, 2);
  lights[2] = new Light(97.5, 503, 27.5, #BEDB39, #FFE11A, #F2594B, 3);
  lights[3] = new Light(187.5, 503, 27.5, #BEDB39, #FFE11A, #F2594B, 4);
  lights[4] = new Light(277.5, 503, 27.5, #BEDB39, #FFE11A, #F2594B, 5);
  lights[5] = new Light(142.5, 581, 27.5, #BEDB39, #FFE11A, #F2594B, 6);
  lights[6] = new Light(232.5, 581, 27.5, #BEDB39, #FFE11A, #F2594B, 7);
  
}

void draw() {

update(mouseX, mouseY);

for(Button currentButton : buttons){
  currentButton.Draw();
}

for(CheckButton currentcheckbuttons: checkbuttons){
currentcheckbuttons.Draw();
}

for(Light currentLight : lights){
 if(Switch==true && SwitchOff==false){
  for (int j = 0; j < result.length; j++) {
  lights[result[j]-1].light();}
   }else{
  currentLight.display();}
 }
  
    if(SwitchOff==true){
             //println("666");
   for(Light currentlightsOn:lightsOn){          
    currentlightsOn.light();
    }
    
    for(Light currentlightsOff : lightsOff){
     currentlightsOff.display(); 
    }
    
    }
    
    if(Check==true){
     for(Light currentLight : lights){
       currentLight.checklight();
     } 
    }


}



void mousePressed(){

  for(Light currentLight : lights){
  currentLight.display();}
  
  for(Button currentButton : buttons){
  if(currentButton.overRect()==true){
    Switch = true;
    SwitchOff=false;
    lightOn = currentButton.buttonId;
    result = new int[lightOn];
    lightsOn = new Light[lightOn];
    b=0;
    Bridge=new Light[1];
    lightsOff=new Light[0];
    currentButton.postpay();
    println(balanceBridge);
    println(balance);

   for(int i = 0; i < numbers.length; i++){
    numbers[i]=i+1;
    }
    
  shuffle(numbers); 

  for (int j = 0; j < result.length; j++) {
    result[j]=numbers[j];}
    
    result=sort(result);
    
  for (int j = 0; j < result.length; j++) {
    lightsOn[j]=lights[result[j]-1];
  }

  //println(result);
  }
}

  for(CheckButton currentcheckbuttons: checkbuttons){
   if(currentcheckbuttons.overRect()==true){
     Check=true;
     println("333");
     
   }
  }

  for(Light currentLightOn : lightsOn){
    if(currentLightOn.overCircle()==true){
        SwitchOff=true;
        lightOff=currentLightOn.lightId;
        
        Bridge[b]=lights[lightOff-1];
        Bridge=(Light[])append(Bridge, Bridge[b]);
        lightsOff=(Light[])shorten(Bridge);
        b=b+1; 
        
    if(lightsOff.length==lightsOn.length){

      buttons[lightOn-1].pay();
      println(balance);
      lightsOff = new Light[0];
      Bridge = new Light[1];
      lightsOn = new Light [0];
    }

      }
    }
    




}



void update(float mX, float mY) {

  for(Button currentButton : buttons){
  if ( currentButton.overRect() ) {
    currentButton.rectOver = true;
  }else{
    currentButton.rectOver = false;
  }
}
}

void shuffle(int[] array) {
  // i is the number of items remaining to be shuffled.
  for (int i = array.length; i > 1; i--) {
    // Pick a random element to swap with the i-th element.
    int j = (int)random(i);  // 0 <= j <= i-1 (0-based array)
    // Swap array elements.
    int tmp = array[j];
    array[j] = array[i-1];
    array[i-1] = tmp;
  }
}
