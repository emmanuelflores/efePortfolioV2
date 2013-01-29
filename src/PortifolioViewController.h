//
//  PortifolioViewController.h
//  efePortfolio
//
//  Created by Casper Schipper on 28-01-13.
//
//

#import <UIKit/UIKit.h>

@interface PortifolioViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property IBOutlet UITableView *tableView1;
@property IBOutlet UITableView *tableView2;
@property IBOutlet UITableView *tableView3;

@property UIImage * testImage;

@end
