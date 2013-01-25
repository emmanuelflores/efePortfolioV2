//
//  ParticleCl.h
//  efePortfolio
//
//  Created by efe on 1/25/13.
//
//

#include "ofMain.h"
#include "Perlin.h"

class ParticleCl{
public:
    ParticleCl();
    ParticleCl( ofVec2f loc, ofVec2f vel);
    ~ParticleCl();
    void update(const Perlin &perlin);
    void draw();
    
    ofVec2f mLoc;
    ofVec2f mVel;
    
    float mRadius;
    ofColor mColor;
    
    int mAge;
    int mLifespan;
    float mAgePercentage;
    float mDecay;
    bool mIsDead;
    
    float mXPercentage, mYPercentage;
    
};
