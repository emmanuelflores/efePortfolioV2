//
//  BoxesViewController.m
//  efePortfolio
//
//  Created by efe on 1/25/13.
//
//

#import "BoxesViewController.h"
#import "ofxiPhoneExtras.h"

@interface BoxesViewController (PrivateMethods)

@end

@implementation BoxesViewController

- (id) initWithFrame:(CGRect)frame app:(ofxiPhoneApp *)app {
    
    //ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    ofxiPhoneGetOFWindow()->setOrientation( OF_ORIENTATION_90_RIGHT );   //-- default portait orientation.
    
    return self = [super initWithFrame:frame app:app];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@end
