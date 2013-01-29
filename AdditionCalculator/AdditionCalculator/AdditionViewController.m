//
//  AdditionViewController.m
//  AdditionCalculator
//
//  Created by student on 1/28/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "AdditionViewController.h"

@interface AdditionViewController ()

@end

@implementation AdditionViewController

@synthesize answerLabel, FirstNumberText, SecondNumberText, ThirdNumberText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddButton:(id)sender
{
//maths are hard
    int firstNumber = [[FirstNumberText text] intValue];
    int secondNumber = [[SecondNumberText text] intValue];
    int thirdNumber = [[ThirdNumberText text] intValue];
//ThisBeAFunctionCallTest.  Rawr.
    int answer = [self getTotal:firstNumber withSecondNumber:secondNumber withThirdNumber:thirdNumber];
    int answertwo = [self getTwoTotal:firstNumber :secondNumber];
//display
    NSString *answerString = [[NSString alloc] initWithFormat:@"%i", answertwo ];
    [answerLabel setText:answerString];
}

-(int) getTotal:(int) firstNumber withSecondNumber:(int) secondNumber withThirdNumber:(int) thirdNumber;
{
    int answer = firstNumber + secondNumber + thirdNumber;
    return answer;
    
}
-(int) getTwoTotal:(int) firstNumber :(int) SecondNumber
{
    int answer = firstNumber + SecondNumber;
    return answer;
 
    
    switch (answer) {
        case 0 ... 100:
            //do stuff
            break;
            
        default:
            break;
    }
}




- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [FirstNumberText resignFirstResponder];
    [SecondNumberText resignFirstResponder];
    [ThirdNumberText resignFirstResponder];
}


@end
