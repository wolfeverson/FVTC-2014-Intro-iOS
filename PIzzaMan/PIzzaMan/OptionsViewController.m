//
//  OptionsViewController.m
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "OptionsViewController.h"
#import "LoginDataClass.h"
#import "UpdateViewController.h"


@interface OptionsViewController ()

@end

@implementation OptionsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonOrderPlaceClicked:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Order has been Placed"
                                                   message: @"...the program does not extend this far"
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    [alert show];
}

- (IBAction)ButtonUpdateAccountClicked:(id)sender
{
    UpdateViewController *up = [[UpdateViewController alloc] init];
    [self.navigationController pushViewController:up animated:YES];
}

- (IBAction)ButtonDeleteAccountClicked:(id)sender
{
            NSString *url = @"http://itweb.fvtc.edu/200102410/iOS/DeleteAccount.php";
    LoginDataClass *obj = [LoginDataClass getInstance];
    NSString *uid = obj.UserName;
    [self postDataWithUrl:url:uid];
}

- (IBAction)ButtonLogOutClicked:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}





//takes json array.
-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSString *data = [[NSString alloc] initWithData:_httpdata encoding:NSASCIIStringEncoding];
    NSLog(@"%@", data);
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpdata options:kNilOptions error:Nil];
    if ([[json objectForKey:@"status"] isEqualToString:@"ok"])
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        NSString *message = [json objectForKey:@"message"];
        NSLog(@"%@", message);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete Failed" message:@"Server Error. Please contact Support" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

//gets timestamp string
-(NSString *)getCurrentDateUTC
{
    float fseconds = [[NSDate date] timeIntervalSince1970];
    fseconds = fseconds/100;
    fseconds = roundf(fseconds);
    int iseconds = (int) floor(fseconds);
    NSString *t =  [NSString stringWithFormat:@"%i", iseconds];
    return t;
}

//webserver boilerplate
-(void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpdata appendData:data];
}

//webserver boilerplate
-(void) postDataWithUrl:(NSString *) urlString: (NSString *)UID
{
    _httpdata = [[NSMutableData alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSMutableString *postBody = [[NSMutableString alloc] init];
    [postBody appendFormat:@"{\"id\":\"%@\",\"command\":\"delete\",\"timestamp\":\"%@\"}",UID,[self getCurrentDateUTC]];
    NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

@end
