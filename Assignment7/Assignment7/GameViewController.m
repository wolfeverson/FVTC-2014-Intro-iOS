//
//  GameViewController.m
//  Assignment7
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "GameViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        [self getScreenDimensions];
    }
    return self;
}

//This is called from outside the form to pass in the datas.  
-(void) BuildGameData: (NSString *) ArrayString
{
    _GameString = ArrayString;
    _GameArray = [_GameString componentsSeparatedByString:@","];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getScreenDimensions];
    // Do any additional setup after loading the view from its nib.
}

//Gets Dimensions of screen to make ratios?
-(void) getScreenDimensions
{
    _width = self.view.frame.size.width;
    _height = self.view.frame.size.height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
