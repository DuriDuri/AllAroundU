//
//  VONMenu.h
//  Union
//
//  Created by Duri Abdurahman Duri on 8/6/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VONMenu : NSObject

@property (strong, nonatomic) NSMutableDictionary *menu;

-(void)getMondayMenu:(NSString *)dinerURL;
-(void)getTuesdayMenu:(NSString *)dinerURL;
-(void)getWednesdayMenu:(NSString *)dinerURL;
-(void)getThursdayMenu:(NSString *)dinerURL;
-(void)getFridayMenu:(NSString *)dinerURL;
-(void)getSaturdayMenu:(NSString *)dinerURL;
-(void)getSundayMenu:(NSString *)dinerURL;

@end
