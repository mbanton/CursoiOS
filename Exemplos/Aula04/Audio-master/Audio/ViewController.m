//
//  ViewController.m
//  Audio
//
//  Created by Jorge Luis Beckel Flor on 10/18/13.
//  Copyright (c) 2013 Jorge Luis Beckel Flor. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

AVAudioPlayer *backgroundMusic;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"musica" ofType:@"mp3"]];
    
    backgroundMusic  = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile  error:nil];
    backgroundMusic.numberOfLoops = -1;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doPlay:(id)sender {
    
    [backgroundMusic play];
    
    
}

- (IBAction)doStop:(id)sender {
    
    [backgroundMusic stop];
}
@end
