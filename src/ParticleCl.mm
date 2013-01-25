//
//  ParticleCl.cpp
//  efePortfolio
//
//  Created by efe on 1/25/13.
//
//

#include "ParticleCl.h"


ParticleCl::ParticleCl()
{
}

ParticleCl::ParticleCl( ofVec2f loc, ofVec2f vel )
{
	mLoc	= loc;
	mVel	= vel;
	mRadius	= 4.0f;
    
    mXPercentage = 0;
    mYPercentage = 0;
    
    mAge        = 0;
    mLifespan   = 100;
    mAgePercentage = 0;
    mIsDead     = false;
    
    //mDecay  = Rand::randFloat(0.97f, 0.99f);
    mDecay  = (float)ofRandom(0.97f, 0.99f);
    
}

ParticleCl::~ParticleCl(){}

void ParticleCl::update(const Perlin &perlin)
{
	// get Perlin noise value based on my location and
	// elapsed seconds and turn this noise value into an angle.
	float nX = mLoc.x * 0.005f;
	float nY = mLoc.y * 0.005f;
	//float nZ = app::getElapsedSeconds() * 0.1f;
    float nZ = ofGetLastFrameTime() * 0.1f;
	float noise = perlin.fBm( nX, nY, nZ );
	float angle = noise * 15.0f;
	ofVec2f noiseVector( cos( angle ), sin( angle ) );
    
	mVel += noiseVector * 0.2f * ( 1.0f - mAgePercentage );
    
	mLoc += mVel;
    
    mVel *= mDecay;
    
    
    if (mLoc.x > 0 && mLoc.x < ofGetWindowWidth() ) {
        mXPercentage = (float) mLoc.x / (float) ofGetWindowWidth();
    }
    
    if (mLoc.y > 0 && mLoc.y < ofGetWindowWidth() ) {
        mYPercentage = (float) mLoc.y / (float) ofGetWindowHeight();
    }
    
    if (mAge > mLifespan) {
        mIsDead = true;
    } else {
        mAge++;
        mAgePercentage = (float) mAge / (float) mLifespan;
    }
    
}

void ParticleCl::draw()
{
	//gl::color( mColor );
	//gl::drawSolidCircle( mLoc, mRadius );
}