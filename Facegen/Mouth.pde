class Mouth extends FaceFeature {
    
    private float start; // start angle in radians
    private float stop; // stop angle in radians
    
    public Mouth(float x, float y, float sx, float sy, float rot, float start, float stop, FaceFeature anchor) {
        
        super(x, y, sx, sy, rot);
        
        this.anchor = anchor;
        this.start = radians(start);
        this.stop = radians(stop);
        isFill = false;
    }
    
    @Override
    public void draw() {
        
        super.draw();
        
        pushMatrix();
        translate(anchor.getTransform().getPosition().x, anchor.getTransform().getPosition().y);
        arc(transform.getPosition().x, transform.getPosition().y, transform.getScale().x, transform.getScale().y, start, stop);
        popMatrix();
    }
    
}
