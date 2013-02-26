//
//  MainViewController.m
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import "MainViewController.h"
#import "NewAlbumViewController.h"
#import "AlbumItem.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize AlbumPicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"InitWithNibName MainViewcontroller");
        _AlbumItems = [[NSMutableArray alloc] init];

    }
    return self;
}

-(void) viewDidAppear:(BOOL)animated
{
    //This view has become visible
    [AlbumPicker reloadAllComponents];
    NSLog(@"%@", _AlbumItems);
    
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

- (IBAction)DeleteButtonClick:(id)sender
{
    if ([_AlbumItems count] > 0)
        {
    int selectedIndex = [AlbumPicker selectedRowInComponent:0];
    [_AlbumItems removeObjectAtIndex:selectedIndex];
    [AlbumPicker reloadAllComponents];
        }
}

- (IBAction)AddButtonClick:(id)sender
{
    
    NewAlbumViewController *navc = [[NewAlbumViewController alloc] init];
    
    
    [navc SetAlbumItems:_AlbumItems];
    UINavigationController *NavController = [[UINavigationController alloc] initWithRootViewController:navc];
    [self presentViewController:NavController animated:YES completion:Nil];
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return  [_AlbumItems count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //return [_AlbumItems objectAtIndex:row];
    AlbumItem *tempalbum = [_AlbumItems objectAtIndex:row];
    return [tempalbum Title];
    
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //do this on pickerview index select
}





@end
