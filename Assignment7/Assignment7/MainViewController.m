//
//  MainViewController.m
//  Assignment7
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "MainViewController.h"
#import "GameViewController.h"
#import "GameDataController.h"

@implementation MainViewController 

-(id) init
{
    self = [super init];
    if (self)
    {
    }
    /*
     
     Get _GameCount from server w/ JSON.
     
     */

    return self;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    NSString *display = @"Game One";
    /*
     
     Build array from game Count
     
     */
    [[Cell textLabel]setText:display];
    return Cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GameDataController *Game = [[GameDataController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Game];
    [self presentViewController:nav animated:YES completion:Nil];
    

    
    
    
}









@end
