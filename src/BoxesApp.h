//
//  BoxesApp.h
//  efePortfolio
//
//  Created by efe on 1/25/13.
//
//

#ifndef __efePortfolio__BoxesApp__
#define __efePortfolio__BoxesApp__

#include <iostream>
#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofMath.h"

#include "proximityBoxes.h"

using namespace std;

const static int numAssetsA = 450; //900 3600 225

class BoxesApp : public ofxiPhoneApp{
	
public:
    BoxesApp();
    virtual ~BoxesApp();
    
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
    
protected:
    ofColor c1 = ofColor(0,149,168);
    ofColor c2 = ofColor(0,97,111);
    ofColor c3 = ofColor(51,51,51);
    ofColor c4 = ofColor(102,102,102);
    ofColor c5 = ofColor(153,153,153);
    ofColor c6 = ofColor(204,204,204);
    ofColor c7 = ofColor(204,250,204);
    ofColor c8 = ofColor(102,220,204);
    ofColor c9 = ofColor(153,220,220);
    ofColor c10 = ofColor(102,153,220);
    ofColor palette[10] = {c1,c2,c3,c4,c5,c6,c7,c8,c9,c10};
    vector<ofColor>pickedColors;
    
    proximityBoxes xProx, yProx, aProx, rProx, sProx;
    
    vector<float>xGridMin;
    vector<float>xGridMax;
    vector<float>yGridMin;
    vector<float>yGridMax;
    
//    CGRect frameSize = [[UIScreen mainScreen]bounds];
//    float windowWidth = frameSize.size.width;
//    float windowHeight = frameSize.size.height;
    
    
    int startX;
    int startY;
    int Xspacing;
    int Yspacing;
    int gridCols;
    
    
    
    
    int gridNoise;
    
    vector<float>aMin;
    vector<float>aMax;
    vector<float>rMin;
    vector<float>rMax;
    vector<float>sMin;
    vector<float>sMax;
    
    
    /////////
    //mouse data
    ofVec2f mousePosition;
    
    
    //window
    //    float screenX = static_cast<float>(ofGetWidth());
    //    float screenY = static_cast<float>(ofGetHeight());
    //    float halfScreenX = screenX * 0.5f;
    //    float halfScreenY = screenY * 0.5f;
    
};

#endif /* defined(__efePortfolio__BoxesApp__) */
