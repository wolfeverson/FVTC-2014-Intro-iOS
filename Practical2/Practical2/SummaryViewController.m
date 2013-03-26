//
//  SummaryViewController.m
//  Practical2
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "SummaryViewController.h"
#import "FoodItem.h"
#import "FoodItemStore.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController
@synthesize FoodSummaryField,FoodTitleField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)SetRowIndex:(int)index
{
    _CurrentIndex = index;
}
//updates labels on load.
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CurrentFood = [[[FoodItemStore SharedStore]AllFood]objectAtIndex:_CurrentIndex];
    [FoodSummaryField setText:[CurrentFood FoodSummary]];
    [FoodTitleField setText:[CurrentFood FoodName]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//on order, runs NSLog.
- (IBAction)ButtonOrderClicked:(id)sender
{
    NSLog(@"One %@, coming right up!", CurrentFood);
    [FoodSummaryField setText:@"Order Recieved.  Thank you for your Patronage"];
}
//returns to menu.
- (IBAction)ButtonReturnClicked:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
}
//removes from menu. returns to menu.
- (IBAction)ButtonHideClicked:(id)sender
{
    [[[FoodItemStore SharedStore]AllFood]removeObjectAtIndex:_CurrentIndex];
    NSLog(@"Item %@ removed.", CurrentFood);
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
}




@end
