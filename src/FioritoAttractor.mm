#include "FioritoAttractor.h"

//constructors and destructors
FioritoAttractor::FioritoAttractor(){
    
}

FioritoAttractor::~FioritoAttractor(){
    
}

void FioritoAttractor::setup(){
	ofRegisterTouchEvents(this);
	
	ofxAccelerometer.setup();
	
	ofxiPhoneAlerts.addListener(this);
	
	//If you want a landscape oreintation
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
	
    counter = 0;
    
    ofBackgroundGradient(ofColor::gray,ofColor(30,10,30), OF_GRADIENT_CIRCULAR);
    ofSetBackgroundAuto(true);
    ofEnableAlphaBlending();
    ofEnableSmoothing();
    
    
    for(unsigned int i=0;i<AMOUNT;i++){
        dot.push_back(new Particle());
    }
    
    
    for(pIter p=dot.begin(); p!=dot.end();++p){
        (*p)->setup();
    }
    
    for(unsigned int i=0;i<AMOUNT;i++){
        dot.at(i)->setNrOfTraceDots(TRACE_LENGTH);
    }
    
    
    //sTreshold = 1.6;
    sTreshold = 1.0;
    trig=0;
    shake=0;
    shakemaxnumber = 1;
    timeofgesture = 500;
}

//--------------------------------------------------------------
void FioritoAttractor::update(){
    for(pIter p=dot.begin(); p!=dot.end();++p){
        (*p)->update();
    }
    
    
    //shake
    accx=ofxAccelerometer.getForce().x;
    accy=ofxAccelerometer.getForce().y;
    
    if(accx<-sTreshold && trig ==0){
        //trig = 1;
        //startshake = ofGetElapsedTimeMillis();
        //NSLog(@"bang!");
        counter = (counter + 1)%2;
    }

    
    if (shake>shakemaxnumber) {
        shake=0;
    }
    
    //    counter = (counter + 1)%2;
    //    cout << counter << "\n";
    
    
    //drawing when not using gradient
    if( counter == 0){
        ofSetBackgroundAuto(true);
    }else{
        ofSetBackgroundAuto(false);
    }
}

//--------------------------------------------------------------
void FioritoAttractor::draw(){
    //ofBackgroundGradient(ofColor::gray,ofColor(30,10,30), OF_GRADIENT_CIRCULAR);
    drawBackground();
    
    //    if( counter == 0){
    //        ofSetBackgroundAuto(true);
    //        drawBackground();
    //    }else{
    //        ofSetBackgroundAuto(false);
    //    }
    
	for(pIter p=dot.begin(); p!=dot.end();++p){
        (*p)->toScreen();
    }
	
}

//--------------------------------------------------------------
void FioritoAttractor::exit(){
    
}

//--------------------------------------------------------------
void FioritoAttractor::touchDown(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void FioritoAttractor::touchMoved(ofTouchEventArgs & touch){
    for(pIter p=dot.begin(); p!=dot.end();++p){
        (*p)->touchMoved(touch);
    }
}

//--------------------------------------------------------------
void FioritoAttractor::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void FioritoAttractor::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void FioritoAttractor::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void FioritoAttractor::lostFocus(){
    
}

//--------------------------------------------------------------
void FioritoAttractor::gotFocus(){
    
}

//--------------------------------------------------------------
void FioritoAttractor::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void FioritoAttractor::deviceOrientationChanged(int newOrientation){
    
}


void FioritoAttractor::drawBackground(){
    ofBackgroundGradient(ofColor::gray,ofColor(30,10,30), OF_GRADIENT_CIRCULAR);
}