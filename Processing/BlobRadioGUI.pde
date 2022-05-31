import controlP5.*;
import oscP5.*;
import netP5.*;

//Background
SVGShape mountainLines, radioBlob, waterReflex, blobProfilo, blobOcchioSx, blobOcchioDx, blobBocca, leftBox, centralBox, rightBox;
int opacity_n = 0, opacity_d = 0;

//Background Images
PImage dayImage_load, nightImage_load;

// Stars
Stars stars;
BlobStars bpstars, bbstars, bodxstars, bosxstars;

//Trees
SVGShape leftTrees, rightTrees, leftPine, rightPine;
int inc = 0; //Frames Inc

//Clouds
PImage[] clouds = new PImage[7];
int cloud_R = 160;
int cloud_G = 220;
int cloud_B = 250;
int cloud_opa = 100;
float[] cl = new float [7];
float[] pos = new float [7];
float[] high = new float [7];
color c = color(255, 255, 255);

//Rain
int numDrops = 75;
Rain[] drops = new Rain[numDrops];

//Loading Screen
PImage blob_load;
int timer = 8;

//Boolean Weather Conditions
boolean isWindy = false, isCloudy = false, isNight = false, isRainingMan = false, firstTime = true; 

//Weather Conditions Boxes
int xDist = 25, yDist = 30;  //da rivedere

String modeStatus = "", temp = "", humid = "", rain = "", light = "", windSpeed = "0", date = "";

//Knob Volume - Temp Slider
ControlP5 cp5;
Knob volKnob;
Slider tempSlider;
MyControlListener listener;

//OSC
OscP5 oscP5;
NetAddress myRemoteLocation;


void setup(){
  //Window Size
  size(1200,700);
  
  cp5 = new ControlP5(this); 
  
  //OSC Init
  oscP5 = new OscP5(this, 12000); // start OSC and listen port ...
  myRemoteLocation = new NetAddress("127.0.0.1",13000);
  
  //Loading img
  blob_load = requestImage("Images/blob.png");
    
  //Background Images
  dayImage_load = requestImage("Images/day.png");
  nightImage_load = requestImage("Images/night.png");
  
  //Background SVGs
  mountainLines = new SVGShape("mountains", "mountainLines");
  radioBlob = new SVGShape("mountains", "radioBlob");
  waterReflex = new SVGShape("mountains", "waterReflex");
  
  //Trees SVG
  leftTrees = new SVGShape("mountains", "leftTrees");
  rightTrees = new SVGShape("mountains", "rightTrees");
  leftPine = new SVGShape("mountains", "leftPine");
  rightPine = new SVGShape("mountains", "rightPine");
  
  //Clouds png
  for (int i = 0; i < 7; i++) {
   clouds[i] = requestImage("Images/nuvola" + nf(i, 1) + ".png");
   cl[i] =  0.3 + (6-i)*0.3;
   pos[i] = - clouds[i].width - 550;
   high[i] = 20 + random(i*15);
  }
  
  //Rain
  for (int i = 0; i < drops.length; i++) {
   drops[i] = new Rain(); // Create each object
  }
  
  //The great Blob in the Sky
  blobProfilo = new SVGShape("mountains", "blobProfilo");
  blobOcchioSx = new SVGShape("mountains", "blobOcchioSx");
  blobOcchioDx = new SVGShape("mountains", "blobOcchioDx");
  blobBocca =new SVGShape("mountains", "blobBocca");
  
  //Stars
  stars = new Stars(100, 10, 1200, 270);
  bpstars = new BlobStars(1, 5, 1200, 270, blobProfilo);
  bbstars = new BlobStars(15, 5, 1200, 270, blobBocca);
  bodxstars = new BlobStars(10, 5, 1200, 270, blobOcchioDx);
  bosxstars = new BlobStars(10, 5, 1200, 270, blobOcchioSx);
  stars.setStarPosition();
  bpstars.setBlobStarPosition();
  bbstars.setBlobStarPosition();
  bodxstars.setBlobStarPosition();
  bosxstars.setBlobStarPosition();
  
  //Boxes
  leftBox = new SVGShape("mountains", "leftBox");
  centralBox = new SVGShape("mountains", "centralBox");
  rightBox = new SVGShape("mountains", "rightBox");
        
  //listener              
  listener = new MyControlListener();
  
  //Volume Knob
  volKnob = cp5.addKnob("volKnob")
               .setRange(0,100)
               .setValue(100)
               .setValueSelf(100) 
               .setPosition(rightBox.getMinMax(true)[0] + xDist, rightBox.getMinMax(false)[0] + 0.3*yDist + 10)
               .setRadius(30)
               .setNumberOfTickMarks(10)
               .setTickMarkLength(4)
               .setLabelVisible(false)
               .setColorForeground(color(217,189,197)) // 184, 180, 45
               .setColorBackground(color(54, 143, 139))
               .setColorActive(color(217,189,197)) // 216,219,226
               .setDragDirection(Knob.VERTICAL)
               .setDecimalPrecision(0)
               ;
  volKnob.setVisible(false);
  
  cp5.getController("volKnob").addListener(listener);
  
  //Temperature Slider
  tempSlider = cp5.addSlider("tempSlider")
                  .setPosition(rightBox.getMinMax(true)[0] + 4.5*xDist + 15, rightBox.getMinMax(false)[0] + 1.3*yDist + 5)
                  .setSize(150, 25)
                  .setValueSelf(30) 
                  .setRange(0, 30)
                  .setLabelVisible(false)
                  .setColorForeground(color(217,189,197)) // 184, 180, 45
                  .setColorBackground(color(54, 143, 139))
                  .setColorActive(color(217,189,197)) // 216,219,226
                  .setValue(24)
                  .setDecimalPrecision(0)
                  .setNumberOfTickMarks(31)
                  ;
  tempSlider.setVisible(false);
  
  cp5.getController("tempSlider").addListener(listener);
  
}

