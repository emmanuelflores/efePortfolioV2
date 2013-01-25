//
//  CloudGesture.cpp
//  efePortfolio
//
//  Created by efe on 1/25/13.
//
//

#include "CloudGesture.h"

CloudGesture::CloudGesture(){
    
}

CloudGesture::~CloudGesture(){
    
}
//--------------------------------------------------------------
void CloudGesture::setup(){
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	//ofBackground(127,127,127);
    
    ofSetFrameRate(40.0f);
    ofBackground(255, 255, 255);
    ofEnableAlphaBlending();
    
    mIsPressed = false;
    
    mPerlin = Perlin();
}

//--------------------------------------------------------------
void CloudGesture::update(){
    if( mIsPressed )
		mParticleController.addParticles( NUM_PARTICLES_TO_SPAWN, mMouseLoc, mMouseVel );
	
	mParticleController.update(mPerlin);
}

//--------------------------------------------------------------
void CloudGesture::draw(){
	//ofBackground(255, 255, 255);
    //ofBackgroundGradient(ofColor::white,ofColor(30,10,30), OF_GRADIENT_CIRCULAR);
    ofBackgroundGradient(ofColor::white,ofColor(210,210,210,120), OF_GRADIENT_BAR);
    mParticleController.draw();
}

//--------------------------------------------------------------
void CloudGesture::exit(){
    
}

//--------------------------------------------------------------
void CloudGesture::touchDown(ofTouchEventArgs & touch){
    mIsPressed = true;
    
}


void CloudGesture::mouseMoved(int x, int y ){
    
    mMouseVel = ( ofVec2f(x,y) - mMouseLoc );
	mMouseLoc = ofVec2f(x,y);
}

//--------------------------------------------------------------
void CloudGesture::touchMoved(ofTouchEventArgs & touch){
    
    mouseMoved(touch.x, touch.y);
    
}

//--------------------------------------------------------------
void CloudGesture::touchUp(ofTouchEventArgs & touch){
    mIsPressed = false;
}

//--------------------------------------------------------------
void CloudGesture::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void CloudGesture::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void CloudGesture::lostFocus(){
    
}

//--------------------------------------------------------------
void CloudGesture::gotFocus(){
    
}

//--------------------------------------------------------------
void CloudGesture::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void CloudGesture::deviceOrientationChanged(int newOrientation){
    
}


