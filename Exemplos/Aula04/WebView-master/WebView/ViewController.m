//
//  ViewController.m
//  WebView
//
//  Created by Jorge Flor on 10/18/13.
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
    
    NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.targettrust.com.br" ];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    UIWebView *Navegador = (UIWebView *)[self.view viewWithTag:1];
    [Navegador setDelegate:self];
    [Navegador loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"Terminou de Carregar!!!");
}

@end
