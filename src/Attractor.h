#ifndef ATTRACTOR_H

#include "ofMain.h"

class Attractor{
public:
    Attractor();
    ~Attractor();
    virtual void setPos(float _x, float _y);
    virtual void setDir(float _dir);
    virtual void revDir();
    virtual void setAll(float _x, float _y, float _dir);
    
    float x,y;
    float xm,ym;
    float dir;
};



#endif