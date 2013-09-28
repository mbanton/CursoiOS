//
//  ViewController.m
//  ImageApp
//
//  Created by Aluno on 28/09/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

UIActivityIndicatorView *loader;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

    [loader setFrame:CGRectMake(25, 25, 50, 50)];
    
    [self.view addSubview:loader];
    
    [loader startAnimating];
    
    [self carregaDados];
    
}

- (void) carregaDados
{
    


    NSURL *urlImage = [NSURL URLWithString:@"http://newevolutiondesigns.com/images/freebies/nature-hd-background-25.jpg"];
    
    NSData *dataImage = [[NSData alloc] initWithContentsOfURL:urlImage];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 600)];
    
    //[image setImage: [UIImage imageNamed:@"imagesmothers-are-right.jpg"]];
    
    [image setImage: [[UIImage alloc ] initWithData:dataImage]];
    
    [self.view addSubview:image];
    
    [self.view bringSubviewToFront:loader];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.previsaodotempo.org/api.php?city=Porto%20AAlegre"]];
    NSString *stringResponse = [[NSString alloc] initWithData: jsonData encoding: NSUTF8StringEncoding];
    
    if ( [stringResponse length] > 0 )
    {
        NSLog(@"Resposta do WS: %@", stringResponse);
    }
    
    [NSThread sleepForTimeInterval:5.0f];
    
    NSLog(@"Slepp terminou");

    
    [loader stopAnimating];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
