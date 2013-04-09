//
//  TimerTestViewController.m
//  TimerTest
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "TimerTestViewController.h"

@interface TimerTestViewController ()

@end

@implementation TimerTestViewController
@synthesize TimerLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:Nil repeats:YES];
}

-(void) tick
{
    _Counter++;
    [TimerLabel setText:[NSString stringWithFormat:@"%i", _Counter]];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
