//
//  VONMenuViewController.m
//  Union
//
//  Created by Duri Abdurahman Duri on 8/3/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONMenuViewController.h"
#import "TFHpple.h"
#import "VONMenuDataProvider.h"

@interface VONMenuViewController ()
- (IBAction)diningHallSC:(UISegmentedControl *)sender;
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *menuTableViewCell;
@property (strong, nonatomic) NSArray *menu;
@property (strong, nonatomic) NSArray *westMenu;
@property (strong, nonatomic) NSArray *upperMenu;
@end

@implementation VONMenuViewController

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
    NSURL *menuURL = [NSURL URLWithString:[VONMenuDataProvider getUpperDiningHallURL]];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    self.menu  = [doc searchWithXPathQuery:@"//td[@id='tuesday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)diningHallSC:(UISegmentedControl *)sender {
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
    return [self.menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [self.menuTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    TFHppleElement * element = [self.menu objectAtIndex:indexPath.row];
    
    //    for (TFHppleElement *node in elements) {
    //        NSLog(@"%@", [node text]);
    //        NSLog(@"%@", [node attributes]);
    //    }
    cell.textLabel.text = [element text];
    return cell;
}

@end
