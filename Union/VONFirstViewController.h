//
//  VONFirstViewController.h
//  Union
//
//  Created by Duri Abdurahman Duri on 7/30/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface VONFirstViewController : UIViewController<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *trolleyMapView;

@end
