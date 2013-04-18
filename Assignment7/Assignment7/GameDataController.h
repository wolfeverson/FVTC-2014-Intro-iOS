//
//  GameDataController.h
//  Assignment7
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BingoGame.h"

@interface GameDataController : UIViewController
{
    BingoGame *_GameData;
    NSURLConnection *_connection;
    NSMutableData *_httpdata;
    NSString *_GameBoard;
}
- (IBAction)ButtonJoinGameClicked:(id)sender;
- (void) SetBingoGame:(BingoGame*) game;
@property (weak, nonatomic) IBOutlet UILabel *gameIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameCreatedLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameWinCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameWinLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameMaxPlayersLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameSpotsLeftLabel;

@end
