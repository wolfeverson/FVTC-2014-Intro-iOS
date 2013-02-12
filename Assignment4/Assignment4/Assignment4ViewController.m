//
//  Assignment4ViewController.m
//  Assignment4
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "Assignment4ViewController.h"

@interface Assignment4ViewController ()

@end

@implementation Assignment4ViewController


@synthesize pickerView;

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //selected index change causes execution.
    
    NSLog(@"Row:%i  Component:%i",row, component);
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //will return the number of rows in picker view total.
    return [arrNumbers count];
    
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //returns number of dials in picker view.
    return 3;
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //text on each wheel slot
    int displayNumber = [[arrNumbers objectAtIndex:row]intValue];
    NSString *display = [NSString stringWithFormat:@"%i", displayNumber];
    return display;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arrNumbers = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:0],
                  [NSNumber numberWithInt:1],                                                [NSNumber numberWithInt:2],                                                [NSNumber numberWithInt:3],                                                [NSNumber numberWithInt:4],                                                [NSNumber numberWithInt:5],                                                [NSNumber numberWithInt:6],                                                [NSNumber numberWithInt:7],                                                [NSNumber numberWithInt:8],                                                [NSNumber numberWithInt:9],                                                nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tryButtonClicked:(id)sender
{
//get numbers and test against secret.
    int first = [pickerView selectedRowInComponent:0];
    int second = [pickerView selectedRowInComponent:1];
    int third = [pickerView selectedRowInComponent:2];
    int combined = (first*100)+(second*10)+third;
    if (combined != 451)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Key is Incorrect"
                                                        message:@"Try Again?"
                                                       delegate:self
                                              cancelButtonTitle:@"K"
                                              otherButtonTitles:nil];
        [alert show];
        //[alert release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Key is correct"
                                                        message:@"Word"
                                                       delegate:self
                                              cancelButtonTitle:@"K"
                                              otherButtonTitles:nil];
        [alert show];
        //[alert release];
    }

    
}

- (IBAction)autoButtonClicked:(id)sender
{
    //secret password is....  451.
    [pickerView selectRow:4 inComponent:0 animated:YES];
    [pickerView selectRow:5 inComponent:1 animated:YES];
    [pickerView selectRow:1 inComponent:2 animated:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cheater."
                                                    message:@"Key has been selected."
                                                   delegate:self
                                          cancelButtonTitle:@"K"
                                          otherButtonTitles:nil];
    [alert show];
    //[alert release];
    
    
}
@end
