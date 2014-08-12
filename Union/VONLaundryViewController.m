//
//  VONLaundryViewController.m
//  Union
//
//  Created by Duri Abdurahman Duri on 8/12/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONLaundryViewController.h"

@interface VONLaundryViewController ()

@end

@implementation VONLaundryViewController

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

@end
