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
        [self buildGrid];
        [self buildNumber];
    }
    return self;
}

//This is called from outside the form to pass in the datas.  
-(void) BuildGameData: (NSString *) ArrayString
{
    _GameString = ArrayString;
    _GameArray = [_GameString componentsSeparatedByString:@","];
}


/*
 
 DataGrid is (35,150) -> (285,400)
 5x5 Grid.  Each square is 50x50 pixels.
 
 */
-(void) buildNumber
{
    NSMutableArray *TextLayers =[[NSMutableArray alloc] initWithCapacity:25];
    int x = 35;
    int y = 150;
    for (int i = 0; i < 5; i++)
    {
        
    }
}




-(void) buildGrid
{
    //attempt to build array of layers and paths?
    NSMutableArray *ShapeLayers = [[NSMutableArray alloc] initWithCapacity:12];
    NSMutableArray *ShapePaths = [[NSMutableArray alloc] initWithCapacity:12];
    int x = 35;
    int y = 150;
    for (int i = 0; i < 12; i++)
    {
        if (i < 6)//horizontal
        {
            CAShapeLayer *TempShapeLayer = [CAShapeLayer layer];
            UIBezierPath *TempPath = [UIBezierPath bezierPath];
            [TempPath moveToPoint:CGPointMake(x, 150)];
            [TempPath addLineToPoint:CGPointMake(x, 400)];
            [TempPath closePath];
            [TempShapeLayer setPath:[TempPath CGPath]];
            [TempShapeLayer setLineWidth:3];
            [TempShapeLayer setStrokeColor:[UIColor blackColor].CGColor];
            [ShapePaths addObject:TempPath];
            [ShapeLayers addObject:TempShapeLayer];
            [[[self view] layer] addSublayer:ShapeLayers[i]];
            x = x + 50;
        }
        else//vertical
        {
            CAShapeLayer *TempShapeLayer = [CAShapeLayer layer];
            UIBezierPath *TempPath = [UIBezierPath bezierPath];
            [TempPath moveToPoint:CGPointMake(35, y)];
            [TempPath addLineToPoint:CGPointMake(285, y)];
            [TempPath closePath];
            [TempShapeLayer setPath:[TempPath CGPath]];
            [TempShapeLayer setLineWidth:3];
            [TempShapeLayer setStrokeColor:[UIColor blackColor].CGColor];
            [ShapePaths addObject:TempPath];
            [ShapeLayers addObject:TempShapeLayer];
            [[[self view] layer] addSublayer:ShapeLayers[i]];
            y= y + 50;
        }
    }
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

@end
