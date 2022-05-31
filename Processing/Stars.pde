class Stars{

  float[] xPos, yPos; // Star position in the sky
  int dim;            // Number of stars
  int scanPos;        // Height of the line that scans the stars
  int shineLength;    // Length of the line that starts from the point in which the star is centered
  int skyLength, skyHeight; // Length and Height of the sky in the main window
  
  Stars(int dim, int shineLength, int skyLength, int skyHeight){
    this.dim = dim;
    this.scanPos = 0;
    this.shineLength = shineLength;
    
    this.skyLength = skyLength;
    this.skyHeight = skyHeight;
    
    this.xPos = new float[dim];
    this.yPos = new float[dim];
  }
  
  // //////////////////////////////////////////////////////
  // //////// CLASS METHOD TO INITIALIZE STAR POSITION
  // //////////////////////////////////////////////////////
  
  void setStarPosition(){
    for (int i = 0; i < dim; i++) {
        xPos[i] = random(1, skyLength-1);
    
        if(xPos[i] < skyLength/3 || xPos[i] > (5*skyLength)/8) {yPos[i] = random(1, skyHeight);}
        else {yPos[i] = random(1, skyHeight - 100);}
     }
  }  

  // /////////////////////////////////////////////////////////
  // ////// CLASS METHOD TO MAKE THE STARS SHINE
  // /////////////////////////////////////////////////////////
  
  void startShining(){
    
    // Set the dots (ellipse objects) in the sky
    for (int i=0; i < xPos.length; i++) {
       noStroke();
       fill(255);
       ellipse(xPos[i], yPos[i], (i%2)+1, (i%2)+1);
    }
    
    smooth();
    noStroke();
    scanPos = scanPos + 5;  // Velocity of the scanning
    if (scanPos == skyHeight) {scanPos = 0;} // The scan is set to 0 if it reaches the "end" of the sky
  
    stroke (255); // The color of the stars is set to white
    strokeWeight(1);
    for (int i=0; i < xPos.length/10; i++) {
        line (xPos[i] + shineLength, yPos[i], xPos[i], yPos[i]);
        line (xPos[i], yPos[i] + shineLength, xPos[i], yPos[i]);
        line (xPos[i], yPos[i], xPos[i] - shineLength, yPos[i]);
        line (xPos[i], yPos[i], xPos[i], yPos[i] - shineLength);
    
        if (scanPos > yPos[i]-20 || scanPos < yPos[i]+20) {shineLength = 5;}
        if (scanPos < yPos[i]-20 || scanPos > yPos[i]+20) {shineLength = 0;}
    }  
  }
}
