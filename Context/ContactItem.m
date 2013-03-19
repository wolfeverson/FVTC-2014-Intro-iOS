//
//  ContactItem.m
//  Context
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "ContactItem.h"

@implementation ContactItem
@synthesize FirstName,LastName;

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:FirstName forKey: @"FirstName"];
    [aCoder encodeObject:LastName forKey: @"LastName"];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        [self setFirstName:[aDecoder decodeObjectForKey:@"FirstName"]];
        [self setLastName:[aDecoder decodeObjectForKey:@"LastName"]];
    }
    return self;
}



-(id) initWithFirstName:(NSString *)FName withLastName: (NSString *) LName
{
    self = [super init];
    if (self)
    {
        [self setFirstName:FName];
        [self setLastName:LName];
    }
    
    return self;
}

-(NSString *) description
{
    NSString *display = [[NSString alloc]initWithFormat:@"%@, %@",LastName, FirstName];
    return display;
}


+(ContactItem *) RandomContact
{
    NSArray *FirstNames = [[NSArray alloc] initWithObjects:@"Joe",@"Jim",@"Jared",@"Jack",@"Jess",@"Jer", nil];
    NSArray *LastNames = [[NSArray alloc] initWithObjects:@"Merk",@"Mim",@"Myrr",@"Min",@"Mufas",@"Mip", nil];
    int firstnameindex = arc4random() % [FirstNames count];
    int lastnameindex = arc4random() % [LastNames count];
    ContactItem *TempItem = [[ContactItem alloc] initWithFirstName:[FirstNames objectAtIndex:firstnameindex] withLastName:[LastNames objectAtIndex:lastnameindex]];
    return TempItem;
}



@end
