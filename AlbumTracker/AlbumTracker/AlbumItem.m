//
//  AlbumItem.m
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import "AlbumItem.h"

@implementation AlbumItem
@synthesize Artist, Title;

- (NSString *) description
{
    NSString *tempstring = [[NSString alloc]initWithFormat:@"Title %@",Title];
    return tempstring;
}

@end
