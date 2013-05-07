//
//  CreateAccountViewController.m
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "LoginDataClass.h"
#import "OptionsViewController.h"

@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController
@synthesize FirstNameField,LastNameField,AddressField,CityField,StateField,ZipField,PhoneField,EmailField,PasswordField,PasswordVerField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//resets typepad
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [FirstNameField resignFirstResponder];
    [LastNameField resignFirstResponder];
    [AddressField resignFirstResponder];
    [CityField resignFirstResponder];
    [StateField resignFirstResponder];
    [ZipField resignFirstResponder];
    [PhoneField resignFirstResponder];
    [EmailField resignFirstResponder];
    [PasswordField resignFirstResponder];
    [PasswordVerField resignFirstResponder];
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

- (IBAction)CreateAccountButtonClicked:(id)sender
{
    BOOL isValid = true;
    BOOL isPassworderror = false;
    BOOL isRegex = true;
    NSString *first = [FirstNameField text];
    NSString *last = [LastNameField text];
    NSString *Phone = [PhoneField text];
    NSString *Email = [EmailField text];
    NSString *Address = [AddressField text];
    NSString *City = [CityField text];
    NSString *State = [StateField text];
    NSString *Zip = [ZipField text];
    NSString *Password = [PasswordField text];
    NSString *PassVer = [PasswordVerField text];
    
    //phone regex
    NSString *phoneRegex = @"\\(?([0-9]{3})\\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL testedphone = [phoneTest evaluateWithObject:Phone];
    //email regex
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL testedemail = [emailTest evaluateWithObject:Email];
    
    

    if ([first isEqualToString: @""])   //THIS IS NOT ENOUGH VALIDATION FOR SERIOUS APP.
    {
        isValid = false;
    }
    else if ([last isEqualToString: @""])
    {
        isValid = false;
    }
    else if (!testedphone)
    {
        isRegex = false;
    }
    else if(!testedemail)
    {
        isRegex = false;
    }
    else if ([Address isEqualToString: @""])
    {
        isValid = false;
    }
    else if ([City isEqualToString: @""])
    {
        isValid = false;
    }
    else if ([State isEqualToString: @""])
    {
        isValid = false;
    }
    else if ([Zip isEqualToString: @""])
    {
        isValid = false;
    }
    else if ([Password isEqualToString: @""])
    {
        isValid = false;
    }
    else if (![Password isEqualToString: PassVer])
    {
        isValid = false;
        isPassworderror = true;
    }
    
    
    if (isPassworderror)
    {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Create Failed"
                                                   message: @"Passwords Do Not Match"
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    [alert show];
    }
    else if (!isValid)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Create Failed"
                                                       message: @"All fields must be filled"
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        [alert show];
    }
    else if (!isRegex)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Create Failed"
                                                       message: @"Ensure all fields are Valid"
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        [alert show];
    }
    else
    {
    //data "valid".  hit web service
        NSString *url = @"http://itweb.fvtc.edu/200102410/iOS/CreateAccount.php";
        [self postDataWithUrl:url :first :last :Phone :Email :Address :City :State :Zip :Password];
        _First = [FirstNameField text];
        _Last = [LastNameField text];
        _Email = [EmailField text];
        _Phone = [PhoneField text];
        _Address = [AddressField text];
        _City = [CityField text];
        _State = [StateField text];
    }
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
             _UserID = [json objectForKey:@"userid"];
             _UserPass = [json objectForKey:@"userpass"];
            LoginDataClass *obj=[LoginDataClass getInstance];
            obj.UserName = _UserID;
            obj.Password = _UserPass;
            obj.First = _First;
            obj.Last = _Last;
            obj.Email = _Email;
            obj.Phone = _Phone;
            obj.Address = _Address;
            obj.City = _City;
            obj.State = _State;
            obj.Zip = _Zip;
            OptionsViewController *o = [[OptionsViewController alloc] init];
            [self.navigationController pushViewController:o animated:YES];
            
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
    -(void) postDataWithUrl:(NSString *) urlString: (NSString *)first: (NSString *)last: (NSString *)phone: (NSString *)email: (NSString *)address: (NSString *)city: (NSString *)state: (NSString *)zip: (NSString *)password
    {
        _httpdata = [[NSMutableData alloc]init];
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        NSMutableString *postBody = [[NSMutableString alloc] init];
        [postBody appendFormat:@"{\"first\":\"%@\", \"last\":\"%@\",\"phone\":\"%@\",\"email\":\"%@\",\"address\":\"%@\",\"city\":\"%@\",\"state\":\"%@\",\"zip\":\"%@\",\"password\":\"%@\", \"timestamp\":\"%@\"}", first, last, phone, email, address, city, state, zip, password,[self getCurrentDateUTC]];
        NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:postData];
        _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    }
@end
