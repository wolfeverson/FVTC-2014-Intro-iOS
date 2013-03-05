//
//  NewItemViewController.m
//  Assignment5
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import "NewItemViewController.h"
#import "MainViewController.h"
#import "SharpItem.h"

@interface NewItemViewController ()

@end

@implementation NewItemViewController
@synthesize ItemField, OwnerField, QualityField;
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event//leaves keyboard event
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveButtonClick:(id)sender//adds new item to array
{
    SharpItem *temp = [[SharpItem alloc] init];
    [temp setItem:[ItemField text]];
    [temp setOwner:[OwnerField text]];
    [temp setQuality:[QualityField text]];
    [_SharpItems addObject:temp];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)CancelButtonClick:(id)sender
{
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
}



- (void) SetSharpItems:(NSMutableArray *)items
{
    _SharpItems = items;
}
- (NSMutableArray *) AlbumItems //this piece of code is uneeded.   It is there for completionist sake.  >.>
{
    return  _SharpItems;
}
@end
