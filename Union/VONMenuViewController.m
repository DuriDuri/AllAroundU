//
//  VONMenuViewController.m
//  Union
//
//  Created by Duri Abdurahman Duri on 8/9/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONMenuViewController.h"
#import "VONMenuDataProvider.h"
#import "TFHpple.h"
@interface VONMenuViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)diningHallSC:(UISegmentedControl *)sender;

@property (strong, nonatomic) NSMutableDictionary *todaysMenu;
@property (strong, nonatomic) NSString *diningHallURL;
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
    //TableView instances
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    //Initialize todays Menu
    
    self.diningHallURL = [VONMenuDataProvider getUpperDiningHallURL];
    
    self.todaysMenu = [VONMenu getMondayMenu:self.diningHallURL];
    //NSLog(@"%@", self.todaysMenu);
   // NSLog(@"Mondays Menu: Breakfast %@ ", self.todaysMenu.menu);
   // [self getMondayMenu:[VONMenuDataProvider getWestDiningHallURL]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView DataSource methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section ==0){
        TFHppleElement *meal = [self.todaysMenu objectForKey:kVONBreakfastKey][indexPath.row];
        cell.textLabel.text =[meal text];
    }
    if (indexPath.section ==1) cell.textLabel.text =[[self.todaysMenu objectForKey:kVONLunchKey][indexPath.row] text];
    if (indexPath.section ==2) cell.textLabel.text =[[self.todaysMenu objectForKey:kVONDinnerKey][indexPath.row] text];

    
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return [[self.todaysMenu objectForKey:kVONBreakfastKey] count];
    if (section == 1) return [[self.todaysMenu objectForKey:kVONLunchKey] count];
    if (section == 2) return [[self.todaysMenu objectForKey:kVONDinnerKey] count];
    return 15;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0 && [[self.todaysMenu objectForKey:kVONBreakfastKey] count] ) return @"BreakFast";
    if (section == 1 && [[self.todaysMenu objectForKey:kVONLunchKey] count]) return @"Lunch";
    if (section == 2 && [[self.todaysMenu objectForKey:kVONDinnerKey] count]) return @"Dinner";
    else return @"";
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

-(void)getMondayMenu:(NSString *)dinerURL{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *breakfastMenu = [doc searchWithXPathQuery:@"//td[@id='monday']/table[@class='dayinner']/tr[@class='brk']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *lunchMenu = [doc searchWithXPathQuery:@"//td[@id='monday']/table[@class='dayinner']/tr[@class='lun']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *dinnerMenu = [doc searchWithXPathQuery:@"//td[@id='monday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    
    if (breakfastMenu) NSLog(@"Breakfast is %@" , breakfastMenu);
    if (lunchMenu)  NSLog(@" \n Lunch is %@", lunchMenu) ;
    if (dinnerMenu) NSLog(@"  \n Dinner is%@", dinnerMenu);
}


- (IBAction)diningHallSC:(UISegmentedControl *)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            self.diningHallURL = [VONMenuDataProvider getWestDiningHallURL];
            [self.tableView reloadData];
            break;
        case 1:
           self.diningHallURL = [VONMenuDataProvider getUpperDiningHallURL];
            [self.tableView reloadData];
            break;
        default:
            break;
    }
}
@end
