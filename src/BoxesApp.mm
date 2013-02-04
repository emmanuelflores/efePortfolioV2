//
//  BoxesApp.cpp
//  efePortfolio
//
//  Created by efe on 1/25/13.
//
//

#include "BoxesApp.h"

BoxesApp::BoxesApp(){
    
}

BoxesApp::~BoxesApp(){
    
}


//--------------------------------------------------------------
void BoxesApp::setup(){
	// initialize the accelerometer
	ofxAccelerometer.setup();
    ofEnableSmoothing();
    //ofEnableAlphaBlending();
    ofEnableBlendMode(OF_BLENDMODE_SCREEN);//blending enumeration
    
	
	//If you want a landscape oreintation
	iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
    
    
    gridCols= 90;//num of columns
    int spaceToDrawX = (ofGetWidth()/gridCols);//-45
    int spaceToDrawY = (ofGetHeight()/gridCols);
    startX = spaceToDrawX;//30
    startY = spaceToDrawY;//30
    Xspacing = ofGetWidth()/90;//10
    Yspacing = 10;
    
    gridNoise = 600;//300 1300
    
    for(unsigned int i=0;i<numAssetsA;i++){
        int row = floor(i / gridCols);
        int col = i % gridCols;
        
        
        int x = startX + ((col + 5) * Xspacing);
        //int x = startX + (col + 5 * Xspacing);
        //int y = startY + (row * Yspacing);
        int y = startY + ((row + 35) * Yspacing);
        
        //color
        int randomIndex = (int)ofRandom(10);
        pickedColors.push_back(palette[randomIndex]);
        // set x and y pos
        xGridMin.push_back(x);
        yGridMin.push_back(y);
        xGridMax.push_back(x + (int)(ofRandom(gridNoise) - (gridNoise/2)));
        yGridMax.push_back(y + (int)(ofRandom(gridNoise) - (gridNoise/2)));
        
        
        //sMin[i] = 0.8;
        sMin.push_back(0.8);
        sMax.push_back(sMin[i] + (int)ofRandom(6) * 1);
        
        aMin.push_back(50);
        aMax.push_back(sMin[i] + (int)ofRandom(205));
        
        rMin.push_back(0);
        rMax.push_back(360);
        
    }
    
    
    xProx = proximityBoxes(0.991, 0.001, xGridMin, xGridMax, 30);
    yProx = proximityBoxes(0.991, 0.001, yGridMin, yGridMax, 30);
    aProx = proximityBoxes(0.991, 0.005, aMin, aMax, 125);
    rProx = proximityBoxes(0.99, 0.001, rMin, rMax, 75);
    sProx = proximityBoxes(0.995, 0.005, sMin, sMax, 50);
}

//--------------------------------------------------------------
void BoxesApp::update(){
    
}

//--------------------------------------------------------------
void BoxesApp::draw(){
    
    drawBackground();
    
    //CHECK THE SIZE OF THE BOXES AND THEIR POSSITIONS
	for (unsigned int i=0; i<numAssetsA; i++) {
        //rectMode(CENTER);
        ofSetRectMode(OF_RECTMODE_CENTER);
        //noStroke();
        glLineWidth(1);
        
        //TRANSLATE BOXES
        ofPushMatrix();
        
        ofTranslate( xProx.run(i,xGridMin,yGridMin,mousePosition), yProx.run(i,xGridMin,yGridMin,mousePosition) );
        
        ofSetColor( pickedColors[i], aProx.run(i,xGridMin,yGridMin,mousePosition) * 10 );
        ofFill();
        
        //CORRECT THE INERTIA VALUES
        //ofRotate( ofDegToRad(rProx.run(i,xGridMin,yGridMin,mousePosition)) );
        ofRotate( ofRadToDeg(rProx.run(i,xGridMin,yGridMin,mousePosition)) );
        ofScale( sProx.run(i,xGridMin,yGridMin,mousePosition),
                sProx.run(i,xGridMin,yGridMin,mousePosition) ,
                sProx.run(i,xGridMin,yGridMin,mousePosition) );
        
        ofRect(0, 0, 11, 11);
        
        ofSetColor(0,0,0);
        ofNoFill();
        ofRect(0, 0, 11, 11);
        
        ofPopMatrix();
        
        //BOX DELAY
        ofPushMatrix();
        
        ofTranslate( xProx.run(i,xGridMin,yGridMin,mousePosition), yProx.run(i,xGridMin,yGridMin,mousePosition) );
        
        ofSetColor(0,0,0);
        ofNoFill();
        
        //CORRECT THE INERTIA VALUES
        //ofRotate( ofDegToRad(rProx.run(i,xGridMin,yGridMin,mousePosition)) );
        ofRotate( ofRadToDeg(rProx.run(i,xGridMin,yGridMin,mousePosition)) );
        ofScale( sProx.run(i,xGridMin,yGridMin,mousePosition),
                sProx.run(i,xGridMin,yGridMin,mousePosition) ,
                sProx.run(i,xGridMin,yGridMin,mousePosition) );
        
        ofRect(0, 0, 11, 11);
        
        ofPopMatrix();
    }
}

//--------------------------------------------------------------
void BoxesApp::exit(){
    
}

//--------------------------------------------------------------
void BoxesApp::touchDown(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void BoxesApp::touchMoved(ofTouchEventArgs & touch){
    mousePosition.x = touch.x;
    mousePosition.y = touch.y;
}

//--------------------------------------------------------------
void BoxesApp::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void BoxesApp::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void BoxesApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void BoxesApp::lostFocus(){
    
}

//--------------------------------------------------------------
void BoxesApp::gotFocus(){
    
}

//--------------------------------------------------------------
void BoxesApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void BoxesApp::deviceOrientationChanged(int newOrientation){
    
}


void BoxesApp::drawBackground(){
    //ofColor::gray
    ofBackgroundGradient(ofColor(204,204,204),ofColor(0,149,168), OF_GRADIENT_CIRCULAR);
}