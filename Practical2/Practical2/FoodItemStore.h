//
//  FoodItemStore.h
//  Practical2
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodItem.h"

@interface FoodItemStore : NSObject
{
    NSMutableArray *_AllFood;
}

-(NSMutableArray *) AllFood;
-(void) Add:(FoodItem *) Item;
+(FoodItemStore *) SharedStore;

-(void)Save;
-(void)Load;

@end
