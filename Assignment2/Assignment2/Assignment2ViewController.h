//
//  Assignment2ViewController.h
//  Assignment2
//
//  Created by student on 1/21/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Assignment2ViewController : UIViewController


- (IBAction)firstNameExit:(id)sender;
- (IBAction)lastNameExit:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)readySubmitChanged:(id)sender;
- (IBAction)submitButtonClicked:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *sliderQuantityLabel;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UISlider *sliderValue;

@end
