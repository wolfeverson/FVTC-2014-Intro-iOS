//
//  EditItemViewController.m
//  Assignment5
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import "EditItemViewController.h"
#import "MainViewController.h"
#import "SharpItem.h"

@interface EditItemViewController ()

@end

@implementation EditItemViewController
@synthesize ItemField, OwnerField, QualityField;
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event//Leaves Keyboard event
{
    [ItemField resignFirstResponder];
    [OwnerField resignFirstResponder];
    [QualityField resignFirstResponder];
}
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
    //Sets Fields to edit. 
    [ItemField setText:[CurrentSharp Item]];
    [OwnerField setText:[CurrentSharp Owner]];
    [QualityField setText:[CurrentSharp Quality]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CancelButtonClick:(id)sender
{
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)SaveButtonClick:(id)sender 
{
    //Saves fields as slot reserved from the array.
    SharpItem *temp = [[SharpItem alloc] init];
    [temp setItem:[ItemField text]];
    [temp setOwner:[OwnerField text]];
    [temp setQuality:[QualityField text]];
    [_SharpItems setObject:temp atIndexedSubscript:CurrentIndex];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
}

- (void) SetSharpItems:  (NSMutableArray *) items
{
    _SharpItems = items;
}
-(void) SetRowIndex: (int) Index
{
    CurrentSharp = [_SharpItems objectAtIndex:Index];
    CurrentIndex = Index;
}
@end
