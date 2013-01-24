//
//  FioritoViewController.m
//  efePortfolio
//
//  Created by efe on 1/24/13.
//
//

#import "FioritoViewController.h"
#import "ofxiPhoneExtras.h"

@interface FioritoViewController (PrivateMethods)

@end

@implementation FioritoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame app:(ofxiPhoneApp *)app {
    
    ofxiPhoneGetOFWindow()->setOrientation( OF_ORIENTATION_90_RIGHT );   //-- default portait orientation.
    
    return self = [super initWithFrame:frame app:app];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

@end
