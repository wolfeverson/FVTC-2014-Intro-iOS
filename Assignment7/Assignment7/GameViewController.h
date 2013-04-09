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
    int _width;
    int _height;
}

-(void) BuildGameData: (NSString *) ArrayString;

@end
