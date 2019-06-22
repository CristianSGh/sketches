class Face extends FaceFeature {
    
    private ArrayList<FaceFeature> features;
    
    public Face(float x, float y, float sx, float sy) {
        
        super(x, y, sx, sy);
        
        isFill = false;
        
        features = new ArrayList<FaceFeature>();
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
        ellipse(position.x, position.y, size.x, size.y);
        
        Iterator it = features.iterator();
        while(it.hasNext()) {
            FaceFeature feature = (FaceFeature) it.next();
            feature.draw();
        }
        popMatrix();
    }
    
    public void addFeature(FaceFeature feature) {
        features.add(feature);
    }
}
