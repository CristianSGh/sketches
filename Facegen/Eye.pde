class Eye extends FaceFeature {
    
    public Eye(float x, float y, float sx, float sy, float rot, FaceFeature anchor) {
        super(x, y, sx, sy, rot);
        
        this.anchor = anchor;
    }
    
    @Override
    public void draw() {
        
        super.draw();
        
        pushMatrix();
        translate(anchor.getTransform().getPosition().x, anchor.getTransform().getPosition().y);
        ellipse(transform.getPosition().x, transform.getPosition().y, transform.getScale().x, transform.getScale().y);
        popMatrix();
    }
    
}
