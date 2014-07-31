//
//  VONTrolleyData.h
//  Union
//
//  Created by Duri Abdurahman Duri on 7/31/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VONTrolleyData : NSObject

@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@property (strong, nonatomic) NSDate *time;


-(float)getLongitude;
-(float)getLatitude;
-(NSDate *)getCurrentTime;

@end
