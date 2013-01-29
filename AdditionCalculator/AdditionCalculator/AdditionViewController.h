//
//  AdditionViewController.h
//  AdditionCalculator
//
//  Created by student on 1/28/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdditionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UITextField *FirstNumberText;
@property (weak, nonatomic) IBOutlet UITextField *SecondNumberText;
@property (weak, nonatomic) IBOutlet UITextField *ThirdNumberText;
- (IBAction)AddButton:(id)sender;
-(int) getTotal:(int) firstNumber withSecondNumber:(int) secondNumber withThirdNumber:(int) thirdNumber;
-(int) getTwoTotal:(int) firstNumber :(int) SecondNumber;

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end
