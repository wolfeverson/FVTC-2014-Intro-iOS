//
//  UpdateViewController.m
//  PIzzaMan
//
//  Created by student on 5/6/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "UpdateViewController.h"
#import "LoginDataClass.h"
#import "OptionsViewController.h"

@interface UpdateViewController ()
@end

@implementation UpdateViewController
@synthesize FirstNameField,LastNameField,EmailField,PhoneField,AddressField,CityField,StateField,ZipField,OldPasswordField,NewPasswordField;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [FirstNameField resignFirstResponder];
    [LastNameField resignFirstResponder];
    [EmailField resignFirstResponder];
    [PhoneField resignFirstResponder];
    [AddressField resignFirstResponder];
    [CityField resignFirstResponder];
    [StateField resignFirstResponder];
    [ZipField resignFirstResponder];
    [OldPasswordField resignFirstResponder];
    [NewPasswordField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    LoginDataClass *obj = [LoginDataClass getInstance];
    [FirstNameField setText:obj.First];
    [LastNameField setText:obj.Last];
    [AddressField setText:obj.Address];
    [CityField setText:obj.Address];
    [StateField setText:obj.State];
    [ZipField setText:obj.Zip];
    [PhoneField setText:obj.Phone];
    [EmailField setText:obj.Email];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonUpdateAccountClicked:(id)sender
{
    {
        BOOL isFormat = true;
        BOOL isRegex = true;
        BOOL isValid = true;
        NSString *first = [FirstNameField text];
        NSString *last = [LastNameField text];
        NSString *Phone = [PhoneField text];
        NSString *Email = [EmailField text];
        NSString *Address = [AddressField text];
        NSString *City = [CityField text];
        NSString *State = [StateField text];
        NSString *Zip = [ZipField text];
        NSString *OldPass = [OldPasswordField text];
        NSString *NewPass = [NewPasswordField text];
        
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
        //else if ([Phone isEqualToString: @""])
        else if (!testedphone)
        {
            isRegex = false;
            NSLog(@"phone fail");
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
        else if (State.length != 2)
        {
            isFormat = false;
        }
        else if (Zip.length != 5)
        {
            isFormat = false;
        }
        else if ([OldPass isEqualToString: @""])
        {
            isValid = false;
        }
        else if ([NewPass isEqualToString: @""])
        {
            isValid = false;
        }
        
        //check if input of oldpass = current pass
        LoginDataClass *obj = [LoginDataClass getInstance];
        NSString *testingpass = obj.Password;
        NSString *custid = [[NSString alloc] initWithFormat:@"%@", obj.UserName];
        
        if (!isValid)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Create Failed"
                                                           message: @"All fields must be filled"
                                                          delegate: self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"OK",nil];
            [alert show];
        }
        else if(![testingpass isEqualToString:OldPass])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Create Failed"
                                                            message:@"Password Does not Match"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
        }
        else if (!isFormat)//State is not checking for legit values.  Only legit lengths.
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Create Failed"
                                                           message: @"Ensure all fields are Valid.  Zip must be 5 digits and State 2 letter abbreviation."
                                                          delegate: self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"OK",nil];
            [alert show];
        }
        else if (!isRegex)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Create Failed"
                                                           message: @"Ensure all fields are Valid.  Phone must be '(999)999-9999', email in an 'email@email.com' format."
                                                          delegate: self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"OK",nil];
            [alert show];
        }
        else
        {
            //data "valid".  hit web service
            NSString *url = @"http://itweb.fvtc.edu/200102410/iOS/UpdateAccount.php";
            [self postDataWithUrl:url:custid :first :last :Phone :Email :Address :City :State :Zip :NewPass];
            _First = [FirstNameField text];
            _Last = [LastNameField text];
            _Email = [EmailField text];
            _Phone = [PhoneField text];
            _Address = [AddressField text];
            _City = [CityField text];
            _State = [StateField text];
        }
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
            NSLog(@"%@", json);
            LoginDataClass *obj=[LoginDataClass getInstance];
            obj.Password = _NewPass;
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
    -(void) postDataWithUrl:(NSString *) urlString:(NSString *)custid: (NSString *)first: (NSString *)last: (NSString *)phone: (NSString *)email: (NSString *)address: (NSString *)city: (NSString *)state: (NSString *)zip: (NSString *)password
    {
        _httpdata = [[NSMutableData alloc]init];
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        NSMutableString *postBody = [[NSMutableString alloc] init];
        [postBody appendFormat:@"{\"first\":\"%@\",\"id\":\"%@\", \"last\":\"%@\",\"phone\":\"%@\",\"email\":\"%@\",\"address\":\"%@\",\"city\":\"%@\",\"state\":\"%@\",\"zip\":\"%@\",\"password\":\"%@\", \"timestamp\":\"%@\"}", first, custid, last, phone, email, address, city, state, zip, password,[self getCurrentDateUTC]];
        NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:postData];
        _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    }

@end
    
    
