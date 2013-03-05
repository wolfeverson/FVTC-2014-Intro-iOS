//
//  MainViewController.m
//  IceCreamShoppe
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@implementation MainViewController

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self HeaderView];
}
-(UIView *) HeaderView
{
    if (!_HeaderView)
    {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:Nil];
        
    }
    return _HeaderView;
}
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [[self HeaderView] bounds].size.height;
}
-(IBAction)AddButtonClicked:(id)sender
{
    DetailViewController *detail = [[DetailViewController alloc]init];
    [detail setIceCreamFlavors:_IceCreamFlavors];
    [detail setSelectedIndex:-1];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detail];
    [self presentViewController:nav animated:YES completion:Nil];
}
-(IBAction)DeleteButtonClicked:(id)sender
{
    if (_DeleteMode)
    {
        _DeleteMode = NO;
    }
    else
    {
        _DeleteMode = YES;
    }
}



-(id) init
{
    self = [super init];
    //add customer initializations
    if (self)
    {
        //if properly initialized.  Init can act as boolean (Nil or valid)
        _IceCreamFlavors = [[NSMutableArray alloc] init];
        [_IceCreamFlavors addObject:@"Strawberreh"];
        [_IceCreamFlavors addObject:@"Razzleberreh"];
        [_IceCreamFlavors addObject:@"Neo"];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    UITableView *View = (UITableView *)[self view];
    [View reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_IceCreamFlavors count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    NSString *display = [[NSString alloc] initWithString:[_IceCreamFlavors objectAtIndex:[indexPath row]]];
    [[Cell textLabel]setText:display];
    return Cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //call detail view.
    if (!_DeleteMode)
    {
    DetailViewController *detail = [[DetailViewController alloc]init];
    [detail setIceCreamFlavors:_IceCreamFlavors];
    [detail setSelectedIndex:[indexPath row]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detail];
    [self presentViewController:nav animated:YES completion:Nil];
    }
    else
    {
        [_IceCreamFlavors removeObjectAtIndex:[indexPath row]];
        _DeleteMode = NO;
        UITableView *View = (UITableView *)[self view];
        [View reloadData];
        
    }
}











@end
