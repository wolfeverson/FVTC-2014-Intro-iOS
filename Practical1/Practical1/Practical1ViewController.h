//
//  Practical1ViewController.h
//  Practical1
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Practical1ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ArtistText;
@property (weak, nonatomic) IBOutlet UITextField *NameText;
@property (weak, nonatomic) IBOutlet UISlider *VolumeSlider;
- (IBAction)SubmitButtonClicked:(id)sender;

@end
