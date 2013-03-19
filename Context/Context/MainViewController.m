//
//  MainViewController.m
//  Context
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "MainViewController.h"
#import "ContactItemStore.h"
#import "ContactItem.h"

@implementation MainViewController

-(id) init
{
    self = [super init];
    if (self)
    {
        //[[[ContactItemStore SharedStore] AllItems] addObject:[ContactItem RandomContact]];
        
        UIBarButtonItem *AddButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(AddItem)];
        [[self navigationItem] setRightBarButtonItem:AddButton];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        
    }
    return self;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((editingStyle) == UITableViewCellEditingStyleDelete)
    {
        int index = [indexPath row];
        [[[ContactItemStore SharedStore] AllItems] removeObjectAtIndex:index];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewCellEditingStyleDelete];
    }
}

-(void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    int sourceindex = [sourceIndexPath row];
    int destinationindex = [destinationIndexPath row];
    ContactItem *TempItem = [[[ContactItemStore SharedStore] AllItems] objectAtIndex:sourceindex];
    [[[ContactItemStore SharedStore] AllItems]removeObjectAtIndex:sourceindex];
    [[[ContactItemStore SharedStore] AllItems] insertObject:TempItem atIndex:destinationindex];
}



-(void) AddItem
{
    [[[ContactItemStore SharedStore] AllItems] addObject:[ContactItem RandomContact]];
    UITableView *TableView = (UITableView *)[self view];
    [TableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ContactItemStore SharedStore]AllItems] count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    ContactItem *TempItem = [[[ContactItemStore SharedStore] AllItems] objectAtIndex:[indexPath row]];
   // NSString *display = [[NSString alloc] initwithformat:@"%@,%@"[TempItem LastName], [TempItem FirstName]]];
    NSString *display = [[NSString alloc]initWithFormat:@"%@",TempItem];
    [[Cell textLabel] setText:display];
    return Cell;
}



@end
