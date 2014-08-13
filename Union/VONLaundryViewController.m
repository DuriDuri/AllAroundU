//
//  VONLaundryViewController.m
//  Union
//
//  Created by Duri Abdurahman Duri on 8/12/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONLaundryViewController.h"
#import "VONLaundryDataProvider.h"
#import "VONLaundryRoomFactory.h"
#include "VONLaundryDetailViewController.m"

@interface VONLaundryViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSMutableDictionary *laundryRoomFactory;

@property (strong, nonatomic) NSMutableArray *laundryRooms;

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
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    
    
    self.laundryRoomFactory = [VONLaundryRoomFactory laundryRooms];
    self.laundryRooms = [[self.laundryRoomFactory allKeys]mutableCopy];
    NSLog(@"%@", self.laundryRooms);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [self.laundryRooms objectAtIndex:indexPath.row ];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toLaundryDetailVC" sender:indexPath];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.laundryRooms count];
}





#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.identifier isEqualToString:@"toLaundryDetailVC"]) {
            VONLaundryDetailViewController *detailedLaundryRoomVC = segue.destinationViewController;
            NSIndexPath *path = [self.tableview indexPathForCell:sender];
            NSString *laundryRoomFactoryKey = [self.laundryRooms objectAtIndex:path.row];
            NSString *url = [self.laundryRoomFactory objectForKey:laundryRoomFactoryKey];
            detailedLaundryRoomVC.detailedLaundryRoomURL = url;
            NSLog(@"The key is %@ and the url is %@", laundryRoomFactoryKey, url);
        }

    }
}


@end
