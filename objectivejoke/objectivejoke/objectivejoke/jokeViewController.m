//
//  jokeViewController.m
//  objectivejoke
//
//  Created by student on 1/21/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "jokeViewController.h"

@interface jokeViewController ()

@end

@implementation jokeViewController
@synthesize jokeLabel2;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [jokeLabel setText:@"Insert Objective Joke here that no one will get..."];
    //crazy double setting the same string.  *gasp*
    [jokeLabel2 setText:@"Test String 2.  Not funny."];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
