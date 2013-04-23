//
//  LoginViewcontroller.h
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewcontroller : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *UserNameField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
- (IBAction)ButtonCreateAccountClicked:(id)sender;
- (IBAction)ButtonLoginClicked:(id)sender;

@end
