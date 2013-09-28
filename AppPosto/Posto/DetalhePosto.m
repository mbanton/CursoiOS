//
//  DetalhePosto.m
//  Posto
//
//  Created by Aluno on 28/09/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "DetalhePosto.h"

@implementation DetalhePosto

@synthesize idPosto;

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

    NSLog(@"idPosto dentro de DetalhePostos: %@", idPosto);
    
    // Controles
    UITextView *descricao = (UITextView *) [self.view viewWithTag:1];
    
    
    // Setando um detalhamento do Posto
    [descricao setText: @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut risus eu risus mollis suscipit in in neque. Donec at sem facilisis, hendrerit sapien porttitor, vestibulum velit. Nullam pellentesque nisl lectus, aliquet elementum nibh rutrum a. Aliquam in orci convallis, faucibus metus sed, scelerisque mauris. Etiam nec metus tellus. Nam sit amet ante et augue laoreet convallis. Vivamus facilisis dapibus tortor, eu dignissim odio tincidunt ultrices. Suspendisse ac urna vel ante auctor congue. Vivamus iaculis dolor nulla, id accumsan purus aliquet egestas. Nulla mattis libero nisi, et feugiat mauris egestas eget. Phasellus eu diam non odio varius suscipit vel non lorem. Integer et blandit mauris. Donec venenatis posuere nibh a fermentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris vehicula vel nunc at molestie. Pellentesque id ligula nulla. Aliquam in ipsum vel enim cursus consectetur. Nullam mattis ante vitae eros congue ultrices. Sed ut metus id diam posuere accumsan. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut id dolor vitae libero mattis gravida quis sed arcu. Mauris erat enim, sagittis quis feugiat a, lobortis sed velit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas viverra nisi neque, at semper orci venenatis id. Nam laoreet eros sit amet ligula blandit, ac vehicula eros pulvinar. Donec nec dapibus odio. Nam sit amet laoreet massa. Integer eu lobortis dolor, nec dignissim lorem. Mauris tempor scelerisque diam quis viverra. Proin elementum justo semper sem egestas aliquet. Etiam sagittis augue et ipsum rhoncus vehicula. Cras venenatis posuere varius. Sed tempor mauris ac orci pretium imperdiet. Sed sed lobortis dui. Fusce congue eros dignissim quam dignissim blandit. Etiam posuere quam ut elit molestie molestie. Pellentesque placerat risus elit, a lacinia enim euismod vel. Quisque erat nunc, feugiat et cursus vitae, eleifend ac magna. Sed congue mauris nisl, eget feugiat ipsum aliquam scelerisque. Vivamus congue porta faucibus. Sed a risus erat. Maecenas molestie, massa id varius pretium, orci turpis porttitor massa, et hendrerit enim nisi sit amet mi. Maecenas vel diam lorem. Nulla vehicula egestas aliquam. Mauris fringilla magna id lacus vulputate, in fringilla tortor accumsan. Proin ut sapien sit amet felis auctor semper sed in quam. Ut consectetur scelerisque consequat. Nulla at metus diam. Sed et porttitor libero. Pellentesque tempus nisl eros, at auctor lacus tincidunt vitae. Integer congue, urna in molestie porttitor, libero nunc tempus purus, vitae dignissim neque neque quis massa. Nullam a scelerisque justo. Integer pretium rhoncus odio ut luctus. Nullam quam lectus, posuere sed congue ac, volutpat id tellus. Phasellus fermentum placerat."];
    
    // swipe right
    UISwipeGestureRecognizer *rightGesture;
    rightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector (handleSwipe:)];
    [rightGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:rightGesture];
    
    UISwipeGestureRecognizer *leftGesture;
    leftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector (handleSwipe:)];
    [leftGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:leftGesture];
    
}

-(void) handleSwipe: (UISwipeGestureRecognizer *) recognizer
{
    NSLog(@"Swipe to: %@", recognizer);
    
    // Gesto de voltar
    if ( recognizer.direction == UISwipeGestureRecognizerDirectionRight )
    {
        [self.navigationController popViewControllerAnimated: true];
    }
    else
    {
        NSLog(@"Gesto para esquerda não implementado.");
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
