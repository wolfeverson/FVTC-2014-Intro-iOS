//
//  LoginViewcontroller.m
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "LoginViewcontroller.h"
#import "CreateAccountViewController.h"
#import "LoginDataClass.h"

@interface LoginViewcontroller ()

@end

@implementation LoginViewcontroller
@synthesize UserNameField,PasswordField;

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

- (IBAction)ButtonCreateAccountClicked:(id)sender
{
    CreateAccountViewController *cre = [[CreateAccountViewController alloc] init];
    [[self navigationController] pushViewController:cre animated:YES];
}

- (IBAction)ButtonLoginClicked:(id)sender
{
    /*
     json webservice check login
     */
    
    _UserID = [UserNameField text];
    _UserPass = [PasswordField text];
    NSString *URL = @"http://itweb.fvtc.edu/200102410/iOS/login.php";
    [self postDataWithUrl:URL:_UserID:_UserPass];
}

//resets typepad
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UserNameField resignFirstResponder];
    [PasswordField resignFirstResponder];
}

//takes json array.  
-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    //NSString *data = [[NSString alloc] initWithData:_httpdata encoding:NSASCIIStringEncoding];
    //NSLog(@"%@", data);
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpdata options:kNilOptions error:Nil];
    if ([[json objectForKey:@"status"] isEqualToString:@"ok"])
    {
        NSString *message = [json objectForKey:@"message"];
        NSLog(@"%@", message);
        LoginDataClass *obj=[LoginDataClass getInstance];
        obj.UserName = _UserID;
        obj.Password = _UserPass;
     }
    else
    {
        NSString *message = [json objectForKey:@"message"];
        NSLog(@"%@", message);
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
-(void) postDataWithUrl:(NSString *) urlString: (NSString *)UID:(NSString *)UPass
{
    _httpdata = [[NSMutableData alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSMutableString *postBody = [[NSMutableString alloc] init];
    [postBody appendFormat:@"{\"id\":\"%@\",\"password\":\"%@\",\"timestamp\":\"%@\"}",UID,UPass,[self getCurrentDateUTC]];
    NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}


@end
