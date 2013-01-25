//
//  proximityBoxes.h
//  ProximityHeights
//
//  Created by efe on 1/25/13.
//
//

#ifndef __ProximityHeights__proximityBoxes__
#define __ProximityHeights__proximityBoxes__

#include <iostream>
#include "ofMain.h"

const static int numAssets = 900;//3600 225

using namespace std;

class proximityBoxes{
public:
    
    float _spring, _ease, _radius, _dist, _curValue;
    int i;
    vector<float> _min;
    vector<float> _max;
    vector<float> _goal;
    vector<float> _speed;
    vector<float> _value;
    
    
    proximityBoxes();
    proximityBoxes(float spring, float ease, vector<float>&min, vector<float>&max, float radius);
    ~proximityBoxes();
    virtual float run(int i, vector<float>&xGridMin, vector<float>&yGridMin, ofVec2f mousePosition);
};

#endif /* defined(__ProximityHeights__proximityBoxes__) */
