//
//  helloViewController.m
//  HelloWorld
//
//  Created by student on 1/14/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "helloViewController.h"

@interface helloViewController ()

@end

@implementation helloViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [messageLabel setText:@"Good Bai World"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
