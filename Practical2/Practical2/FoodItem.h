//
//  FoodItem.h
//  Practical2
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodItem : NSObject <NSCoding>

@property (nonatomic, retain) NSString *FoodName;
@property (nonatomic, retain) NSString *FoodSummary;

-(id) initWithFoodName:(NSString *)FName withFoodSummary: (NSString *) FSummary;

@end
