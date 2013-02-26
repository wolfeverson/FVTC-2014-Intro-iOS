//
//  MainViewController.m
//  Assignment5
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import "MainViewController.h"
#import "NewItemViewController.h"
#import "EditItemViewController.h"
#import "SharpItem.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize PickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
               _SharpItems= [[NSMutableArray alloc] init];
        SharpItem *fakes = [[SharpItem alloc]init];
        [fakes setItem:@"Kitten"];
        [fakes setOwner:@"OwnerTest"];
        [fakes setQuality:@"QualTest"];
        [_SharpItems addObject:fakes];
        
        
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [PickerView reloadAllComponents];
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

- (IBAction)AddButtonClick:(id)sender
{
    
    NewItemViewController *nivc = [[NewItemViewController alloc] init];
    
    
    [nivc SetSharpItems:_SharpItems ];
    UINavigationController *NavController = [[UINavigationController alloc] initWithRootViewController:nivc];
    [self presentViewController:NavController animated:YES completion:Nil];
    
    
    
}

- (IBAction)EditButtonClick:(id)sender
{
    EditItemViewController *eivc = [[EditItemViewController alloc] init];

    [eivc SetSharpItems:_SharpItems];
    [eivc SetRowIndex:[PickerView selectedRowInComponent:0]];
    UINavigationController *NavController = [[UINavigationController alloc] initWithRootViewController:eivc];
    [self presentViewController:NavController animated:YES completion:Nil];
}

- (IBAction)DeleteButtonClick:(id)sender
{
    if ([_SharpItems count] > 0)
    {
        int selectedIndex = [PickerView selectedRowInComponent:0];
        [_SharpItems removeObjectAtIndex:selectedIndex];
        [PickerView reloadAllComponents];
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return  [_SharpItems count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    SharpItem *tempItem = [_SharpItems objectAtIndex:row];
    return [tempItem Item];
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //selected index change
}


@end
