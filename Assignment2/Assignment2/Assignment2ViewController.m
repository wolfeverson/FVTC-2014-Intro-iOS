//
//  Assignment2ViewController.m
//  Assignment2
//
//  Created by student on 1/21/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "Assignment2ViewController.h"

@interface Assignment2ViewController ()

@end

@implementation Assignment2ViewController
@synthesize sliderQuantityLabel, submitButton, sliderValue;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [submitButton setEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstNameExit:(id)sender {
}

- (IBAction)lastNameExit:(id)sender {
    
}

- (IBAction)sliderValueChanged:(id)sender {
    float sliderValueFloat = [sliderValue value];
    int sliderValueInt = (int)sliderValueFloat;
    NSString *sliderValueString = [[NSString alloc] initWithFormat:@"%i", sliderValueInt ];
    [sliderQuantityLabel setText:sliderValueString];
}

- (IBAction)readySubmitChanged:(id)sender {
    [submitButton setEnabled:YES];
}

- (IBAction)submitButtonClicked:(id)sender {
    NSLog(@"Submit Button be clicked");
    UIAlertView *message = [[UIAlertView alloc]
                                        initWithTitle:@"Submission"
                                        message:@"Yay!"
                                        delegate:nil
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
    [message show];
}
@end
