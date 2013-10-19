//
//  ViewController.m
//  ChamarSafari
//
//  Created by Jorge Flor on 10/18/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

///
/// Abrir no Chrome
/// Classe Terceira: https://github.com/GoogleChrome/OpenInChrome
///


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)doTargetTrust:(id)sender {
    NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.targettrust.com.br" ];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)doGoogle:(id)sender{
    NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.google.com.br" ];
    [[UIApplication sharedApplication] openURL:url];
    
}
- (IBAction)doApple:(id)sender{
    NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.apple.com.br" ];
    [[UIApplication sharedApplication] openURL:url];
    
}


@end
