class Eye extends FaceFeature {

    private FaceFeature face;
    
    public Eye(float x, float y, float sx, float sy, FaceFeature anchor) {
        super(x, y, sx, sy);
        
        face = anchor;
    }
    
    public void draw() {
        
        if(isFill) {
            fill(fillCol);
        } else {
            noFill();
        }
        
        strokeWeight(2);
        stroke(strokeCol);
        
        pushMatrix();
        translate(face.position.x, face.position.y);
        ellipse(position.x, position.y, size.x, size.y);
        popMatrix();
    }
    
}
