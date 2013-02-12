//
//  Assignment4ViewController.h
//  Assignment4
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Assignment4ViewController : UIViewController
{
    NSArray *arrNumbers;
}
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)tryButtonClicked:(id)sender;
- (IBAction)autoButtonClicked:(id)sender;


@end
