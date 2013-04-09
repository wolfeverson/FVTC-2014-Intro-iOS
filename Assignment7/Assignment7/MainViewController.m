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
    
    
    /*
    GameViewController *Game = [[GameViewController alloc] init];
    NSString *gamedatatest = @"11,6,9,15,13,24,26,27,16,28,44,38,43,31,45,54,48,50,59,52,69,74,71,75,68";
    [Game BuildGameData:gamedatatest];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Game];
    [self presentViewController:nav animated:YES completion:Nil];
     */
    
    //This will be moved to game data controller.   Need an intermediate detail screen between table and game.  
    
    
    
}









@end
