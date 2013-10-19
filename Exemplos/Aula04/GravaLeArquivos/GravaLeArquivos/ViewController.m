//
//  ViewController.m
//  GravaLeArquivos
//
//  Created by Jorge Flor on 10/18/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UITextField *TextoAGravar;
UILabel *TextoMostrar;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /// Controles
    TextoAGravar = (UITextField *)[self.view viewWithTag:1];
    TextoMostrar = (UILabel *)[self.view viewWithTag:2];
    
    /// Delegate
    [TextoAGravar setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Teclado
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

#pragma mark - Funcoes
- (IBAction)doEscreveArquivo:(id)sender
{
    /// Pasta
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:@"MeuArquivo.txt"];
    NSLog(@"ArquivloLocal: %@", filePath);

    /// Grava
    [TextoAGravar.text writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];

    
}

- (IBAction)doLeArquivo:(id)sender
{
    NSLog(@"aaa");
    
    /// Pasta
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:@"MeuArquivo.txt"];
    NSLog(@"Path: %@", filePath);
    
    
    /// Lê Arquivo e guarda em uma variável
    NSString *ArquivoCompleto = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];

    /// Mostra no label
    [TextoMostrar setText:ArquivoCompleto];

}
@end
