class FeatureDescription {
    
    private Transform transform;
    
    // amount used when using random generation
    private PVector positionVariance;
    private PVector scaleVariance;
    private float rotationVariance;
    
    private int anchorIndex;
    
    // Use randomly generated features
    public FeatureDescription(float vx, float vy, float vsx, float vsy, float rv, int ai,
                              boolean genPosition, boolean genScale, boolean genRotation) {
        
        positionVariance = new PVector(vx, vy);
        scaleVariance = new PVector(vsx, vsy);
        rotationVariance = rv;
        anchorIndex = ai;
        
        getRandomDescription(genPosition, genScale, genRotation);
    }
    
    // Use fixed values
    public FeatureDescription(float x, float y, float sx, float sy, float rot, int ai) {
        
        transform = new Transform(x, y, sx, sy, rot);
        anchorIndex = ai;
    }
    
    private void getRandomDescription(boolean genPosition, boolean genScale, boolean genRotation) {
        
        float x = 0, y = 0;
        float sx = 1, sy = 1;
        float rot = 0;
        
        if(genPosition) {
            x = map(random(-1, 1), -1, 1, -positionVariance.x, positionVariance.x);
            y = map(random(-1, 1), -1, 1, -positionVariance.y, positionVariance.y);
        }
        
        if(genScale) {
            sx = map(random(-1, 1), -1, 1, -scaleVariance.x, scaleVariance.x);
            sy = map(random(-1, 1), -1, 1, -scaleVariance.y, scaleVariance.y);
        }
        
        if(genRotation) {
            rot = map(random(-1, 1), -1, 1, -rotationVariance, rotationVariance);
        }
        
        transform = new Transform(x, y, sx, sy, rot);
    }
    
    public Transform getTransform() { return transform; }
    public int getAnchorIndex() { return anchorIndex; }
}
