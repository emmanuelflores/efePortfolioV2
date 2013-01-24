//
//  PortifolioViewController.m
//  efePortfolio
//
//  Created by Casper Schipper on 24-01-13.
//
//

#import "PortifolioViewController.h"
#import "PortifolioRowViewController.h"

@interface PortifolioViewController ()

@end

@implementation PortifolioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UILabel * myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        myLabel.text = @"Some stuff";
        [self.view addSubview:myLabel];
        
        UITableViewController * portTVC = [[PortifolioRowViewController alloc] init];
        portTVC.view.frame = CGRectMake(100, 30, 100, 100);
        [self.view addSubview:portTVC.view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
