class Face extends FaceFeature {
    
    public Face(float x, float y, float sx, float sy) {
        
        super(x, y, sx, sy);
        
        isFill = false;
    }
    
    public void draw() {
        
        if(isFill) {
            fill(fillCol);
        } else {
            noFill();
        }
        
        strokeWeight(2);
        stroke(strokeCol);
        
        ellipse(position.x, position.y, size.x, size.y);
    }
    
}
