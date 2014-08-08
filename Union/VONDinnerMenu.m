//
//  VONDinnerMenu.m
//  Union
//
//  Created by Duri Abdurahman Duri on 8/1/14.
//  Copyright (c) 2014 Duri. All rights reserved.
//

#import "VONDinnerMenu.h"
#import "TFHpple.h"
@implementation VONDinnerMenu

+(NSArray *)getMenu:(NSString *)dinerURL
{
    NSURL *menuURL = [NSURL URLWithString:dinerURL];
    NSData  * data      = [NSData dataWithContentsOfURL:menuURL];
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *menu = [doc searchWithXPathQuery:@"//td[@id='tuesday']/table[@class='dayinner']/tr[@class='din']/td[@class='menuitem']/div[@class='menuitem']/span[@class='ul']"];
    if (!menu)  return nil;
    else return menu;
    
}



@end
