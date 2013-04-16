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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [gameIDLabel setText:[_GameData game_id]];
     [GameCreatedLabel setText:[_GameData created_date]];
    [GameMaxPlayersLabel setText:[_GameData user_limit]];
     [GameWinCountLabel setText:[_GameData win_count]];
     [GameWinLimitLabel setText:[_GameData win_limit]];
     int spotsleft = (int)[_GameData user_limit] - (int)[_GameData user_count];
    [GameSpotsLeftLabel setText:[NSString stringWithFormat:@"%i", spotsleft]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) SetBingoGame:(BingoGame*) game
{
    _GameData = game;
}

- (IBAction)ButtonJoinGameClicked:(id)sender

{
    //Must call "Join game" function to get game board.
     GameViewController *Game = [[GameViewController alloc] init];
     NSString *gamedatatest = @"11,6,9,15,13,24,26,27,16,28,44,38,43,31,45,54,48,50,59,52,69,74,71,75,68";
     [Game BuildGameData:gamedatatest];
     UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Game];
     [self presentViewController:nav animated:YES completion:Nil];
    
    
}
@end
