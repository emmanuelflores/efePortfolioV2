#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "Particle.h"
#include <vector>

static const unsigned int AMOUNT=350;//300
static const unsigned int TRACE_LENGTH=4;//5 or less

class FioritoAttractor : public ofxiPhoneApp {
	
public:
    
    FioritoAttractor();
    virtual ~FioritoAttractor();
    
public:
    void setup();
    void update();
    void draw();
    void exit();
	
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    
    void drawBackground();
    
    std::vector<Particle*> dot;
    typedef std::vector<Particle*>::iterator pIter;
    
    int     counter;
    
    float sTreshold;
    float accx,accy;
    int trig;
    int startshake;
    int shake;
    int shakemaxnumber ;
    int timeofgesture;
    
};
