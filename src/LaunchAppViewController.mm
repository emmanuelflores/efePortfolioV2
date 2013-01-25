#import "LaunchAppViewController.h"
#import "ExampleOFAppViewController.h"
#import "ExampleOFApp.h"
#import "FioritoViewController.h"
#import "FioritoAttractor.h"

#import "PortifolioViewController.h"

@interface LaunchAppViewController () {}

@end

@implementation LaunchAppViewController

#pragma mark - IB

- (IBAction)launchAppPressed:(id)sender {
    
    // Note we are not creating the ExampleOFAppViewController via storyboards
    // as is requires a custom initilaiser
    
    // create the app
    ExampleOFApp *exampleOFApp = new ExampleOFApp(); // For the curious, exampleOFApp will be deleted laters

    // create the frame for the app. In this example we create it to
    // be the the same size as the screen and respect this views
    // orientation
    CGRect mainScreenFrame = [[UIScreen mainScreen] bounds];
    CGRect frame = mainScreenFrame;
//    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
//        self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
//        frame.size.width = mainScreenFrame.size.height;
//        frame.size.height = mainScreenFrame.size.width;
//    }
    
    // create the app
    ExampleOFAppViewController *exampleOFAppViewController = [[ExampleOFAppViewController alloc] initWithFrame:frame app:exampleOFApp];
    // add it
    [self.navigationController pushViewController:exampleOFAppViewController animated:YES];
}

-(void)launchFioritoAttractor:(id)sender{
    FioritoAttractor *fioritoApp = new FioritoAttractor();
    
    CGRect mainScreenFrame = [[UIScreen mainScreen]bounds];
    CGRect frame = mainScreenFrame;
    
    //create the app
    FioritoViewController *fvc = [[FioritoViewController alloc]initWithFrame:frame app:fioritoApp];
    //add it
    [self.navigationController pushViewController:fvc animated:YES];
}

-(IBAction)launchPortifolio:(id)sender
{
    UIViewController * portVC = [[PortifolioViewController alloc]init];
    [self.navigationController pushViewController:portVC animated:YES];
}

#pragma mark - Life Cycle

-(id)init{
    self = [super init];
    if(self){
        
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

@end
