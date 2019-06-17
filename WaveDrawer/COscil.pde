class COscil {
    private Oscil _osc;
    private float _freq;
    private float _amp;
    private Waveform _wave;
    
    final private float MIN_FREQ = 16.35f; // C0
    final private float MAX_FREQ = 1975.53f; // B6
    
    final private float MIN_AMP = 0.0f;
    final private float MAX_AMP = 1.0f;
    
    COscil(float freq, float amp) {
        _freq = freq;
        _amp = amp;
        _wave = Waves.SINE;
        
        _osc = new Oscil(_freq, _amp, _wave);
    }
    
    COscil(float freq, float amp, Waveform wave) {
        _freq = freq;
        _amp = amp;
        _wave = wave;
        
        _osc = new Oscil(_freq, _amp, _wave);
    }
    
    public void modulateFreq() {
        _freq = map(mouseX, 0, width, MIN_FREQ, MAX_FREQ);
        _osc.setFrequency(_freq);
    }
    
    public void modulateAmp() {
        _amp = map(mouseY, height, 0, MIN_AMP, MAX_AMP);
        _osc.setAmplitude(_amp);
    }
    
    public Oscil getOsc() {
        return _osc;
    }
    
    public float getFreq() {
        return _freq;
    }
    
    public float getAmp() {
        return _amp;
    }
    
    public Waveform getWave() {
        return _wave;
    }
    
    public void setFreq(float freq) {
        _freq = freq;
        _freq = constrain(_freq, MIN_FREQ, MAX_FREQ);
        _osc.setFrequency(_freq);
    }
    
    public void setAmp(float amp) {
        _amp = amp;
        _amp = constrain(_amp, MIN_AMP, MAX_AMP);
        _osc.setAmplitude(_amp);
    }
    
    public void setWave(Waveform wave) {
        _wave = wave;
        _osc.setWaveform(_wave);
    }
}
