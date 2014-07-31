//
//  VONFirstViewController.m
//  Union
//
//  Created by Duri Abdurahman Duri on 7/30/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONFirstViewController.h"
#import "VONTrolleyData.h"

@interface VONFirstViewController ()

- (IBAction)mapTerrainSC:(UISegmentedControl *)sender;



@end

@implementation VONFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%f", [VONTrolleyData getLatitude]);
    [self.trolleyMapView.delegate self];
    [self.trolleyMapView setShowsUserLocation:YES];
    
    VONTrolleyData *trolley = [[VONTrolleyData alloc] init];
    
    trolley.title = @"Trolley Location";
    trolley.subtitle = @"Union College";
    trolley.coordinate = [VONTrolleyData getCoordinates];
    
    [self.trolleyMapView addAnnotation:trolley];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D location = [VONTrolleyData getCoordinates];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 100, 100);
    [self.trolleyMapView setRegion:region animated:YES];
}



- (IBAction)mapTerrainSC:(UISegmentedControl *)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            self.trolleyMapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.trolleyMapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.trolleyMapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}
@end
