//
//  WizardViewController.m
//  NavigationDemo
//
//  Created by student on 4/15/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "WizardViewController.h"

@interface WizardViewController ()

@end

@implementation WizardViewController
@synthesize WizardLabel;

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
    [WizardLabel setText:[NSString stringWithFormat:@"%i", _WizardStep]];
}

-(void)SetWizardStep:(int) i
{
    _WizardStep = i;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)WizardButtonClicked:(id)sender
{
    WizardViewController  *wizard = [[WizardViewController alloc] init];
    [wizard SetWizardStep:_WizardStep+1];
    [self.navigationController pushViewController:wizard animated:YES];
    
}

- (IBAction)WizardButtonPreviousClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
