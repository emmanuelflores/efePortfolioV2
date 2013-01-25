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
        self.view.backgroundColor = [UIColor grayColor];
        
        float viewHeight = self.view.bounds.size.height;
        float viewWidth = self.view.bounds.size.width;
        
        NSLog(@"%f,%f dit is de shizzle",viewWidth,viewHeight);
        
        // Custom initialization
        UILabel * myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        myLabel.text = @"Some stuff";
        [self.view addSubview:myLabel];
        
        UITableViewController * portTVC = [[PortifolioRowViewController alloc] initWithStyle:UITableViewStylePlain];
        portTVC.tableView.frame = CGRectMake(0,30,100,1);
        [self.view addSubview:portTVC.tableView];
        
        UITableViewController * portTVC2 = [[PortifolioRowViewController alloc] initWithStyle:UITableViewStylePlain];
        portTVC2.view.frame = CGRectMake(viewWidth/3.0,30,viewWidth/3.0,viewHeight-30);
        //[self.view addSubview:portTVC2.view];
        
        UITableViewController * portTVC3 = [[PortifolioRowViewController alloc] initWithStyle:UITableViewStylePlain];
        portTVC3.view.frame = CGRectMake(0.67 * viewWidth, 30, viewWidth/3.0 , viewHeight);
        //[self.view addSubview:portTVC3.view];
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
