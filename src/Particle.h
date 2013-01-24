//
//  Particle.h
//  AttractorFiore2
//
//  Created by efe on 1/17/13.
//
//

#ifndef AttractorFiore2_Particle_h
#define AttractorFiore2_Particle_h

#include "ofMain.h"
#include "ofxiPhone.h"
#include "Attractor.h"

class Particle{
public:
    int NR_OF_DOTS_TO_STORE;
    float   nx, ny;
    float   xm, ym;
    std::vector<float> x;
    std::vector<float> y;
    int     type;
    Attractor att;
    float   mTouchX, mTouchY;
    
    
    Particle(){
        att.setAll(0.5,0.5,1);
        int NR_OF_DOTS_TO_STORE = 5;
        
        type=(int)ofRandom(3);
        
        nx=ofRandom(1);
        ny=ofRandom(1);
        
        xm=0.001*ofRandom(-1,1);
        ym=0.001*ofRandom(-1,1);
        
        for (unsigned int i=0;i<NR_OF_DOTS_TO_STORE;i++) {
            //x[i]=nx;
            x.push_back(nx);
            //y[i]=ny;
            y.push_back(ny);
        }
    }
    
    ~Particle(){}
    
    void setup(){
        //    att.setAll(0.5,0.5,1);
        //    int NR_OF_DOTS_TO_STORE = 5;
        //
        //    type=(int)ofRandom(3);
        //
        //    nx=ofRandom(1);
        //    ny=ofRandom(1);
        //
        //    xm=0.001*ofRandom(-1,1);
        //    ym=0.001*ofRandom(-1,1);
        //
        //    //x=new float[NR_OF_DOTS_TO_STORE];
        //    //y=new float[NR_OF_DOTS_TO_STORE];
        //    for (unsigned int i=0;i<NR_OF_DOTS_TO_STORE;i++) {
        //        //x[i]=nx;
        //        x.push_back(nx);
        //        //y[i]=ny;
        //        y.push_back(ny);
        //    }
    }
    
    void setNrOfTraceDots(int n){
        NR_OF_DOTS_TO_STORE=n;
        //x=new float[n];
        //y=new float[n];
    }
    
    void update(){
        float d2Div[3]={
            10000,  30000, 3000   };
        float minD[3]={
            0.00015, 0.005, 0.01  };
        float damp[3]={
            0.96,    0.985,  0.929  };
        
        float dx=att.x-nx;
        float dy=att.y-ny;
        //float d2=(float)(sqrt(dx)+sqrt(dy));
        float d2=(float)((dx*dx)+(dy*dy));
        
        if (d2>minD[type]){
            d2*=d2Div[type];
            xm+=att.dir*dx/d2;
            ym+=att.dir*dy/d2;
        } else {
            xm/=damp[type];
            ym/=damp[type];
        }
        xm*=damp[type];
        ym*=damp[type];
        nx+=xm;
        ny+=ym;
        for (unsigned int i=NR_OF_DOTS_TO_STORE-1;i>0;i--) {
            x.at(i)=x.at(i-1);
            y.at(i)=y.at(i-1);
        }
        x.at(0)=nx;
        y.at(0)=ny;
        
    }
    
    void toScreen(){
        float col[3][4]={
            {
                255,224,124,80    }
            ,{
                255,166,92,80    }
            ,{
                255,192,22,80    }
        };
        
        /*
         stroke porting
         ofFill();
         ofSetColor(255, 255, 255); //fill color
         ofRect(x, y, width, height);
         ofNoFill();
         ofSetColor(255, 0, 0);//stroke color
         ofRect(x, y, width, height);
         */
        for (unsigned int i=0;i<NR_OF_DOTS_TO_STORE-1;i++) {
            //stroke(col[type][0],col[type][1],col[type][2],col[type][3]);
            ofNoFill();
            ofSetColor(col[type][0],col[type][1],col[type][2],col[type][3]);
            ofLine(x[i]*ofGetWidth(),y[i]*ofGetHeight(),x[i+1]*ofGetWidth(),y[i+1]*ofGetHeight());
        }
    }
    
    void touchMoved(ofTouchEventArgs &touch){
        //mTouchX = touch.x;
        //mTouchY = touch.y;
        att.setPos(touch.x/(float)ofGetWidth(), touch.y/(float)ofGetHeight());
        
    }
    
};



#endif
