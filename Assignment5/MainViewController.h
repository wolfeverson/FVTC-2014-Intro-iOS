//
//  MainViewController.h
//  Assignment5
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController  <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray  *_SharpItems;
}
@property (weak, nonatomic) IBOutlet UIPickerView *PickerView;
- (IBAction)AddButtonClick:(id)sender;
- (IBAction)EditButtonClick:(id)sender;
- (IBAction)DeleteButtonClick:(id)sender;




@end
