//
//  Assignment3ViewController.h
//  Assignment3
//
//  Created by student on 1/28/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Assignment3ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *oneField;
@property (weak, nonatomic) IBOutlet UITextField *twoField;
@property (weak, nonatomic) IBOutlet UITextField *threeField;
@property (weak, nonatomic) IBOutlet UITextField *fourField;
@property (weak, nonatomic) IBOutlet UITextField *fiveField;


- (IBAction)submitButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *finalAverageLabel;

@end
