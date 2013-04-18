//
//  GameDataController.m
//  Assignment7
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "GameDataController.h"
#import "GameViewController.h"

@interface GameDataController ()

@end

@implementation GameDataController
@synthesize gameIDLabel,GameCreatedLabel,GameMaxPlayersLabel,GameSpotsLeftLabel,GameWinCountLabel,GameWinLimitLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//sets labels to bingogame value passed in from prior view
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [gameIDLabel setText:[_GameData game_id]];
     [GameCreatedLabel setText:[_GameData created_date]];
    [GameMaxPlayersLabel setText:[_GameData user_limit]];
     [GameWinCountLabel setText:[_GameData win_count]];
     [GameWinLimitLabel setText:[_GameData win_limit]];
    int usercount = [[_GameData user_count] intValue];
    int userlimit = [[_GameData user_limit] intValue];
    int spotsleft = userlimit - usercount;
    [GameSpotsLeftLabel setText:[NSString stringWithFormat:@"%i", spotsleft]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//gets value passed in from prior view.
- (void) SetBingoGame:(BingoGame*) game
{
    _GameData = game;
}

//gets board data.  joins game with user id. 
- (IBAction)ButtonJoinGameClicked:(id)sender

{
    NSString *url = @"http://bingo.humboldttechgroup.com:1111/?cmd=joingame";
    [self postDataWithUrl:url];
}

//sets board for next view.  loads next view.  
-(void) LoadGameBoard
{
    GameViewController *Game = [[GameViewController alloc] init];
    [Game BuildGameData:_GameBoard];
    NSString *gameids = [[NSString alloc] initWithFormat:@"%@", [_GameData game_id]];
    [Game SetGameId:gameids];
    [self.navigationController pushViewController:Game animated:YES];
}


//takes json array.  builds into _gamecount full of bingogame Class
-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpdata options:kNilOptions error:Nil];
    if ([[json objectForKey:@"status"] isEqualToString:@"ok"])
    {
        if ([[json objectForKey:@"message"] isEqualToString:@"game sucessfully joined"])
        {
            NSLog(@"JoinGame - OK - New Board");
        }
        else if ([[json objectForKey:@"message"] isEqualToString:@"user already joined game"])
        {
            NSLog(@"JoinGame - OK - Old Board");
        }
        _GameBoard = [json objectForKey:@"board"];
        [self LoadGameBoard];
    }
    else
    {
        NSLog(@"Server Error - JoinGame");
    }
}

//webserver boilerplate
-(void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpdata appendData:data];
}
//webserver boilerplate w/ json building
-(void) postDataWithUrl:(NSString *) urlString
{
    _httpdata = [[NSMutableData alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSMutableString *postbody = [[NSMutableString alloc] init];
    //build json out string
    NSString *timestamp = [self getCurrentDateUTC];
    NSString *gameid = [_GameData game_id];
    NSString *userid = @"1";   //This can be changed later.  Will not be dynamic.
    [postbody appendFormat:@"{\"timestamp\": \"%@\",", timestamp];
    [postbody appendFormat:@"\"game_id\": \"%@\",", gameid];
    [postbody appendFormat:@"\"user_id\":\"%@\"}", userid];
    //json build end.
    NSData *postData = [postbody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

//gets timestamp string. decimal dropped-nothing more.  
-(NSString *)getCurrentDateUTC
{
    float fseconds = [[NSDate date] timeIntervalSince1970];
    //fseconds = fseconds/100;
    //fseconds = roundf(fseconds);
    int iseconds = (int) floor(fseconds);
    NSString *t =  [NSString stringWithFormat:@"%i", iseconds];
    return t;
}


























@end
