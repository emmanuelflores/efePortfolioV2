//
//  CloudGesture.h
//  efePortfolio
//
//  Created by efe on 1/25/13.
//
//

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "Perlin.h"
#include "ParticleController.h"

#define NUM_PARTICLES_TO_SPAWN 10 //10 15 25

class CloudGesture : public ofxiPhoneApp{
	
public:
    CloudGesture();
    ~CloudGesture();
    void setup();
    void update();
    void draw();
    void exit();
	
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void mouseMoved(int x, int y );
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    
protected:
    ofVec2f mMouseLoc;
	ofVec2f mMouseVel;
    bool mIsPressed;
    
    Perlin mPerlin;
    
    ParticleController mParticleController;
    
};
