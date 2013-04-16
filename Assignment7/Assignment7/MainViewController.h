//
//  MainViewController.h
//  Assignment7
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainViewController : UITableViewController
{
    NSMutableArray *_GameCount;
    NSURLConnection *_connection;
    NSMutableData *_httpdata;
    NSArray *_Games;
}



@end
