//
//  VONFirstViewController.m
//  Union
//
//  Created by Duri Abdurahman Duri on 7/30/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONFirstViewController.h"
#import "VONDinnerMenu.h"
#import "TFHpple.h"
#import "VONMenuDataProvider.h"

@interface VONFirstViewController ()

- (IBAction)mapTerrainSC:(UISegmentedControl *)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *terainSegmentedControl;

- (IBAction)updateUserLocationButtonPressed:(UIButton *)sender;


@end

@implementation VONFirstViewController

-(VONTrolleyData *)trolley{
    if (!_trolley) _trolley = [[VONTrolleyData alloc] init];

    return _trolley;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ///// UNCOMMENT LATER
    
    //Set Map Region
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0,0.0}};
    region.center.latitude = 42.817743;
    region.center.longitude = -73.930522;
    region.span.latitudeDelta = 0.018f;
    region.span.longitudeDelta = 0.018f;

    [self.trolleyMapView setRegion:region animated:YES];

    
    [self.trolleyMapView.delegate self];
    
    [self.trolleyMapView setShowsUserLocation:YES];



///div[@class='menuitem']/span[@class='ul']
}

-(void)viewDidAppear:(BOOL)animated
{
    //Set Pin Details
    self.trolley.title = @"Trolley Location";
    self.trolley.subtitle = @"Union College";
    
    //Update Trolley Location
    [self updateTrolleyLocation];
    
    //Add pin to map
    [self.trolleyMapView addAnnotation:self.trolley];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - IBActions

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

- (IBAction)updateUserLocationButtonPressed:(UIButton *)sender {
    self.trolleyMapView.showsUserLocation = YES;
    CLLocationCoordinate2D userLocation = self.trolleyMapView.userLocation.coordinate;
    MKCoordinateRegion userRegion = MKCoordinateRegionMakeWithDistance(userLocation, 500, 500);
    [self.trolleyMapView setRegion:userRegion animated:YES];
}


#pragma mark - Helper Methods
-(void)updateTrolleyLocation
{
    self.trolley.coordinate = [VONTrolleyData getCoordinates];
}

- (void)drawLine {
    
    // remove polyline if one exists
    //[self.trolleyMapView removeOverlay:self.polyline];
    
    // create an array of coordinates from allPins
//   // MKPolyline *line = [MKPolyline p]
//    
//    CLLocationCoordinate2D *dots[10];
//    dots[1] = (42.8207575,-73.9340094);
//    CLLocationCoordinate2D *coordinates = (__bridge CLLocationCoordinate2D *)([[CLLocation alloc] init]);
//    coordinates = ((42.8210723,-73.9338968),
//                                           (42.8207142,-73.9313648),
//                                           (42.8193741,-73.9335901),
//                                           (42.8170968,-73.9351604),
//                                           (42.8164692,-73.9335204),
//                                           (42.8174807,-73.93281),
//                                           (42.8175931,-73.9331319),
//                                           (42.8186604,-73.9324231),
//                                           (42.8185581,-73.9320369),
//                                           (42.8195497,-73.931243),
//                                           (42.8197071,-73.9307885),
//                                           (42.819589, -73.929958),
//                                           (42.8203582,-73.9294577),
//                                           (42.8199057,-73.9270169),
//                                           (42.8193345,-73.9268679),
//                                           (42.8188852,-73.9266141),
//                                           (42.8184836,-73.9271182),
//                                           (42.8183029,-73.9274269));
    
//        ,(42.8179785,-73.9278532),new (42.8181037,-73.9281213)
//        ,new LatLng(42.8182925,-73.9278155),(42.8179785,-73.9278532),(42.8183029,-73.9274269),new LatLng(42.8184836,-73.9271182),new LatLng(42.8188852,-73.9266141),new LatLng(42.8193345,-73.9268679),
//        new LatLng(42.8199327,-73.926936),new LatLng(42.8201294,-73.9231487),new LatLng(42.8200734,-73.9224866),new LatLng(42.8189946,-73.9226741),new LatLng(42.8181316,-73.9231408),
//        new LatLng(42.8167872,-73.9243907),new LatLng(42.8154449,-73.9253053),new LatLng(42.8151524,-73.9273519),new LatLng(42.8155321,-73.9274182),new LatLng(42.8156737,-73.9279441),
//        new LatLng(42.8154619,-73.9283088),new LatLng(42.8152651,-73.9300791),new LatLng(42.8155239,-73.9311315),
//        new LatLng(42.8164413,-73.9305334),new LatLng(42.8165756,-73.9304744),new LatLng(42.8165032,-73.9303001),
//        new LatLng(42.8163964,-73.9305683),new LatLng(42.8146708,-73.9317297),new LatLng(42.8159362,-73.9364192),
//        new LatLng(42.8161448,-73.9388053),new LatLng(42.8206895,-73.9361968),new LatLng(42.8210988,-73.936347),
//        new LatLng(42.8215196,-73.9357001),new LatLng(42.8212863,-73.9341379),new LatLng(42.8209027,-73.9343978),
//        new LatLng(42.8206488,-73.934143)};
    // create a polyline with all cooridnates
//    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:self.allPins.count];
//    [self.mapView addOverlay:polyline];
//    self.polyline = polyline;
//    
//    // create an MKPolylineView and add it to the map view
//    self.lineView = [[MKPolylineView alloc]initWithPolyline:self.polyline];
//    self.lineView.strokeColor = [UIColor redColor];
//    self.lineView.lineWidth = 5;
    
}

@end
