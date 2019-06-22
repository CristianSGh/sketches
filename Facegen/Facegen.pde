

Face face;

void setup() {
    
    size(1000, 1000, P2D);
    background(0);
    
    face = new Face(width/2, height/2, 400, 400);
    
    frameRate(60);
}

void draw() {
    
    background(0);
    
    face.draw();
}
