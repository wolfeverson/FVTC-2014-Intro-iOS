//
//  MainViewController.m
//  Practical2
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "MainViewController.h"
#import "FoodItemStore.h"
#import "FoodItem.h"
#import "SummaryViewController.h"

@implementation MainViewController

-(id) init
{
    self = [super init];
    if (self)
    {
/*
 onetime call of food addition.  
 
 
 
        FoodItem *TempItem1 = [[FoodItem alloc] init];
        FoodItem *TempItem2 = [[FoodItem alloc] init];
        FoodItem *TempItem3 = [[FoodItem alloc] init];
        FoodItem *TempItem4 = [[FoodItem alloc] init];
        FoodItem *TempItem5 = [[FoodItem alloc] init];
        [TempItem1 setFoodName:@"Burger"];
        [TempItem1 setFoodSummary:@"Half pound o' Cow.  May still moo. "];
        [TempItem2 setFoodName:@"Steak"];
        [TempItem2 setFoodSummary:@"Full pound o' Cow.  Will definately moo."];
        [TempItem3 setFoodName:@"Lasagna"];
        [TempItem3 setFoodSummary:@"Some Italian Dish. "];
        [TempItem4 setFoodName:@"Bread"];
        [TempItem5 setFoodSummary:@"To go with burgers.  Of Course."];
        [TempItem5 setFoodName:@"Mystery Soup"];
        [TempItem5 setFoodSummary:@"Last week's Special. "];

        [[[FoodItemStore SharedStore] AllFood]addObject:TempItem1];
        NSLog(@"%@", TempItem1);

        [[[FoodItemStore SharedStore] AllFood]addObject:TempItem2];
        NSLog(@"%@", TempItem2);

        [[[FoodItemStore SharedStore] AllFood]addObject:TempItem3];
        [[[FoodItemStore SharedStore] AllFood]addObject:TempItem4];
        [[[FoodItemStore SharedStore] AllFood]addObject:TempItem5];
        NSInteger count = [[[FoodItemStore SharedStore]AllFood] count];
        NSLog(@"%@", [[FoodItemStore SharedStore] AllFood]);
*/

    }
    return self;
}

//resets view everytime view loads(in case of delete)
-(void)viewDidAppear:(BOOL)animated
{
    UITableView *view = (UITableView *)[self view];
    [view reloadData];
}

//required method.
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [[[FoodItemStore SharedStore]AllFood] count];
    //NSLog(@"%i", count);
    return count ;
}
//reqiuired method
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    FoodItem *TempItem = [[[FoodItemStore SharedStore] AllFood] objectAtIndex:[indexPath row]];
    NSString *display = [[NSString alloc]initWithFormat:@"%@",TempItem];
    [[Cell textLabel] setText:display];
    return Cell;
}
//onclick open summary view
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SummaryViewController *summ = [[SummaryViewController alloc] init];
    [summ SetRowIndex:[indexPath row]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:summ];
    [self presentViewController:nav animated:YES completion:Nil];
}













@end
