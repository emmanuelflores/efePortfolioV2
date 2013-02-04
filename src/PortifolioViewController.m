//
//  PortifolioViewController.m
//  efePortfolio
//
//  Created by Casper Schipper on 28-01-13.
//
//

#import "PortifolioViewController.h"
#import "PortifolioCell.h"
#import "PortifolioCellView.h"

#import "testObjectStore.h"
#import "TestObjects.h"

#define kTableWidth 256
#define kNumberOfItems 30

@interface PortifolioViewController ()

@end

@implementation PortifolioViewController

@synthesize tableView1;
@synthesize tableView2;
@synthesize tableView3;
@synthesize tableView4;

@synthesize testImages;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage * image1 = [UIImage imageNamed:@"1.png"];
        UIImage * image2 = [UIImage imageNamed:@"2.png"];
        UIImage * image3 = [UIImage imageNamed:@"3.png"];
        UIImage * image5 = [UIImage imageNamed:@"5.png"];
        UIImage * image6 = [UIImage imageNamed:@"6.png"];
        
        testImages = [[NSArray alloc] initWithObjects:image1,image2,image3,image5,image6,nil];
        
        NSMutableArray * allItems = [[TestObjectStore defaultStore] allItems];
        
        for (int i = 0; i < kNumberOfItems ; i++ ) {
            TestObjects * myObject = [[TestObjects alloc]init];
            myObject.heigth = kTableWidth * (1.0 + (rand()%512 / 2048.0));
            myObject.image = [testImages objectAtIndex:rand() % [testImages count]];
            [allItems addObject:myObject];
        }
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    PortifolioCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[PortifolioCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
    }
    
    int collumn;
    if (tableView == tableView1) collumn = 0;
    else if (tableView == tableView2) collumn = 1;
    else if (tableView == tableView3) collumn = 2;
    else if (tableView == tableView4) collumn = 3;
    
    cell.tableIndex = indexPath.row;
    
    cell.imageView.frame = CGRectMake(0, 0, kTableWidth * 0.8, kTableWidth * 0.8);
    
    cell.imageView.image = [[[[TestObjectStore defaultStore] allItems] objectAtIndex:indexPath.row + offset] image];
	
    return (UITableViewCell *) cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (cell) {
        cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:(rand() % 512 / 512.0)];
    }
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BDCustomCell"];
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"BDCustomCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    return cell;
}
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [[[[TestObjectStore defaultStore] allItems] objectAtIndex:indexPath.row] heigth];
}


@end
