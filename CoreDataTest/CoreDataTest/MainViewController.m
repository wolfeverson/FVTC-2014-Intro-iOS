//
//  MainViewController.m
//  CoreDataTest
//
//  Created by student on 4/29/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext *) ManagedObjectContext
{
    return _ManagedObjectContext;
}
-(void) SetManagedObjectContect:(NSManagedObjectContext *) context
{
    _ManagedObjectContext = context;
}

@end
