abstract class FaceFeature {

    protected PVector position;
    protected PVector size;
    
    protected boolean isFill;
    protected color fillCol;
    protected color strokeCol;
    
    public FaceFeature(float x, float y, float sx, float sy) {
        
        position = new PVector(x, y);
        size = new PVector(sx, sy);
        
        isFill = true;
        fillCol = color(0);
        strokeCol = color(0, 255, 191);
    }
    
    public abstract void draw();
    
    public PVector getPosition() { return position; }
    public PVector getSize() { return size; }
    public boolean IsFill() { return isFill; }
    public color getFillCol() { return fillCol; }
    public color getStrokeCol() { return strokeCol; }
    
}
