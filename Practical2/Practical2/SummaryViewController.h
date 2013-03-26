//
//  SummaryViewController.h
//  Practical2
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItem.h"

@interface SummaryViewController : UIViewController
{
    NSInteger _CurrentIndex;
    FoodItem  *CurrentFood;
}
- (IBAction)ButtonOrderClicked:(id)sender;
- (IBAction)ButtonReturnClicked:(id)sender;
- (IBAction)ButtonHideClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *FoodTitleField;
@property (weak, nonatomic) IBOutlet UILabel *FoodSummaryField;
-(void) SetRowIndex:(int)index;

@end
