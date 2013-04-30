//
//  MainViewController.h
//  CoreDataTest
//
//  Created by student on 4/29/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    NSManagedObjectContext *_ManagedObjectContext;
}
-(NSManagedObjectContext *) ManagedObjectContext;
-(void) SetManagedObjectContect:(NSManagedObjectContext *) context;
@end
