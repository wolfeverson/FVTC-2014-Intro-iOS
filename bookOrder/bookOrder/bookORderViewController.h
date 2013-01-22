//
//  bookORderViewController.h
//  bookOrder
//
//  Created by student on 1/21/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bookORderViewController : UIViewController
{

    
    
}
- (IBAction)submitButton:(id)sender;
- (IBAction)digiSwitchChanged:(id)sender;
- (IBAction)physSwitchChanged:(id)sender;
- (IBAction)quantitySliderChanged:(id)sender;
- (IBAction)nameFieldExit:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *physSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *digiSwitch;
@property (weak, nonatomic) IBOutlet UISlider *quantitySlider;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@end
