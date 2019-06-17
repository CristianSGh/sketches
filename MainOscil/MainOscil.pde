import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import java.util.HashMap;

// Minim variables
Minim minim;
AudioOutput out;

// Oscilator list
Oscilators oscilators;

// Other globals
color bckgnd = color(0, 0, 0);

// Note map
HashMap<String, Float> notes;

void setup() {
    size(1280, 720);
    background(bckgnd);
    
    notes = new HashMap<String, Float>();
    notes.put("C4", new Float(261.63f));
    notes.put("D4", new Float(293.66f));
    notes.put("E4", new Float(329.63f));
    notes.put("F4", new Float(349.23f));
    notes.put("G4", new Float(392.0f));
    notes.put("A4", new Float(440.0f));
    notes.put("B4", new Float(493.88f));
    
    minim = new Minim(this);
    
    out = minim.getLineOut();
    
    oscilators = new Oscilators(true);
    
    frameRate(60);
}

void draw() {
    background(bckgnd);
    
    drawWaves(out, color(0, 191, 255));
    
    printCurrentInfo();
    printControls();
}

void drawWaves(AudioSource src, color col) {
    
    stroke(col);
    strokeWeight(2);
    
    for(int i = 0; i < src.bufferSize() - 1; ++i) {
        float xpos = map(i, 0, src.bufferSize()-1, 0, width);
        float nxpos = map(i+1, 0, src.bufferSize()-1, 0, width);
        line(xpos, height/2 - out.mix.get(i) * 100, nxpos, height/2 - out.mix.get(i + 1) * 100);
    }
}



void printCurrentInfo() {
    fill(255);
    textSize(20);
    String str = "| Index: " + (oscilators._currentIndex + 1) + "/" + oscilators.len() + " |";
    String sFreq = "| Freq: " + String.format("%.2f", oscilators._current.getFreq()) + " Hz |";
    String sAmp = "| Amp: " + String.format("%.2f", oscilators._current.getAmp()) + " |";
    text(str, 20, 20);
    text(sFreq, width - 260.0f, 20);
    text(sAmp, width - 260.0f, 50);
}

void printControls() {
    fill(255);
    textSize(20);
    String str = "[LEFT, RIGHT] - change oscilator\n[a] - add new oscilator\n[LMB] - FM | [RMB] - AM\n[1-5] - change waveform";
    text(str, 20, height - 100);
}



void mouseDragged() {
    
    if(mouseButton == LEFT) {
        oscilators.getCurrent().modulateFreq();
    }
    if(mouseButton == RIGHT) {
        oscilators.getCurrent().modulateAmp();
    }
    
}

void keyPressed() {
    switch(key) {
        case 'q':
            exit();
            break;
        case 'a':
            oscilators.add();
            break;
        case '1':
            oscilators.setCurrentWave(0);
            break;
        case '2':
            oscilators.setCurrentWave(1);
            break;
        case '3':
            oscilators.setCurrentWave(2);
            break;
        case '4':
            oscilators.setCurrentWave(3);
            break;
        case '5':
            oscilators.setCurrentWave(4);
        default:
            break;
    }
    
    if(key == CODED) {
        
        switch(keyCode) {
            case LEFT:
                oscilators.moveLeft();
                break;
            case RIGHT:
                oscilators.moveRight();
                break;
            default:
                break;
        }
        
    }
}
