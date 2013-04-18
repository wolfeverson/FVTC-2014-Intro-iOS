//
//  GameViewController.m
//  Assignment7
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "GameViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize GameIdLabel, GameNumberLabel;
/*
 
 DataGrid is (35,150) -> (285,400)
 5x5 Grid.  Each square is 50x50 pixels.
 
 Timer ticks.  After back out of game.  Tick.  Tick.  Tick.   
 
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];//must setup board AFTER the initialization.  
    [self buildGrid];
    [self buildNumber];
    [self buildCircles];
    [self buildTouchyFields];
    [GameIdLabel setText:_GameId];
    _Timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(tick) userInfo:Nil repeats:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//called from outside the form to pass in the datas.
-(void) BuildGameData: (NSString *) ArrayString
{
    _GameArray = [ArrayString componentsSeparatedByString:@","];
}
//called from outside.  passes game_id in (for title)
-(void) SetGameId: (NSString *) g_id
{
    _GameId = g_id;
}

//puts each number in place to fill bingo grid.
-(void) buildNumber
{
    NSMutableArray *TextLayers =[[NSMutableArray alloc] initWithCapacity:25];
    int x = 35;
    int y = 150;
    int counter = 0;
    for (int col = 0; col < 5; col++)
    {
        for (int row = 0; row < 5; row ++)
        {
            CATextLayer *tempTextLayer = [[CATextLayer alloc] init];
            [tempTextLayer setFont:@"Calibri"];
            [tempTextLayer setFontSize:20];
            NSString *number = [[NSString alloc] initWithFormat:@"%@",_GameArray[counter]];
            [tempTextLayer setString:number];
            [tempTextLayer setFrame:CGRectMake(x+13, y+13, 50, 50)];
            //[tempTextLayer setFrame:self.view.frame];  //This code is EVIL.
            [tempTextLayer setForegroundColor:[[UIColor blackColor] CGColor]];
            [TextLayers addObject:tempTextLayer];
            [[[self view] layer] addSublayer:tempTextLayer];
            y = y + 50;
            counter ++;
        }
        x = x + 50;
        y = 150;
    }
}

//builds game grid
-(void) buildGrid 
{
    NSMutableArray *ShapeLayers = [[NSMutableArray alloc] initWithCapacity:12];
    NSMutableArray *ShapePaths = [[NSMutableArray alloc] initWithCapacity:12];
    int x = 35;
    int y = 150;
    for (int i = 0; i < 12; i++)
    {
        if (i < 6)//horizontal
        {
            CAShapeLayer *TempShapeLayer = [CAShapeLayer layer];
            UIBezierPath *TempPath = [UIBezierPath bezierPath];
            [TempPath moveToPoint:CGPointMake(x, 150)];
            [TempPath addLineToPoint:CGPointMake(x, 400)];
            [TempPath closePath];
            [TempShapeLayer setPath:[TempPath CGPath]];
            [TempShapeLayer setLineWidth:3];
            [TempShapeLayer setStrokeColor:[UIColor blackColor].CGColor];
            [ShapePaths addObject:TempPath];
            [ShapeLayers addObject:TempShapeLayer];
            [[[self view] layer] addSublayer:ShapeLayers[i]];
            x = x + 50;
        }
        else//vertical
        {
            CAShapeLayer *TempShapeLayer = [CAShapeLayer layer];
            UIBezierPath *TempPath = [UIBezierPath bezierPath];
            [TempPath moveToPoint:CGPointMake(35, y)];
            [TempPath addLineToPoint:CGPointMake(285, y)];
            [TempPath closePath];
            [TempShapeLayer setPath:[TempPath CGPath]];
            [TempShapeLayer setLineWidth:3];
            [TempShapeLayer setStrokeColor:[UIColor blackColor].CGColor];
            [ShapePaths addObject:TempPath];
            [ShapeLayers addObject:TempShapeLayer];
            [[[self view] layer] addSublayer:ShapeLayers[i]];
            y= y + 50;
        }
    }
}

//builds circles (that would appear on click)
-(void) buildCircles
{
    NSMutableArray *CircleLayers =[[NSMutableArray alloc] initWithCapacity:25];
    int x = 35;
    int y = 150;
    int counter = 1;
    for (int col = 0; col < 5; col++)
    {
        for (int row = 0; row < 5; row ++)
        {
            CAShapeLayer *tempCircle = [CAShapeLayer layer];
            UIBezierPath *circleBez = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x+4, y+4, 40, 40) cornerRadius:40];
            [tempCircle setLineWidth:2];
            [tempCircle setFillColor:[UIColor clearColor].CGColor];
            [tempCircle setStrokeColor:[UIColor clearColor].CGColor];
            [tempCircle setPath:[circleBez CGPath]];
            [tempCircle setName:[[NSString alloc] initWithFormat:@"Circle%i", counter]];
            counter ++;
            [CircleLayers addObject:tempCircle];
            [[[self view] layer] addSublayer:tempCircle];
            y = y + 50;
        }
        x = x + 50;
        y = 150;
    }
    _CirclesArray =CircleLayers;
}

//builds rectangle fields so touches are not limited to circles.  
-(void) buildTouchyFields
{
    int x = 35;
    int y = 150;
    int counter = 1;
    for (int i = 1; i < 6; i++)
    {
        for (int i = 1; i < 6; i++)
        {
            CAShapeLayer *LineLayer = [CAShapeLayer  layer];
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, 49, 49)];
            [LineLayer setPath:[path CGPath]];
            [LineLayer setFillColor:[UIColor clearColor].CGColor];
            [LineLayer setLineWidth:0];
            [LineLayer setName:[[NSString alloc] initWithFormat:@"TouchPad%i", counter]];
            [[[self view] layer] addSublayer:LineLayer];
            y = y + 50;
            counter ++;
        }
        x= x + 50;
        y= 150;
    }
}

//checks touch event.  lights up circle Even if rectangle is clicked!
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:[self view]];
    for (CAShapeLayer *l in self.view.layer.sublayers)
    {
         CGAffineTransform transf = CGAffineTransformMakeTranslation(-l.position.x, -l.position.y);
        if ([l isKindOfClass:[CAShapeLayer class]])
        {
            if (CGPathContainsPoint(l.path, &transf, p, NO))
            {
                if (l.name !=  NULL)
                {
                    NSString *Touched = [[NSString alloc] initWithFormat:@"%@", l.name];                   
                    NSString *match = @"Pad";
                    NSString *pre;
                    NSString *post;
                    
                    NSScanner *scanner = [NSScanner scannerWithString:Touched];
                    [scanner scanUpToString:match intoString:&pre];
                    [scanner scanString:match intoString:nil];
                    post = [Touched substringFromIndex:scanner.scanLocation];
                    if ([pre isEqualToString:@"Touch"])
                    {
                        NSString *CircleTouched = [[NSString alloc] initWithFormat:@"Circle%@",post];
                        for (CAShapeLayer *l in self.view.layer.sublayers)
                        {
                            if ([l.name isEqualToString:CircleTouched])
                            {
                                [l setStrokeColor:[UIColor redColor].CGColor];
                            }
                        }
                    }
                }
            }
        }
    }
}

//timer tick.  calls new number function. 
-(void) tick
{
    NSString *url = @"http://bingo.humboldttechgroup.com:1111/?cmd=getnumber";
    [self postDataWithUrl:url];
}


/*
 *
 *
 Sample Data DID NOT MATCH LIVE.  QQ
 *
 *
 */
 
 