void draw(){
  //windy
  if(float(windSpeed) == 0){
    isWindy = false;
  }
  else{
    isWindy = true;
  }
  
  //cloudy float(light) < 990
  if(float(light) <= 1000){
    isCloudy = true;
    if(float(light) <= 600){
      c = color(180, 180, 180);
    }
    else if(float(light) > 600 && float(light) <= 700){
      c = color(195, 195, 195);
    }
    else if(float(light) > 700 && float(light) <= 800){
      c = color(210, 210, 210);
    }
    else if(float(light) > 800 && float(light) <= 900){
      c = color(225, 225, 225);
    }
    else{
      c = color(255, 255, 255);
    }
  }
  else{
    isCloudy = false;
  }
  
  //raining
  if(float(rain) >= 640){
    isRainingMan = false;
  }
  else{
    isRainingMan = true;
    isCloudy = true;
  }
  
  //day and night
  if((float(date) >= 2000.0) || ((float(date) >= 0.0) && (float(date) < 800.0))){
    isNight = true;
  }
  else{
    isNight = false;
  }
  
  //Night Mode
  if(isNight){
    
    image(nightImage_load, 0, 0);
    
    stars.startShining();
    bpstars.startShining();
    bbstars.startShining();
    bodxstars.startShining();
    bosxstars.startShining();
    
    mountainLines.display(color(69, 83, 120));
    waterReflex.display(color(240, 180, 255)); 
    
    leftPine.display(color(131, 97, 160), color(75, 55, 105), 1);
    rightPine.display(color(131, 97, 160), color(75, 55, 105), 1);
    leftTrees.display(color(75, 43, 105), color(180, 140, 190), 5);
    rightTrees.display(color(75, 43, 105), color(180, 140, 190), 5);
    
    //Rain
    if(isRainingMan){
      for (int i = 0; i < drops.length; i++) {
        drops[i].fall();
      }
    }
    
    //Cloudy
    for(int i = 0; i < clouds.length; i++){
        if(pos[i] + clouds[i].width > 0){
          image(clouds[i], pos[i], high[i]);
          pos[i] = pos[i] + cl[i];
        }  
        else{
        pos[i] = 0 - clouds[i].width;
        }
      }
  }
  //Day Mode
  else if(!isNight){
    
    image(dayImage_load, 0, 0);
  
    
    mountainLines.display(color(250, 200, 220));
    waterReflex.display(color(180, 206, 255));
  
    leftPine.display(color(49, 140, 138), color(155, 155, 155), 1);
    rightPine.display(color(49, 140, 138), color(155, 155, 155), 1);
    leftTrees.display(color(19, 97, 105), color(170, 190, 190), 5);
    rightTrees.display(color(19, 97, 105), color(170, 190, 190), 5);
     
    //Rain
    if(isRainingMan){
      for (int i = 0; i < drops.length; i++) {
        drops[i].fall();
      }
    }
    
     // Moving clouds
    if(isCloudy){
      for(int i = 0; i < clouds.length; i++){
        if(pos[i] < 1200){  
          tint(c);    
          image(clouds[i], pos[i], high[i]);
          pos[i] = pos[i] + cl[i];
        }
        else{
          tint(c);
          image(clouds[i], 0-clouds[i].width, high[i]);
          pos[i] = 0-clouds[i].width;
        }
      }
    }
    else{
      for(int i = 0; i < clouds.length; i++){
        if(pos[i] + clouds[i].width > 0){
          image(clouds[i], pos[i], high[i]);
          pos[i] = pos[i] + cl[i];
        }  
        else{
        pos[i] = 0 - clouds[i].width;
        }
      }
    }
  }
  
  //Boxes
  leftBox.display(color(135, 189, 218, 80));
  centralBox.display(color(135, 189, 218, 80));
  rightBox.display(color(135, 189, 218, 80));
  radioBlob.display(color(255, 255, 255), color(2, 200, 200), 1);
  
  fill(0);
  textSize(19);
  status(leftBox);
  dateAndTime(leftBox);
  temperature(centralBox);
  humidity(centralBox);
  windSpeed(centralBox);
  
  if (timer == 0) {
    volKnob.setVisible(true);
    tempSlider.setVisible(true);
    
    text("WHAT'S THE MOOD TODAY?", leftBox.getMinMax(true)[0] + xDist, leftBox.getMinMax(false)[0] + yDist);
    text("Volume: " + ceil(volKnob.getValue()) + " %", rightBox.getMinMax(true)[0] + 0.6*xDist, rightBox.getMinMax(false)[0] + 3*yDist + 10);
    text("Temperature: " + floor(tempSlider.getValue()) + " °C", rightBox.getMinMax(true)[0] + 4.5*xDist + 13, rightBox.getMinMax(false)[0] + 1.1*yDist + 5);
    
  }
  if(isWindy){
      leftPine.oscillate(inc, 110.0, 0.4, 0.01);
      rightPine.oscillate(inc, 100.0, 0.4, 0.01);
      leftTrees.oscillate(inc, 90.0, 0.8, 0.01);
      rightTrees.oscillate(inc, 115.0, 0.8, 0.01);
  }
  
  inc++;
  
  // Loading Screen
  if(timer > 0){
    background(245, 250, 240);
    image(blob_load, 460, 200);
    textSize(40);
    fill(50, 0, 20);
    text("Loading", 500, 550); 
    if(timer > 3){
      stroke(0);
      strokeWeight(4);
      point(704 + (-timer * 10), 545);
    }
    print(timer);
    timer--;
  }
}




