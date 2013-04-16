//
//  ConfigViewController.m
//  NavigationDemo
//
//  Created by student on 4/15/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "ConfigViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ConfigViewController ()

@end

@implementation ConfigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        UITabBarItem *tab = [self tabBarItem];
        [tab setTitle:@"Config"];
        UIImage *i = [UIImage imageNamed:@"Fuurin (Glass Wind Chime).gif"];
        [tab setImage:i];
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:self.view];
    NSLog(@"x:%f , y:%f", p.x, p.y);
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 10, 10) cornerRadius:30];
    [layer setPath:path.CGPath];
    [layer setFillColor:[UIColor redColor].CGColor];
    [layer setPosition:p];
    CABasicAnimation *trans = [CABasicAnimation animationWithKeyPath:@"position"];
    [trans setFromValue:[NSValue valueWithCGPoint:p]];
    [trans setToValue:[NSValue valueWithCGPoint:CGPointMake(p.x+40, p.y)]];
    [trans setFillMode:@"Removed"];
    [layer addAnimation:trans forKey:@"basic"];
    [layer setPosition:CGPointMake(p.x+40, p.y)];
    [[[self view] layer] addSublayer:layer];
}

@end
