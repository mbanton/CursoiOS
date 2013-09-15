//
//  SalvaDados.m
//  ConsultaData
//
//  Created by Aluno on 14/09/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "SalvaDados.h"

@interface SalvaDados ()

@end

@implementation SalvaDados

@synthesize objPessoa;

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

    NSLog(@"DADOS SALVOS");
    NSLog(@"Nome pessoa: %@", objPessoa.Nome);
    NSLog(@"Telefone: %@", objPessoa.Telefone);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
