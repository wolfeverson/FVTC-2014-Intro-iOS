//
//  Assignment3ViewController.m
//  Assignment3
//
//  Created by student on 1/28/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "Assignment3ViewController.h"

@interface Assignment3ViewController ()

@end

@implementation Assignment3ViewController

@synthesize oneField, twoField, threeField, fourField, fiveField, finalAverageLabel;

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

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [oneField resignFirstResponder];
    [twoField resignFirstResponder];
    [threeField resignFirstResponder];
    [fourField resignFirstResponder];
    [fiveField resignFirstResponder];
}


- (IBAction)submitButton:(id)sender
{
    float one = [[oneField text] floatValue];
    float two = [[twoField text] floatValue];
    float three = [[threeField text] floatValue];
    float four = [[fourField text] floatValue];
    float five = [[fiveField text] floatValue];
    //forces numbers to 0-100;
    one = [self NumberForcing:one];
    two = [self NumberForcing:two];
    three = [self NumberForcing:three];
    four = [self NumberForcing:four];
    five = [self NumberForcing:five];
    //...and resets the text fields to represent forced numbers.
    NSString *onestring = [NSString stringWithFormat:@"%2.2f", one ];
    NSString *twostring = [NSString stringWithFormat:@"%2.2f", two];
    NSString *threestring = [NSString stringWithFormat:@"%2.2f", three ];
    NSString *fourstring = [NSString stringWithFormat:@"%2.2f", four ];
    NSString *fivestring = [NSString stringWithFormat:@"%2.2f", five ];
    [oneField setText:onestring];
    [twoField setText:twostring];
    [threeField setText:threestring];
    [fourField setText:fourstring];
    [fiveField setText:fivestring];
    
    float average = [self maths:one:two:three:four:five];
    NSString *answerString;
    answerString = [self GradeResponse:average];

              [finalAverageLabel setText:answerString];  
}

-(NSString *)GradeResponse:(float)average;
{
    int averageInt = average * 100;
    NSString *answerString;
    switch (averageInt)
    {
        case 0 ... 99:
            answerString = [NSString stringWithFormat:@"With 0 hitpoints, your party is dead."];
            break;
        case 100 ... 1500:
            answerString = [NSString stringWithFormat:@"With %2.2f hitpoints average, your party is almost gone!", average];
            break;
        case 1501 ... 3000:
            answerString = [NSString stringWithFormat:@"With %2.2f hitpoints average, your party is wounded.", average];
            break;
        case 3001 ... 4500:
            answerString = [NSString stringWithFormat:@"With %2.2f hitpoints average, your party is injured.", average];
            break;
        case 4501 ... 6000:
            answerString = [NSString stringWithFormat:@"With %2.2f hitpoints average, your party is ok.", average];
            break;
        case 6001 ... 7500:
            answerString = [NSString stringWithFormat:@"With %2.2f hitpoints average, your party is fine.", average];
            break;
        case 7501 ... 9000:
            answerString = [NSString stringWithFormat:@"With %2.2f hitpoints average, your party is healthy!", average];
            break;
        case 9001 ... 9999:
            answerString = [NSString stringWithFormat:@"With %2.2f hitpoints average, your party is doing great!", average];
            break;
        case 10000:
            answerString = [NSString stringWithFormat:@"Are we cheating?  Perfect health is Perfect."];
            break;
            //deafault is not needed due to numberforcing function.
            //default:
            //break;
    }
    return answerString;
}






-(float)NumberForcing:(float)num;
{
    //function resets numbers outside of range to max values.
    if (num > 100)
    {
        num = 100;
    }
    else if ( num < 0)
    {
        num = 0;
    }
    return num;
}

//lazy function.  change this?
-(float)maths: (float) one: (float) two: (float) three: (float) four: (float) five;
{
    float total = one + two + three + four + five;
    float average = total/5;
    return average;
}






@end
