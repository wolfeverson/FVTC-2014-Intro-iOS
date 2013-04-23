//
//  LoginViewcontroller.m
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "LoginViewcontroller.h"
#import "CreateAccountViewController.h"

@interface LoginViewcontroller ()

@end

@implementation LoginViewcontroller

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

- (IBAction)ButtonCreateAccountClicked:(id)sender
{
    CreateAccountViewController *cre = [[CreateAccountViewController alloc] init];
    [[self navigationController] pushViewController:cre animated:YES];
}

- (IBAction)ButtonLoginClicked:(id)sender
{
    /*
     json webservice check login
     */
}
@end
