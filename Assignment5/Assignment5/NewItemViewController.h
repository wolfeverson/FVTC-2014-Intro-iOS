//
//  NewItemViewController.h
//  Assignment5
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewItemViewController : UIViewController
{
    NSMutableArray *_SharpItems;
}
@property (weak, nonatomic) IBOutlet UITextField *ItemField;
@property (weak, nonatomic) IBOutlet UITextField *OwnerField;
@property (weak, nonatomic) IBOutlet UITextField *QualityField;
- (IBAction)SaveButtonClick:(id)sender;
- (IBAction)CancelButtonClick:(id)sender;


- (void) SetSharpItems:  (NSMutableArray *) items;
- (NSMutableArray *) SharpItems;




@end
