abstract class FaceFeature {

    protected Transform transform;
    protected FaceFeature anchor;
    
    protected boolean isFill;
    protected color fillCol;
    protected boolean isStroke;
    protected color strokeCol;
    
    public FaceFeature(float x, float y, float sx, float sy, float rot) {
        
        transform = new Transform(x, y, sx, sy, rot);
        anchor = null;
        
        isFill = true;
        fillCol = color(0, 255, 191);
        isStroke = true;
        strokeCol = color(0, 255, 191);
    }
    
    public FaceFeature(FeatureDescription desc, ArrayList<FaceFeature> features) {
        
        transform = desc.getTransform();
        anchor = features.get(desc.getAnchorIndex());
        
        isFill = true;
        fillCol = color(0, 255, 191);
        isStroke = true;
        strokeCol = color(0, 255, 191);
    }
    
    public void draw() {
        
        if(isFill) {
            fill(fillCol);
        } else {
            noFill();
        }
        
        if(isStroke) {
            strokeWeight(2);
            stroke(strokeCol);
        } else {
            noStroke();
        }
    }
    
    public Transform getTransform() { return transform; }
    public boolean IsFill() { return isFill; }
    public color getFillCol() { return fillCol; }
    public boolean IsStroke() { return isStroke; }
    public color getStrokeCol() { return strokeCol; }
    
}
