//
//  proximityBoxes.cpp
//  ProximityHeights
//
//  Created by efe on 1/25/13.
//
//

#include "proximityBoxes.h"


proximityBoxes::proximityBoxes(){
    
}

proximityBoxes::proximityBoxes(float spring, float ease, vector<float>&min, vector<float>&max, float radius){
    _spring    = spring;
    _ease      = ease;
    _min       = min;
    _max       = max;
    _radius    = radius * radius;
    
    for(unsigned int i=0;i<numAssets;i++){
        _value.push_back(_min[i]);
        _goal.push_back(_max[i]);
        _speed.push_back(0);
    }
}

proximityBoxes::~proximityBoxes(){
    
}

float proximityBoxes::run(int i, vector<float>&xGridMin, vector<float>&yGridMin, ofVec2f mousePosition){
    float x = xGridMin[i];
    float y = yGridMin[i];
    
    
    _dist = pow(x - mousePosition.x, 2) + pow(y - mousePosition.y, 2);
    
    if (_dist < _radius) {
        _goal[i] = (1 - (_dist / _radius)) * (_max[i] - _min[i]) + _min[i];
    } else {
        _goal[i] = _min[i];
    }
    
    _speed[i] = (_speed[i] * _spring) + ((_goal[i] - _value[i]) * _ease);
    _value[i] += _speed[i];
    
    return _value[i];
}