//
//  bookORderViewController.m
//  bookOrder
//
//  Created by student on 1/21/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "bookORderViewController.h"

@interface bookORderViewController ()

@end

@implementation bookORderViewController
@synthesize physSwitch, digiSwitch, quantitySlider, quantityLabel, submitButton;

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

- (IBAction)submitButton:(id)sender
{
    NSLog(@"Submitted!");
}

- (IBAction)digiSwitchChanged:(id)sender
{
    if ([digiSwitch isOn])
    {
        NSLog(@"digiSwitch On");
        [physSwitch setOn:NO animated:YES];
    }
    else
    {
        NSLog(@"digiSwitch Off");
        [physSwitch setOn:YES animated:YES];
    }
}

- (IBAction)physSwitchChanged:(id)sender
{
    if ([physSwitch isOn])
    {
        NSLog(@"physSwitch On");
        [digiSwitch setOn:NO animated:YES];
    }
    else
    {
        NSLog(@"physSwitch Off");
        [digiSwitch setOn:YES animated:YES];
    }
}

- (IBAction)quantitySliderChanged:(id)sender
{
    
    float sliderValue = [quantitySlider value];
    int sliderInteger = (int) roundf(sliderValue);
    NSString *sliderString =  [[NSString alloc] initWithFormat:@"%i", sliderInteger];
    [quantityLabel setText:sliderString];
    NSLog(@"Slider Changed to %i", sliderInteger);
}

- (IBAction)nameFieldExit:(id)sender
{
    [submitButton setEnabled:YES];
}
@end
