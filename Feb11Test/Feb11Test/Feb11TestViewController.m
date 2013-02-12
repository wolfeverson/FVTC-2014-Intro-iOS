//
//  Feb11TestViewController.m
//  Feb11Test
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "Feb11TestViewController.h"

@interface Feb11TestViewController ()

@end








@implementation Feb11TestViewController



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

- (void) tick:(NSTimer *) timer
{
    counter ++;
    //if (counter == 11)
    //{
    //    counter = 0;
    //}
    [pickerView selectRow:counter%10 inComponent:2 animated:YES];
    [pickerView selectRow:(counter/10)%10 inComponent:1 animated:YES];
    [pickerView selectRow:(counter/100)%10 inComponent:0 animated:YES];
}

-(void) startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:.1
                                     target:self
                                   selector:@selector(tick:)
                                   userInfo:nil
                                    repeats:YES];
    
}

- (IBAction)AddButtonClick:(id)sender
{
    [self startTimer];
}
@end
