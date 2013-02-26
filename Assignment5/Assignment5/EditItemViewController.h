//
//  EditItemViewController.h
//  Assignment5
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharpItem.h"

@interface EditItemViewController : UIViewController
{
    NSMutableArray *_SharpItems;
    SharpItem *CurrentSharp;
    int    CurrentIndex;
}
@property (weak, nonatomic) IBOutlet UITextField *ItemField;
@property (weak, nonatomic) IBOutlet UITextField *OwnerField;
@property (weak, nonatomic) IBOutlet UITextField *QualityField;
- (IBAction)CancelButtonClick:(id)sender;
- (IBAction)SaveButtonClick:(id)sender;
- (void) SetRowIndex: (int) Index;
- (void) SetSharpItems:  (NSMutableArray *) items;
- (NSMutableArray *) SharpItems;


@end
