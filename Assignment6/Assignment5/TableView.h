//
//  TableView.h
//  Assignment5
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 WolfEverson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableView : UITableViewController
{
    NSMutableArray *_SharpItems;
    IBOutlet UIView *_HeaderView;
    NSInteger _SelectedIndex;
}
-(UIView *)HeaderView;
-(IBAction)AddButtonClicked:(id)sender;
-(IBAction)EditButtonClicked:(id)sender;
-(IBAction)DeleteButtonClicked:(id)sender;
@end
