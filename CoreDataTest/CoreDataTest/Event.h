//
//  Event.h
//  CoreDataTest
//
//  Created by student on 4/29/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSNumber * x;
@property (nonatomic, retain) NSNumber * y;
@property (nonatomic, retain) NSNumber * z;

@end
