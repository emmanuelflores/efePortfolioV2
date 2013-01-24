#include "FioritoAttractor.h"

//constructors and destructors
FioritoAttractor::FioritoAttractor(){
    
}

FioritoAttractor::~FioritoAttractor(){
    
}

void FioritoAttractor::setup(){
	// register touch events
	ofRegisterTouchEvents(this);
	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//iPhoneAlerts will be sent to this.
	ofxiPhoneAlerts.addListener(this);
	
	//If you want a landscape oreintation
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
    counter = 0;
    
    //ofBackground(32);
    ofBackgroundGradient(ofColor::gray,ofColor(30,10,30), OF_GRADIENT_CIRCULAR);
    //ofBackground(0,0,0);
    ofSetBackgroundAuto(true);
    //ofEnableAlphaBlending();
    //blending modes
    glEnable(GL_BLEND);
	//glBlendFunc( GL_ONE, GL_ONE_MINUS_DST_COLOR );
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    /*
     http://pyopengl.sourceforge.net/documentation/manual/glBlendFunc.3G.html
     GL_ZERO	 0 0 0 0
     GL_ONE	 1 1 1 1
     GL_SRC_COLOR	 R s / k R G s / k G B s / k B A s / k A
     GL_ONE_MINUS_SRC_COLOR	 1 1 1 1 - R s / k R G s / k G B s / k B A s / k A
     GL_DST_COLOR	 R d / k R G d / k G B d / k B A d / k A
     GL_ONE_MINUS_DST_COLOR	 1 1 1 1 - R d / k R G d / k G B d / k B A d / k A
     GL_SRC_ALPHA	 A s / k A A s / k A A s / k A A s / k A
     GL_ONE_MINUS_SRC_ALPHA	 1 1 1 1 - A s / k A A s / k A A s / k A A s / k A
     GL_DST_ALPHA	 A d / k A A d / k A A d / k A A d / k A
     GL_ONE_MINUS_DST_ALPHA	 1 1 1 1 - A d / k A A d / k A A d / k A A d / k A
     GL_SRC_ALPHA_SATURATE	 i i i 1
     GL_CONSTANT_COLOR	 R c G c B c A c
     GL_ONE_MINUS_CONSTANT_COLOR	 1 1 1 1 - R c G c B c A c
     GL_CONSTANT_ALPHA	 A c A c A c A c
     GL_ONE_MINUS_CONSTANT_ALPHA	 1 1 1 1 - A c A c A c A c
     
     http://jerome.jouvie.free.fr/OpenGl/Tutorials/Tutorial9.php
     
     http://www.modwiki.net/wiki/OpenGL_Blendmode_(Materials)
     */
    
    //SMOOTH
    ofEnableSmoothing();
	//glShadeModel(GL_SMOOTH);
	//glEnable(GL_MULTISAMPLE);
	//glEnable(GL_POLYGON_SMOOTH);
	//glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST);
	//glEnable(GL_LINE_SMOOTH);
	//glHint(GL_LINE_SMOOTH_HINT,GL_NICEST);
    
    
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
        NSLog(@"bang!");
        counter = (counter + 1)%2;
    }
    //    if(accx>sTreshold && trig == 1){
    //        //trig=2;
    //        NSLog(@"Bang2!");
    //    }
    //    if(accx<-sTreshold && trig == 2){
    //        trig=3;
    //    }
    //    if(accx>sTreshold && trig == 3){
    //        trig=4;
    //    }
    //    if (trig==4) {
    //        shake++;
    //        trig=0;
    //    }
    //    if ((ofGetElapsedTimeMillis() - startshake) > timeofgesture) {
    //        trig=0;
    //    }
    
    
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