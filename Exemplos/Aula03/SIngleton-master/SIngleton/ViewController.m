//
//  ViewController.m
//  SIngleton
//
//  Created by Jorge Luis Beckel Flor on 10/5/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[self iSession] setNome:@"paraná"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
