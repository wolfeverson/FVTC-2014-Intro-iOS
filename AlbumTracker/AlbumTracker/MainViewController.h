//
//  MainViewController.h
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray  *_AlbumItems;
}



- (IBAction)DeleteButtonClick:(id)sender;

- (IBAction)AddButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *AlbumPicker;



@end
