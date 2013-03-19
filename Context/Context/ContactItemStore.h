//
//  ContactItemStore.h
//  Context
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactItem.h"

@interface ContactItemStore : NSObject
{
    NSMutableArray *_AllItems;
}

-(NSMutableArray *) AllItems;
-(void) Add:(ContactItem *) Item;

+(ContactItemStore *) SharedStore;

-(void)Save;
-(void)Load;


@end
