//
//  CreateAccountViewController.h
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAccountViewController : UIViewController
{
    NSURLConnection *_connection;
    NSMutableData *_httpdata;
    NSString *_UserID;
    NSString *_UserPass;
    NSString *_First;
    NSString *_Last;
    NSString *_Email;
    NSString *_Phone;
    NSString *_Address;
    NSString *_City;
    NSString *_State;
    NSString *_Zip;
}
@property (weak, nonatomic) IBOutlet UITextField *FirstNameField;
@property (weak, nonatomic) IBOutlet UITextField *LastNameField;
@property (weak, nonatomic) IBOutlet UITextField *EmailField;
@property (weak, nonatomic) IBOutlet UITextField *PhoneField;
@property (weak, nonatomic) IBOutlet UITextField *AddressField;
@property (weak, nonatomic) IBOutlet UITextField *CityField;
@property (weak, nonatomic) IBOutlet UITextField *StateField;
@property (weak, nonatomic) IBOutlet UITextField *ZipField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordVerField;
- (IBAction)CreateAccountButtonClicked:(id)sender;

@end