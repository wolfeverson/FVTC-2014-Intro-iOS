//
//  OptionsViewController.h
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsViewController : UIViewController
{
    NSURLConnection *_connection;
    NSMutableData *_httpdata;
}
- (IBAction)ButtonOrderPlaceClicked:(id)sender;
- (IBAction)ButtonUpdateAccountClicked:(id)sender;
- (IBAction)ButtonDeleteAccountClicked:(id)sender;
- (IBAction)ButtonLogOutClicked:(id)sender;

@end
