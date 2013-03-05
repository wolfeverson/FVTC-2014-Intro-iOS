//
//  DetailViewController.h
//  IceCreamShoppe
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSMutableArray *_IceCreamFlavors;
    NSInteger _SelectedIndex;
}
-(void)setSelectedIndex:(NSInteger) index;
-(void)setIceCreamFlavors:(NSMutableArray *) Array;
- (IBAction)SaveButtonClicked:(id)sender;
- (IBAction)CancelButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *FlavorField;

@end
