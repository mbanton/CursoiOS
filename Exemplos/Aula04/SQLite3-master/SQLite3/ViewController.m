//
//  ViewController.m
//  SQLite3
//
//  Created by Jorge Luis Beckel Flor on 10/18/13.
//  Copyright (c) 2013 Jorge Luis Beckel Flor. All rights reserved.
//

#import "ViewController.h"
#import "SQLiteDatabase.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    SQLiteDatabase *databaseTemp = [[SQLiteDatabase alloc] init];
    NSArray *Result = [databaseTemp performQuery:@"Select * From tblPessoa"];
    
    NSLog(@"Resultado:");
    NSLog(@"-------------------------");
    NSLog(@"%@", Result);
        
    
    UITextView *Texto = (UITextView *)[self.view viewWithTag:1];
    Texto.text = [NSString stringWithFormat:@"%@",Result];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
