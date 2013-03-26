//
//  FoodItem.m
//  Practical2
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem
@synthesize FoodName, FoodSummary;

//Coders enable saving/archiving of data.
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:FoodName forKey: @"FoodName"];
    [aCoder encodeObject:FoodSummary forKey: @"FoodSummary"];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        [self setFoodName:[aDecoder decodeObjectForKey:@"FoodName"]];
        [self setFoodSummary:[aDecoder decodeObjectForKey:@"FoodSummary"]];
    }
    return self;
}





-(id) initWithFoodName:(NSString *)FName withFoodSummary: (NSString *) FSummary;
{
    self = [super init];
    if (self)
    {
        [self setFoodName:FName];
        [self setFoodSummary:FSummary];
    }
    
    return self;
}

//description allows customization when calling item in nslog.
-(NSString *) description
{
    NSString *display = [[NSString alloc]initWithFormat:@"%@", FoodName];
    return display;
}









@end
