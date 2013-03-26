//
//  TestHTTPViewController.h
//  TestHTTP
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestHTTPViewController : UIViewController
{
    NSURLConnection *connection;
    NSMutableData *httpData;
    void (^completion) (void);
}
- (IBAction)TestButtonClicked:(id)sender;


@end
