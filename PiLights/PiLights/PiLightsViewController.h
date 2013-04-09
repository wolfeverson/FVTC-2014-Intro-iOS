//
//  PiLightsViewController.h
//  PiLights
//
//  Created by student on 4/1/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PiLightsViewController : UIViewController
{
    NSURLConnection *_connection;
    NSMutableData *_httpdata;
    CAShapeLayer *_CircleLayer;
}



- (IBAction)ButtonOnClick:(id)sender;
- (IBAction)ButtonOffClick:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *UISwitchOutlet;
- (IBAction)UISwitchChanged:(id)sender;
-(NSString *)getCurrentDateUTC;
- (IBAction)ButtonAllOnClicked:(id)sender;
- (IBAction)ButtonAllOffClicked:(id)sender;

@end
