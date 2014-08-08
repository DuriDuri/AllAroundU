//
//  VONMenu.m
//  Union
//
//  Created by Duri Abdurahman Duri on 8/6/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONMenu.h"
#import "TFHpple.h"
@implementation VONMenu

@synthesize menu;

-(void)getMondayMenu:(NSString *)dinerURL{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *breakfastMenu = [doc searchWithXPathQuery:@"//td[@id='monday']/table[@class='dayinner']/tr[@class='brk']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *lunchMenu = [doc searchWithXPathQuery:@"//td[@id='monday']/table[@class='dayinner']/tr[@class='lun']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *dinnerMenu = [doc searchWithXPathQuery:@"//td[@id='monday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    
    if (breakfastMenu)[self.menu setObject:breakfastMenu forKey:kVONBreakfastKey];
    if (lunchMenu)[self.menu setObject:lunchMenu forKey:kVONLunchKey];
    if (dinnerMenu)[self.menu setObject:dinnerMenu forKey:kVONDinnerKey];
}

-(void)getTuesdayMenu:(NSString *)dinerURL
{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *breakfastMenu = [doc searchWithXPathQuery:@"//td[@id='tuesday']/table[@class='dayinner']/tr[@class='brk']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *lunchMenu = [doc searchWithXPathQuery:@"//td[@id='tuesday']/table[@class='dayinner']/tr[@class='lun']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *dinnerMenu = [doc searchWithXPathQuery:@"//td[@id='tuesday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    
    if (breakfastMenu)[self.menu setObject:breakfastMenu forKey:kVONBreakfastKey];
    if (lunchMenu)[self.menu setObject:lunchMenu forKey:kVONLunchKey];
    if (dinnerMenu)[self.menu setObject:dinnerMenu forKey:kVONDinnerKey];
    
}


-(void)getWednesdayMenu:(NSString *)dinerURL{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *breakfastMenu = [doc searchWithXPathQuery:@"//td[@id='wednesday']/table[@class='dayinner']/tr[@class='brk']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *lunchMenu = [doc searchWithXPathQuery:@"//td[@id='wednesday']/table[@class='dayinner']/tr[@class='lun']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *dinnerMenu = [doc searchWithXPathQuery:@"//td[@id='wednesday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    
    if (breakfastMenu)[self.menu setObject:breakfastMenu forKey:kVONBreakfastKey];
    if (lunchMenu)[self.menu setObject:lunchMenu forKey:kVONLunchKey];
    if (dinnerMenu)[self.menu setObject:dinnerMenu forKey:kVONDinnerKey];
}


-(void)getThursdayMenu:(NSString *)dinerURL
{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *breakfastMenu = [doc searchWithXPathQuery:@"//td[@id='thursday']/table[@class='dayinner']/tr[@class='brk']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *lunchMenu = [doc searchWithXPathQuery:@"//td[@id='thursday']/table[@class='dayinner']/tr[@class='lun']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *dinnerMenu = [doc searchWithXPathQuery:@"//td[@id='thursday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    
    if (breakfastMenu)[self.menu setObject:breakfastMenu forKey:kVONBreakfastKey];
    if (lunchMenu)[self.menu setObject:lunchMenu forKey:kVONLunchKey];
    if (dinnerMenu)[self.menu setObject:dinnerMenu forKey:kVONDinnerKey];
    
}

-(void)getFridayMenu:(NSString *)dinerURL
{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *breakfastMenu = [doc searchWithXPathQuery:@"//td[@id='friday']/table[@class='dayinner']/tr[@class='brk']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *lunchMenu = [doc searchWithXPathQuery:@"//td[@id='friday']/table[@class='dayinner']/tr[@class='lun']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *dinnerMenu = [doc searchWithXPathQuery:@"//td[@id='friday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    
    if (breakfastMenu)[self.menu setObject:breakfastMenu forKey:kVONBreakfastKey];
    if (lunchMenu)[self.menu setObject:lunchMenu forKey:kVONLunchKey];
    if (dinnerMenu)[self.menu setObject:dinnerMenu forKey:kVONDinnerKey];
    
}


-(void)getSaturdayMenu:(NSString *)dinerURL
{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *breakfastMenu = [doc searchWithXPathQuery:@"//td[@id='saturday']/table[@class='dayinner']/tr[@class='brk']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *lunchMenu = [doc searchWithXPathQuery:@"//td[@id='saturday']/table[@class='dayinner']/tr[@class='lun']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *dinnerMenu = [doc searchWithXPathQuery:@"//td[@id='saturday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    
    if (breakfastMenu)[self.menu setObject:breakfastMenu forKey:kVONBreakfastKey];
    if (lunchMenu)[self.menu setObject:lunchMenu forKey:kVONLunchKey];
    if (dinnerMenu)[self.menu setObject:dinnerMenu forKey:kVONDinnerKey];
}


-(void)getSundayMenu:(NSString *)dinerURL{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *breakfastMenu = [doc searchWithXPathQuery:@"//td[@id='sunday']/table[@class='dayinner']/tr[@class='brk']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *lunchMenu = [doc searchWithXPathQuery:@"//td[@id='sunday']/table[@class='dayinner']/tr[@class='lun']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    NSArray *dinnerMenu = [doc searchWithXPathQuery:@"//td[@id='sunday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    
    if (breakfastMenu)[self.menu setObject:breakfastMenu forKey:kVONBreakfastKey];
    if (lunchMenu)[self.menu setObject:lunchMenu forKey:kVONLunchKey];
    if (dinnerMenu)[self.menu setObject:dinnerMenu forKey:kVONDinnerKey];
}

@end
