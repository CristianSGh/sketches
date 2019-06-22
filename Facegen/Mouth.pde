class Mouth extends FaceFeature {
    
    private float start; // start angle in radians
    private float stop; // stop angle in radians
    
    public Mouth(float x, float y, float sx, float sy, float start, float stop, FaceFeature anchor) {
        
        super(x, y, sx, sy);
        
        this.anchor = anchor;
        this.start = radians(start);
        this.stop = radians(stop);
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
        
        pushMatrix();
        translate(anchor.position.x, anchor.position.y);
        arc(position.x, position.y, size.x, size.y, start, stop);
        popMatrix();
    }
    
}
