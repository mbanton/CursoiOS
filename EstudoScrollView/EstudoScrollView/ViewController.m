//
//  ViewController.m
//  EstudoScrollView
//
//  Created by Aluno on 28/09/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

UIScrollView *minhaScroll;

- (void)viewDidLoad
{
    [super viewDidLoad];

    minhaScroll = (UIScrollView*) [self.view viewWithTag:1];
    [minhaScroll setContentSize:CGSizeMake(640, 1000)];

    [minhaScroll setPagingEnabled:true];
    
    UIView *box1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 456)];
    [box1 setBackgroundColor:[UIColor redColor]];

    UIView *box2 = [[UIView alloc] initWithFrame:CGRectMake(456, 0, 320, 456)];
    [box2 setBackgroundColor:[UIColor greenColor]];
    
    [minhaScroll addSubview:box1];
    [minhaScroll addSubview:box2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

    
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    float posY = scrollView.contentOffset.y;
    NSLog(@"Scrol: %f", posY);
    
    if ( posY <= -130 )
    {
        UIAlertView *Teste = [[UIAlertView alloc] initWithTitle:@"Refresh" message:@"Atualizando dados..." delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
        [Teste show];
    }
    
}

@end
