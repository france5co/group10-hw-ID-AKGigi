class Rain {
 float r = random(1200);
 float y = random(-height);
  
 void fall() {
   smooth();
   noStroke();
   y = y + 7;
   r = r + 0.5; 
   fill(148,240,255,100);
   ellipse(r, y, 2, 18);
   

  if(y>height){
    r = random(1200);
    y = random(-200);
  }
 }
 
}
