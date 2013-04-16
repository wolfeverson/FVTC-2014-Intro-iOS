//
//  WizardViewController.h
//  NavigationDemo
//
//  Created by student on 4/15/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WizardViewController : UIViewController
{
    int _WizardStep;
}
@property (weak, nonatomic) IBOutlet UILabel *WizardLabel;
- (IBAction)WizardButtonClicked:(id)sender;
- (IBAction)WizardButtonPreviousClicked:(id)sender;

-(void)SetWizardStep:(int) i;
@end
