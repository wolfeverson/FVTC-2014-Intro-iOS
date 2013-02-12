//
//  Feb11TestViewController.h
//  Feb11Test
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Feb11TestViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

{
    int counter;
    NSArray *arrNumbers;
}
- (IBAction)AddButtonClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
