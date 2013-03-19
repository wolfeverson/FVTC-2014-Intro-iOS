//
//  ContactItemStore.m
//  Context
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "ContactItemStore.h"

@implementation ContactItemStore

-(NSMutableArray *) AllItems
{
    return _AllItems;
}
-(void) Add:(ContactItem *) Item
{
    [_AllItems addObject:Item];
}

+(ContactItemStore *) SharedStore
{
    //line acts like an if statement to only run once.
    static ContactItemStore *sharedStore = nil;
    //followed by an actual if statement that only runs once(when variable is nil)
    if (!sharedStore)
    {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

-(id) init
{
    self = [super init];
    if (self)
    {
        _AllItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)ItemArchivePath
{
    NSArray *DocumentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [DocumentDirectories objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"contactitemstore.archive"];
    NSLog(@"Path:%@", path);
    return path;
}

-(void)Save
{
    NSString *path = [self ItemArchivePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:_AllItems toFile:path];
    if (success)
    {
        NSLog(@"%@", _AllItems);
    }
    else
    {
        NSLog(@"Error Save");
    }
}
-(void)Load
{
    NSString *path = [self ItemArchivePath];
    _AllItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    
}

@end
