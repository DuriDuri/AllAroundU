//
//  VONMenuTableViewController.m
//  Union
//
//  Created by Duri Abdurahman Duri on 8/2/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONMenuTableViewController.h"
#import "TFHpple.h"
#import "VONMenuDataProvider.h"
@interface VONMenuTableViewController ()

@property (strong, nonatomic) NSArray *menu;
@property (strong, nonatomic) NSArray *westMenu;
@property (strong, nonatomic) NSArray *upperMenu;

- (IBAction)diningHallSC:(UISegmentedControl *)sender;

@end

@implementation VONMenuTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSURL *menuURL = [NSURL URLWithString:[VONMenuDataProvider getUpperDiningHallURL]];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    self.menu  = [doc searchWithXPathQuery:@"//td[@id='tuesday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)diningHallSC:(UISegmentedControl *)sender {
//    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
//        case 0:
//            self.trolleyMapView.mapType = MKMapTypeStandard;
//            break;
//        case 1:
//            self.trolleyMapView.mapType = MKMapTypeSatellite;
//            break;
//        case 2:
//            self.trolleyMapView.mapType = MKMapTypeHybrid;
//            break;
//        default:
//            break;
//    }
//
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

    TFHppleElement * element = [self.menu objectAtIndex:indexPath.row];

//    for (TFHppleElement *node in elements) {
//        NSLog(@"%@", [node text]);
//        NSLog(@"%@", [node attributes]);
//    }
    cell.textLabel.text = [element text];
    return cell;
}


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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
