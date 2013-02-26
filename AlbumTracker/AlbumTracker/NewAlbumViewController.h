//
//  NewAlbumViewController.h
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewAlbumViewController : UIViewController
{
    NSMutableArray *_AlbumItems;
}
- (IBAction)CancelButtonClick:(id)sender;
- (IBAction)AddButtonClick:(id)sender;
- (void) SetAlbumItems:  (NSMutableArray *) items;
- (NSMutableArray *) AlbumItems;
@property (weak, nonatomic) IBOutlet UITextField *AlbumTitleField;
@property (weak, nonatomic) IBOutlet UITextField *AlbumArtistField;



@end
