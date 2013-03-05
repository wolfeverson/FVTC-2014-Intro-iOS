//
//  MainViewController.h
//  IceCreamShoppe
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainViewController : UITableViewController
{
    NSMutableArray *_IceCreamFlavors;
    IBOutlet UIView *_HeaderView;
    BOOL _DeleteMode;
}
-(UIView *) HeaderView;
-(IBAction)AddButtonClicked:(id)sender;
-(IBAction)DeleteButtonClicked:(id)sender;
@end
