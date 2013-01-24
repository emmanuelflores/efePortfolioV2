#include "Attractor.h"


Attractor::Attractor(){
    xm = 0;
    ym = 0;
}

Attractor::~Attractor(){
    
}

void Attractor::setPos(float _x, float _y){
    x = _x;
    y = _y;
}

void Attractor::setDir(float _dir){
    dir = _dir;
}

void Attractor::revDir(){
    dir = -dir;
}

void Attractor::setAll(float _x, float _y, float _dir){
    x = _x;
    y = _y;
    dir = _dir;
}