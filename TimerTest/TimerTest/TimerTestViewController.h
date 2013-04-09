//
//  TimerTestViewController.h
//  TimerTest
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerTestViewController : UIViewController
{
    NSTimer *_Timer;
    NSInteger _Counter;
}
@property (weak, nonatomic) IBOutlet UILabel *TimerLabel;

@end
