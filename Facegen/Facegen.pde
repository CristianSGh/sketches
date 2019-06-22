/*
    Inspired by a post on reddit
*/

import java.util.Iterator;

Face face;

void setup() {
    
    size(1000, 1000, P2D);
    background(0);
    
    face = new Face(width/2, height/2, 500, 500, 0);
    face.addFeature(new Eye(-100, -50, 50, 50, 0, face));
    face.addFeature(new Eye(100, -50, 50, 50, 0, face));
    face.addFeature(new Mouth(0, 0, 350, 350, 0, 0, 180, face));
    
    frameRate(60);
}

void draw() {
    
    background(0);
    
    face.draw();
}
