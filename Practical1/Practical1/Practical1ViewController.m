//
//  Practical1ViewController.m
//  Practical1
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 wolfeverson. All rights reserved.
//

#import "Practical1ViewController.h"

@interface Practical1ViewController ()

@end

@implementation Practical1ViewController
@synthesize ArtistText, NameText, VolumeSlider;
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

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [ArtistText resignFirstResponder];
    [NameText resignFirstResponder];
    
}

- (IBAction)SubmitButtonClicked:(id)sender
{
    NSString *Artist = [ArtistText text];
    NSString *SongName = [NameText text];
    int SliderValue = [VolumeSlider value];
    NSString *CombinedString = [NSString stringWithFormat:@"Your song choice is %@, by %@, set to volume level %i", SongName, Artist, SliderValue];
    NSLog(CombinedString);
}
@end
