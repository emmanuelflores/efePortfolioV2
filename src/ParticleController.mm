#include <iostream>
#include "ParticleController.h"


ParticleController::ParticleController(){
    for (list<ParticleCl*>::iterator p = mParticles.begin(); p != mParticles.end(); ++p ){
        float value = ofRandom(1.0f,10.0f);
        circleSizes.push_back(float (value));
    }
}

ParticleController::~ParticleController(){}

void ParticleController::update(const Perlin &perlin) {
    for( list<ParticleCl*>::iterator p = mParticles.begin(); p != mParticles.end(); ) {
		if( (*p)->mIsDead ){
			p = mParticles.erase( p );
		} else {
			(*p)->update(perlin);
			++p;
		}
	}
}

void ParticleController::draw() {
    
//    for (list<ParticleCl*>::iterator p = mParticles.begin(); p != mParticles.end(); ++p ) {
//        (*p)->draw();
//    }
    
    ofNoFill();
    //ofBeginShape();
    
    for (list<ParticleCl*>::iterator p = mParticles.begin(); p != mParticles.end(); ++p ) {
//        glColor4f( sin( ofGetElapsedTimef() ), 1.0f - (*p)->mYPercentage, 1.0f - (*p)->mXPercentage, 1.0f - (*p)->mAgePercentage);
        //glColor4f( sin( ofGetLastFrameTime() ), 1.0f - p->mYPercentage, 1.0f - p->mXPercentage, 1.0f - p->mAgePercentage);
        glColor4f(0,0,0,0.2f);
        //ofVertex( (*p)->mLoc.x, (*p)->mLoc.y, 0.0f);
        ofCircle((*p)->mLoc.x,(*p)->mLoc.y, 5.0f);
    }
    
    //ofEndShape();
}

static ofVec2f randVec2f()
{
    float theta = ofRandom( (float)M_PI * 2.0f );
    return ofVec2f( math<float>::cos( theta ), math<float>::sin( theta ) );
}

void ParticleController::addParticles( int amt, const ofVec2f &mouseLoc, const ofVec2f &mouseVel ){
    
    for (int i =0; i < amt; i++) {
        
        ofVec2f loc = mouseLoc + randVec2f() * 5.0f;
		ofVec2f velOffset = randVec2f() * ofRandom( 1.0f, 5.0f );
		ofVec2f vel = mouseVel * 0.375f + velOffset;
		mParticles.push_back( new ParticleCl( loc, vel ) );
        
    }
    
}

