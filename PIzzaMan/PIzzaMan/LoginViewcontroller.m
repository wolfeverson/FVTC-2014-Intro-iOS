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
#import "OptionsViewController.h"

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
        LoginDataClass *obj=[LoginDataClass getInstance];
        obj.UserName = _UserID;
        obj.Password = _UserPass;
        obj.First = [json objectForKey:@"first"];
        obj.Last = [json objectForKey:@"last"];
        obj.Address = [json objectForKey:@"address"];
        obj.City = [json objectForKey:@"city"];
        obj.State = [json objectForKey:@"state"];
        obj.Zip = [json objectForKey:@"zip"];
        obj.Phone = [json objectForKey:@"phone"];
        obj.Email = [json objectForKey:@"email"];
        OptionsViewController *o = [[OptionsViewController alloc] init];
        [self.navigationController pushViewController:o animated:YES];
     }
    else
    {
        NSString *message = [json objectForKey:@"message"];
        NSLog(@"%@", message);
        if ([[json objectForKey:@"message"] isEqualToString:@"Login Data Invalid"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"Please Check your login data and try again." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"Server Error.  Please try again in a moment." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }

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
