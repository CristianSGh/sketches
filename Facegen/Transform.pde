class Transform {
    
    private PVector position;
    private float rotation;
    private PVector scale;
    
    public Transform(float x, float y, float sx, float sy, float rot) {
        
        position = new PVector(x, y);
        rotation = rot;
        scale = new PVector(sx, sy);
    }
    
    public PVector getPosition() { return position; }
    public float getRotation() { return rotation; }
    public PVector getScale() { return scale; }
    
    public void setPosition(float x, float y) {
        position.set(x, y);
    }
    public void setRotation(float rot) {
        rotation = rot;
    }
    public void setScale(float sx, float sy) {
        scale.set(sx, sy);
    }
    
}
