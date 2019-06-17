class Oscilators {
    
    private ArrayList<COscil> elements;
    
    ArrayList<Waveform> waveTypes;
    
    private COscil _current;
    private int _currentIndex;
    
    Oscilators(boolean init) {
        elements = new ArrayList<COscil>();
        _current = null;
        
        waveTypes = new ArrayList<Waveform>();
        waveTypes.add(Waves.SINE);
        waveTypes.add(Waves.TRIANGLE);
        waveTypes.add(Waves.SAW);
        waveTypes.add(Waves.SQUARE);
        waveTypes.add(Waves.QUARTERPULSE);
        
        
        if(init) {
            COscil tmp = new COscil(440.0f, 0.5f, Waves.SINE);
            elements.add(tmp);
            _current = elements.get(0);
            _currentIndex = 0;
            _current.getOsc().patch(out);
        }
    }
    
    public int len() {
        return elements.size();
    }
    
    public COscil get(int index) {
        return elements.get(index);
    }
    
    public COscil getCurrent() {
        return _current;
    }
    
    public int getCurrentIndex() {
        _currentIndex = elements.indexOf(_current);
        return _currentIndex;
    }
    
    public void add() {
        COscil tmp = new COscil(440.0f, 0.5f, Waves.SINE);
        elements.add(tmp);
        tmp.getOsc().patch(out);
    }
    
    public void clear() {    // will break _currentIndex clamp
        elements.clear();
    }
    
    public void moveRight() {
        _currentIndex = constrain(++_currentIndex, 0, elements.size()-1);
        _current = elements.get(_currentIndex);
    }
    
    public void moveLeft() {
        _currentIndex = constrain(--_currentIndex, 0, elements.size()-1);
        _current = elements.get(_currentIndex);
    }
    
    public void setCurrentWave(int type) {
        _current.setWave(waveTypes.get(type));
    }
    
}
