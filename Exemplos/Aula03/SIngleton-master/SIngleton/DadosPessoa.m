//
//  DadosPessoa.m
//  SIngleton
//
//  Created by Jorge Luis Beckel Flor on 10/5/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import "DadosPessoa.h"

@interface DadosPessoa ()

@end

@implementation DadosPessoa


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
	// Do any additional setup after loading the view.

    UILabel *NmPessoa = (UILabel *)[self.view viewWithTag:1];
    NmPessoa.text = [self iSession].Nome;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doFechar:(id)sender {
    /// Volta
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