//takes json array.  builds into new number.  updates number.
-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpdata options:kNilOptions error:Nil];
    if ([[json objectForKey:@"status"] isEqualToString:@"ok"])
    {
        if ([[json objectForKey:@"message"] isEqualToString:@"number requested"])
        {
            NSLog(@"GetNumber - OK");
        }
        NSString *newnumber = [json objectForKey:@"number"];
        [GameNumberLabel setText:newnumber];
    }
    else
    {
        NSLog(@"Server Error - GetNumber");
    }
}

//webserver boilerplate
-(void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpdata appendData:data];
}
//webserver boilerplate w/ json building
-(void) postDataWithUrl:(NSString *) urlString
{
    _httpdata = [[NSMutableData alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSMutableString *postbody = [[NSMutableString alloc] init];
    //build json out string
    NSString *timestamp = [self getCurrentDateUTC];
    NSString *gameid = _GameId;
    NSString *userid = @"5";   //Created user Id
    [postbody appendFormat:@"{\"timestamp\": \"%@\",", timestamp];
    [postbody appendFormat:@"\"game_id\": \"%@\",", gameid];
    [postbody appendFormat:@"\"user_id\":\"%@\"}", userid];
    //json build end.
    NSData *postData = [postbody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

//gets timestamp string. decimal dropped-nothing more.
-(NSString *)getCurrentDateUTC
{
    float fseconds = [[NSDate date] timeIntervalSince1970];
    //fseconds = fseconds/100;
    //fseconds = roundf(fseconds);
    int iseconds = (int) floor(fseconds);
    NSString *t =  [NSString stringWithFormat:@"%i", iseconds];
    return t;
}




























@end
