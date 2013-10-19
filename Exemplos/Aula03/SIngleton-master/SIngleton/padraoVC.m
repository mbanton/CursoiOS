//
//  padraoVC.m
//  SIngleton
//
//  Created by Jorge Luis Beckel Flor on 10/5/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import "padraoVC.h"
#import "MinhaSessao.h"


@interface padraoVC ()

@end

@implementation padraoVC


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

    MinhaSessao *iSessionTemp = [MinhaSessao sharedManager];
    [self setISession:iSessionTemp];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
