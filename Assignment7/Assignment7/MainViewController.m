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
#import "BingoGame.h"

@implementation MainViewController 

-(id) init
{
    self = [super init];
    if (self)
    {
        _GameCount = [[NSMutableArray alloc] init];
        [self ServerGetAllGames];
    }
    return self;
}
-(void) viewDidAppear:(BOOL)animated
{

}
//url fetch to get games from server
-(void) ServerGetAllGames
{
    NSString *URLallGames = @"http://bingo.humboldttechgroup.com:1111/?cmd=allgames";
    [self postDataWithUrl:URLallGames];
}
//number of rows in tableview
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_GameCount count];
}

//fills tableview with game list up to gamecount;
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    NSString *display = [NSString stringWithFormat:@"Game %i", [indexPath row]];
    [[Cell textLabel]setText:display];
    return Cell;
}
//selects game.  passes to next field.  passes game data.
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GameDataController *Game = [[GameDataController alloc] init];
    BingoGame *game = [_GameCount objectAtIndex:[indexPath row]];
    [Game SetBingoGame:game];
    [self.navigationController pushViewController:Game animated:YES];
}

//takes json array.  builds into _gamecount full of bingogame Class
-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpdata options:kNilOptions error:Nil];
    if ([[json objectForKey:@"status"] isEqualToString:@"ok"])
    {
        NSLog(@"GetAllGames - OK");
        NSArray *games = [json objectForKey:@"games"];
        _Games = games;
        [_GameCount removeAllObjects];
        for (int i = 0; i < games.count; i++)
        {
            BingoGame *temp = [[BingoGame alloc] init];
            [temp setCreated_date:[games objectAtIndex:i][@"created_date"]];
            [temp setGame_id:[games objectAtIndex:i][@"game_id"]];
            [temp setWin_limit:[games objectAtIndex:i][@"win_limit"]];
            [temp setWin_count:[games objectAtIndex:i][@"win_count"]];
            [temp setUser_count:[games objectAtIndex:i][@"user_count"]];
            [temp setUser_limit:[games objectAtIndex:i][@"user_limit"]];
            [_GameCount addObject:temp];
        }
    UITableView *view = (UITableView *)[self view];
    [view reloadData];
    }
    else
    {
        NSLog(@"Server Error - GetAllGames");
    }
}

//webserver boilerplate
-(void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpdata appendData:data];
}
//webserver boilerplate
-(void) postDataWithUrl:(NSString *) urlString
{
    _httpdata = [[NSMutableData alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSString *postBody = @"";
    NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

@end
