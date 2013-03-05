//
//  TableView.m
//  Assignment5
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import "TableView.h"
#import "EditItemViewController.h"
#import "NewItemViewController.h"
#import "SharpItem.h"

@implementation TableView

//headervier allows buttons ontop of table view
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
-(id) init
{
    self = [super init];
    if (self)
    {
        //sets selected index to 'unselect' value.
        //Also, dummy datas.
        _SelectedIndex = -1;
        _SharpItems = [[NSMutableArray alloc] init];
        SharpItem *temp = [[SharpItem alloc] init];
        [temp setItem:@"Kitteh"];
        [temp setOwner:@"Jorge"];
        [temp setQuality:@"Great!"];
        [_SharpItems addObject:temp];
        SharpItem *temp2 = [[SharpItem alloc] init];
        [temp2 setItem:@"Kitteh2"];
        [temp2 setOwner:@"Jorge"];
        [temp2 setQuality:@"Great!"];
        [_SharpItems addObject:temp2];
        
    }
    return self;
}
//loads every time view appears.  (refreshes table view)
-(void)viewDidAppear:(BOOL)animated
{
        UITableView *View = (UITableView *)[self view];
    [View reloadData];
    _SelectedIndex = -1;
}
//sets specific area for headerview to avoid cramping.
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [[self HeaderView] bounds].size.height;
}
//adds new item
-(IBAction)AddButtonClicked:(id)sender
{
    NewItemViewController *New = [[NewItemViewController alloc]init];
    [New SetSharpItems:_SharpItems];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:New];
    [self presentViewController:nav animated:YES completion:Nil];

}
//if option selected, edits current
-(IBAction)EditButtonClicked:(id)sender
{
    if (_SelectedIndex != -1)
    {
    EditItemViewController *Edit = [[EditItemViewController alloc]init];
    [Edit SetSharpItems:_SharpItems];
    [Edit SetRowIndex:_SelectedIndex];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Edit];
    [self presentViewController:nav animated:YES completion:Nil];
    }
    
}
//returns number of rows in view
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_SharpItems count];
}
//populates table from database
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    SharpItem *CurrentSharp = [[SharpItem alloc]init];
    CurrentSharp = [_SharpItems objectAtIndex:[indexPath row]];
    NSString *tempString = [CurrentSharp Item];
    NSString *display = [[NSString alloc] initWithString:tempString];
    [[Cell textLabel]setText:display];
    return Cell;
}
//if option select, deletes current
-(IBAction)DeleteButtonClicked:(id)sender
{
    if (_SelectedIndex != -1)
    {
        [_SharpItems removeObjectAtIndex:_SelectedIndex];
        UITableView *View = (UITableView *)[self view];
        [View reloadData];
    }
}

//sets selectedindex from -1 to user choice.  
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _SelectedIndex = [indexPath row];
}


@end
