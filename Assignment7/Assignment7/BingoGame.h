//
//  BingoGame.h
//  Assignment7
//
//  Created by student on 4/15/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BingoGame : NSObject
@property (nonatomic, retain) NSString *game_id;
@property (nonatomic, retain) NSString *win_limit;
@property (nonatomic, retain) NSString *win_count;
@property (nonatomic, retain) NSString *user_count;
@property (nonatomic, retain) NSString *user_limit;
@property (nonatomic, retain) NSString *created_date;

@end
