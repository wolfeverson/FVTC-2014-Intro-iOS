//
//  PiLightsViewController.m
//  PiLights
//
//  Created by student on 4/1/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "PiLightsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PiLightsViewController ()

@end
@implementation PiLightsViewController
@synthesize UISwitchOutlet;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CAShapeLayer *LineLayer = [CAShapeLayer  layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(300, 300)];
    [path closePath];
    
    [LineLayer setPath:[path CGPath]];
    [LineLayer setFillColor:[UIColor redColor].CGColor];
    [LineLayer setLineWidth:5];
    [LineLayer setStrokeColor:[UIColor blueColor].CGColor];
    [LineLayer setName:@"lineLayer"];
    
    [[[self view] layer] addSublayer:LineLayer];
    
    
    
    _CircleLayer = [CAShapeLayer layer];
    int radius = 50;
    UIBezierPath *CircleBezier = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100)cornerRadius:radius];
    [_CircleLayer setLineWidth:5];
    [_CircleLayer setStrokeColor:[UIColor greenColor].CGColor];
    [_CircleLayer setPath:[CircleBezier CGPath]];
    [_CircleLayer setName:@"circleLayer"];
    [[[self view] layer]addSublayer:_CircleLayer];
    
    CATextLayer *textLayer =[[CATextLayer alloc] init];
    [textLayer setFont:@"Calibri"];
    [textLayer setFontSize:20];
    [textLayer setString:@"Word?"];
    [textLayer setPosition:CGPointMake(100, 100)];
    [textLayer setFrame:self.view.frame];
    [textLayer setForegroundColor:[[UIColor blackColor] CGColor]];
    [[[self view] layer]addSublayer:textLayer];
    
    
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:[self view]];
    
    [_CircleLayer setPosition:p];
    
    for (CAShapeLayer *l in self.view.layer.sublayers)
    {
        CGAffineTransform transf = CGAffineTransformMakeTranslation(-l.position.x, -l.position.y);
        if ([l isKindOfClass:[CAShapeLayer class]])
        {
            if (CGPathContainsPoint(l.path, &transf, p, NO))
            {
                NSLog(@"Layer touched: %@", l.name);
                [l setFillColor:[UIColor redColor].CGColor];
                
                CGPoint newpoint = CGPointMake(l.position.x+30, l.position.y +30);
                l.position = newpoint;
            }
        }
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonOnClick:(id)sender
{
    NSString *url = @"http://10.4.172.85:8124?cmd=control";
    [self postDataWithUrl:url:@"on":@"10"];
    [UISwitchOutlet setOn:YES animated:YES];
}

- (IBAction)ButtonOffClick:(id)sender
{
    NSString *url = @"http://10.4.172.85:8124?cmd=control";
    [self postDataWithUrl:url:@"off":@"10"];
    [UISwitchOutlet setOn:NO animated:YES];
}

- (IBAction)UISwitchChanged:(id)sender
{
    if ([UISwitchOutlet isOn])
    {
        NSString *url = @"http://10.4.172.85:8124?cmd=control";
        [self postDataWithUrl:url:@"on":@"10"];
    }
    else
    {
        NSString *url = @"http://10.4.172.85:8124?cmd=control";
        [self postDataWithUrl:url:@"off":@"10"];
    }
}

- (IBAction)ButtonAllOnClicked:(id)sender  //Array functions disabled as all lights are assigned.  
{
    /*
    NSString *url = @"http://10.4.172.85:8124?cmd=control";
    for (int i=9;i<=15;i++)
    {
        NSString *ligid = [[NSString alloc]initWithFormat:@"%i",i];
        [self postDataWithUrl:url:@"1":ligid];
    }
     */
}

- (IBAction)ButtonAllOffClicked:(id)sender
{
    /*
    NSString *url = @"http://10.4.172.85:8124?cmd=control";
    for (int i=9;i<=15;i++)
    {
        NSString *ligid = [[NSString alloc]initWithFormat:@"%i",i];
        [self postDataWithUrl:url:@"0":ligid];
    }
     */
}


-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    //NSString *response = [[NSString alloc] initWithData:_httpdata encoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpdata options:kNilOptions error:Nil];
    if ([json objectForKey:@"status"])
    {
        NSLog(@"Status:  %@", json[@"status"]);
    }
    
    
    //NSLog(@"%@", json);
}

-(void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpdata appendData:data];
}

-(NSString *)getCurrentDateUTC
{
    float fseconds = [[NSDate date] timeIntervalSince1970];
    fseconds = fseconds/100;
    fseconds = roundf(fseconds);
    int iseconds = (int) floor(fseconds);
    NSString *t =  [NSString stringWithFormat:@"%i", iseconds];
    return t;
}




-(void) postDataWithUrl:(NSString *) urlString:(NSString *) status:(NSString *) lightd
{
    _httpdata = [[NSMutableData alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    
    
    
    
    NSMutableString *postbody = [[NSMutableString alloc] init];
    
    
    //NSString *key = @"a653fe3541ca1f8699a40b6b5e6d226a";   
    NSString *key = @"FakeKeyisFake";
    NSString *secret =@"SecretsMustRemainSecret";
    //NSString *secret = @"dd32d3dbbb81409dd502cafd5489d977"; 
    NSString *timestamp = [[NSString alloc] initWithString:[self getCurrentDateUTC]];
    NSString *lightid = lightd;
    //NSString *state = @"1"; //on
    //switched on to input to allow on/off switching.
    NSString *state = status;
    
    /*
     *
     *
     *New numbers are 10-11
     *
     *
     */
    
    
    //build!
    //start brace for total
    [postbody appendString:@"{ "];
    //[postbody appendFormat:@"\"key\":\"%@\",", key];
    //[postbody appendFormat:@"\"secret\":\"%@\",",secret];
    //[postbody appendFormat:@"\"timestamp\":\"%@\",",timestamp];
    [postbody appendFormat:@"\"mode\":\"control\","];
    [postbody appendFormat:@"\"lights\": "];  //lights becomes array
    
    //light array(new)
    [postbody appendFormat:@"["];
    //opening light brace
    [postbody appendFormat:@"{ "];
    [postbody appendFormat:@"\"id\":\"%@\",",lightid];
    [postbody appendFormat:@"\"state\":\"%@\"",state];
    [postbody appendFormat:@" }"];
    //second light(new)
    [postbody appendFormat:@","];
    [postbody appendFormat:@"{ "];
    [postbody appendFormat:@"\"id\":\"%i\",",11];
    [postbody appendFormat:@"\"state\":\"%@\"",state];
    [postbody appendFormat:@" }"];
    //closing array(new)
    [postbody appendFormat:@"]"];
    
    
    
    
    
    [postbody appendString:@" }"];
    NSData *postdata = [postbody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postdata];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
}



@end
