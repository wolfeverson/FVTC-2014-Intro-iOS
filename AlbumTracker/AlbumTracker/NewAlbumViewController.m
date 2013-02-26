//
//  NewAlbumViewController.m
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import "NewAlbumViewController.h"
#import "AlbumItem.h"

@interface NewAlbumViewController ()

@end

@implementation NewAlbumViewController
@synthesize AlbumArtistField, AlbumTitleField;

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [AlbumArtistField resignFirstResponder];
    [AlbumTitleField resignFirstResponder];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CancelButtonClick:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
    
}
 
- (IBAction)AddButtonClick:(id)sender
{
    //[_AlbumItems addObject:[AlbumTitleField text]];
    AlbumItem *temp = [[AlbumItem alloc] init];
    [temp setTitle:[AlbumTitleField text]];
    [temp setArtist:[AlbumArtistField text]];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
}

- (void) SetAlbumItems:  (NSMutableArray *) items
{
    _AlbumItems = items;
}
- (NSMutableArray *) AlbumItems
{
    return  _AlbumItems;
}



@end
