class Face extends FaceFeature {
    
    private ArrayList<FaceFeature> features;
    
    public Face(float x, float y, float sx, float sy, float rot) {
        
        super(x, y, sx, sy, rot);
        
        isFill = false;
        
        features = new ArrayList<FaceFeature>();
    }
    
    @Override
    public void draw() {
        
        super.draw();
        
        pushMatrix();
        ellipse(transform.getPosition().x, transform.getPosition().y, transform.getScale().x, transform.getScale().y);
        
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