//////////////////////////////////////////////
////////// GET OSC
//////////////////////////////////////////////

void oscEvent(OscMessage theOscMessage) 
{  

 if (theOscMessage.checkAddrPattern("/ueue")) {
  modeStatus = theOscMessage.get(0).stringValue();
  println(modeStatus);
  temp = theOscMessage.get(1).stringValue();
  println(temp);
  humid = theOscMessage.get(2).stringValue();
  println(humid);
  rain = theOscMessage.get(3).stringValue();
  println(rain);
  light = theOscMessage.get(4).stringValue();
  println(light);
  windSpeed = theOscMessage.get(5).stringValue();
  println(windSpeed);
  date = theOscMessage.get(6).stringValue();
  println(date);
 }
}

///////////////////////////////////////////////////////
///////  OSC TEXT 
///////////////////////////////////////////////////////

void status(SVGShape box){
   float startPosX = box.getMinMax(true)[0];
   float startPosY = box.getMinMax(false)[0];
   text("Today is a " + modeStatus.toUpperCase() + " day", startPosX + xDist, startPosY + 2*yDist);
   
}

void dateAndTime(SVGShape box){
   float startPosX = box.getMinMax(true)[0];
   float startPosY = box.getMinMax(false)[0];

   int m = month();
   int d = day();
   int y = year();
   int h = hour();
   int mi = minute();
  
   String dt = String.valueOf(d); 
   String mt = String.valueOf(m);
   String yt = String.valueOf(y);
   String ht = String.valueOf(h);
   String mit = String.valueOf(mi);
   
   if(mi < 10) {mit = "0"+mit;}
   text(dt + "/" + mt + "/" + yt + " - " + ht + ":" + mit, startPosX + xDist, startPosY + 3*yDist);
}
   
void temperature(SVGShape box){
  float startPosX = box.getMinMax(true)[0];
  float startPosY = box.getMinMax(false)[0];
  
  text("Temperature: " + temp + "°C", startPosX + xDist, startPosY + yDist);
  
}   
   
void humidity(SVGShape box){
  float startPosX = box.getMinMax(true)[0];
  float startPosY = box.getMinMax(false)[0];
  
  text("Humidity: " + humid + "%", startPosX + xDist, startPosY + 2*yDist);

}   



void windSpeed(SVGShape box){
  float startPosX = box.getMinMax(true)[0];
  float startPosY = box.getMinMax(false)[0];
  if(float(windSpeed) == 0){
    text("Wind Intensity: No Wind", startPosX + xDist, startPosY + 3*yDist);
  }
  else if(float(windSpeed) > 0 && float(windSpeed) <= 4){
    text("Wind Intensity: Slow Wind", startPosX + xDist, startPosY + 3*yDist);
  }
  else if(float(windSpeed) > 4){
    text("Wind Intensity: Strong Wind", startPosX + xDist, startPosY + 3*yDist);
  }
}

///////////////////////////////////////////////////////
///////  LISTENER
///////////////////////////////////////////////////////

class MyControlListener implements ControlListener {
  int val;
  public void controlEvent(ControlEvent theEvent) {
    //println("Knob: "+ int(volKnob.getValue()) + "\nSlider: "+ int(tempSlider.getValue()));
    OscMessage msg = new OscMessage("/values");
    msg.add(int(volKnob.getValue()));
    msg.add(int(tempSlider.getValue()));
    oscP5.send(msg, myRemoteLocation);
  }
}
