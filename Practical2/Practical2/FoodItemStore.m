//
//  FoodItemStore.m
//  Practical2
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "FoodItemStore.h"

@implementation FoodItemStore

-(NSMutableArray *) AllFood
{
    //NSLog(@"%i", [_AllFood count]);

    return _AllFood;
}
-(void) Add:(FoodItem *)Item
{
    [_AllFood addObject:Item];
}
//shared store is common module.
+(FoodItemStore *)SharedStore
{
    static FoodItemStore *SharedStore = nil;
    if (!SharedStore)
    {
        SharedStore = [[super allocWithZone:nil] init];
    }
    
    
   
    
    return SharedStore;
}

-(id) init
{
    self = [super init];
    if (self)
    {
        NSLog(@"In FoodItemStore Init");
        _AllFood = [[NSMutableArray alloc] init];
    }
    return self;
}
//archive path is filepath when saving.  >.>
-(NSString *)ItemArchivePath
{
    NSArray *DocumentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [DocumentDirectories objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"fooditemstore.archive"];
    //NSLog(@"Path:%@", path);
    return path;
}

-(void)Save
{
    NSString *path = [self ItemArchivePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:_AllFood toFile:path];
    if (success)
    {
        NSLog(@"Save:%@", _AllFood);
    }
    else
    {
        NSLog(@"Error Save");
    }
}
-(void)Load
{
    NSString *path = [self ItemArchivePath];
    _AllFood = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (_AllFood == nil)
    {
        _AllFood = [[NSMutableArray alloc] init];
        
    }
    
    NSLog(@"Load");
    
}




@end
