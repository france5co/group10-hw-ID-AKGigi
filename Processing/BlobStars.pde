class BlobStars extends Stars{
  SVGShape blob;
  
  BlobStars(int dim, int shineLength, int skyLength, int skyHeight, SVGShape blob){
    super(dim, shineLength, skyLength, skyHeight);
    this.blob = blob;
  }
  
  void setBlobStarPosition(){
    xPos = blob.getXVertex(dim);
    yPos = blob.getYVertex(dim);
  }
}
