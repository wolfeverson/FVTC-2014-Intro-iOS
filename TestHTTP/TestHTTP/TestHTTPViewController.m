//
//  TestHTTPViewController.m
//  TestHTTP
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "TestHTTPViewController.h"

@interface TestHTTPViewController ()

@end

@implementation TestHTTPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void) connection(NSURLConnection *) conn didRecieveData:(NSData *)data
//{
//    [httpData appendData:data];
//}
//



//

-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSString *reponse = [[NSString alloc] initWithData:httpData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", reponse);
}

- (IBAction)TestButtonClicked:(id)sender
{
    httpData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://10.4.134.59/lights.php?=001"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
}
@end
