class SVGShape {
  PShape main;
  PShape child;
  
  SVGShape(String main, String childName){
    this.main = loadShape("Images/"+ main + ".svg");
    child = this.main.getChild(childName);
  }
  
  /* ///////////////////////////////////////////////////////////////
  // /////// CLASS METHOD TO SHAPE THE SVGs
  // /////////////////////////////////////////////////////////////*/
  
  void display(color fillColor, float x, float y){
    child.disableStyle();
    fill(fillColor);
    noStroke();
    shape(child, x, y);  
  }
  
  void display(color fillColor){
    child.disableStyle();
    fill(fillColor);
    noStroke(); 
    shape(child);
  }

  void display(color fillColor, color strokeColor){
    child.disableStyle();
    fill(fillColor);
    stroke(strokeColor); 
    shape(child);
  }

  void display(color fillColor, color strokeColor, int strokeWeight){
    child.disableStyle();
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(strokeWeight);
    shape(child);
  }
  
  /* ///////////////////////////////////////////////////////////////
  // /////// CLASS METHOD TO GET MIN&MAX VERTEX & TO SKIP THEM
  // /////////////////////////////////////////////////////////////*/
  
  float[] getMinMax(boolean x){
    //@ if x is true  --> min&max along x axis are computed.
    //@ if x is false --> min&max along y axis are computed.
    
    float[] coord = new float[child.getVertexCount()];
    float[] output = new float[2];
    
    if(x){for (int i = 0; i < child.getVertexCount(); i++) coord[i] = child.getVertex(i).x;}
    if(!x){for (int i = 0; i < child.getVertexCount(); i++) coord[i] = child.getVertex(i).y;}
  
    output[0] = min(coord);
    output[1] = max(coord);
    return output;
  }
  
  PShape getPShapeChild(){
    return this.child;
  }
  
  float[] getXVertex(int N){
    float[] output = new float[child.getVertexCount()];
    for (int i = 0; i < child.getVertexCount(); i = i+N){
         output[i] = child.getVertex(i).x;
    }
    return output;
  }
  
  float[] getYVertex(int N){
    float[] output = new float[child.getVertexCount()];
    for (int i = 0; i < child.getVertexCount(); i = i+N){
       output[i] = child.getVertex(i).y;
    }
    return output;
  }
  
  
  
  void oscillate(int inc, float T, float xAmp, float yAmp){
  //@ pShape --> the SVG shape to move
  //@ inc --> increment that determines the "time evolution"
  //@ N --> the total period 
  //@ xAmp --> x amplitude
  //@ yAmp --> y amplitude

 
   float[] yEdges = getMinMax(false);
   float yMin = yEdges[0];
   float yMax = yEdges[1];
   
   float numVertex = child.getVertexCount();
   
    for (int i = 0; i < numVertex; i = i + 1) {
      PVector v = child.getVertex(i);
      float x0 = v.x;
      float y0 = v.y;
      //float freq = 0.0001 + f/1000;
      v.x = x0 + xAmp * ((yMax - y0)/(yMax - yMin)) *cos(TWO_PI*inc/(T));
      v.y = y0 + yAmp * ((yMax - y0)/(yMax - yMin)) *cos(TWO_PI*inc/(T)); 

      child.setVertex(i, v);
  }
}
  
}
