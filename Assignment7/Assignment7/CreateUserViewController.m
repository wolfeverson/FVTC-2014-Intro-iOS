//
//  CreateUserViewController.m
//  Assignment7
//
//  Created by student on 4/18/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "CreateUserViewController.h"

@interface CreateUserViewController ()

@end

@implementation CreateUserViewController

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
    [self postDataWithUrl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 *
 *
 *
 *
 One time run file to create user.  Then user will be static in games.
 *
 *
 *
 *
 */

-(NSString *)getCurrentDateUTC
{
    float fseconds = [[NSDate date] timeIntervalSince1970];
    //fseconds = fseconds/100;
    //fseconds = roundf(fseconds);
    int iseconds = (int) floor(fseconds);
    NSString *t =  [NSString stringWithFormat:@"%i", iseconds];
    return t;
}



-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpdata options:kNilOptions error:Nil];
    if ([[json objectForKey:@"status"] isEqualToString:@"ok"])
    {
        NSLog(@"%@",json);
    }
}

-(void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpdata appendData:data];
}
-(void) postDataWithUrl
{
    _httpdata = [[NSMutableData alloc]init];
    NSURL *url = [NSURL URLWithString:@"http://bingo.humboldttechgroup.com:1111/?cmd=createuser"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSMutableString *postbody = [[NSMutableString alloc] init];
    [postbody appendFormat:@"{\"timestamp\":\"%@\", \"login\":\"Kitten\"}", [self getCurrentDateUTC]];
    NSData *postData = [postbody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

@end
