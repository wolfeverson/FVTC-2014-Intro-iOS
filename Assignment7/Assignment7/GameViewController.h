//
//  GameViewController.h
//  Assignment7
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
{
    NSArray *_GameArray;
    NSArray *_CirclesArray;
    NSArray *_ColArray;
    NSArray *_RowArray;
    NSString *_GameId;
    int _width;
    int _height;
    NSURLConnection *_connection;
    NSMutableData *_httpdata;
    NSTimer *_Timer;
}

@property (weak, nonatomic) IBOutlet UILabel *GameIdLabel;
-(void) BuildGameData: (NSString *) ArrayString;
-(void) SetGameId: (NSString *) g_id;
@property (weak, nonatomic) IBOutlet UILabel *GameNumberLabel;

@end
