//
//  DetailViewController.m
//  IceCreamShoppe
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize FlavorField;

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

-(void)viewDidAppear:(BOOL)animated
{
    if (_SelectedIndex == -1)
    {
        //do nothing
    }
    else
    {
    [FlavorField setText:[_IceCreamFlavors objectAtIndex:_SelectedIndex]];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [FlavorField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveButtonClicked:(id)sender
{
    NSString *NewFlavor = [FlavorField text];
    if (!_SelectedIndex == -1)
    {
    [_IceCreamFlavors setObject:NewFlavor atIndexedSubscript:_SelectedIndex];
    }
    else
    {
        //add new flava
        [_IceCreamFlavors addObject:NewFlavor];
    }
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)CancelButtonClicked:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];    
}
-(void)setIceCreamFlavors:(NSMutableArray *) Array
{
    _IceCreamFlavors = Array;
}
-(void)setSelectedIndex:(NSInteger) index
{
    _SelectedIndex = index;
}
@end
