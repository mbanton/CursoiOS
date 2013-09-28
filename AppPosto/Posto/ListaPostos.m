//
//  ListaPostos.m
//  Posto
//
//  Created by Aluno on 28/09/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "ListaPostos.h"


@implementation ListaPostos

NSMutableArray *meuDataSource;
UISearchBar *minhaBusca;
NSMutableArray *filtro;
UITableView *minhaGrid;


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

    // Criando dados de teste
    NSDictionary *dado1 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Posto Nilo Peçanha", @"nomePosto",
                           @"3333-1234", @"numeroTelefone", nil];
    NSDictionary *dado2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Posto Ipiranga", @"nomePosto",
                           @"0800456 7898", @"numeroTelefone", nil];
    NSDictionary *dado3 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Posto Shell", @"nomePosto",
                           @"4004-0001", @"numeroTelefone", nil];
    
    meuDataSource = [[NSMutableArray alloc] initWithObjects:dado1, dado2, dado3, nil];
    
    // Copio para o array filtro
    filtro = [[NSMutableArray alloc] initWithArray:meuDataSource copyItems:TRUE];
    
    // Controles
    minhaBusca = (UISearchBar *) [self.view viewWithTag:101];
    minhaGrid = (UITableView *) [self.view viewWithTag:201];
                 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [filtro count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // Pegando a label
    UILabel *nomePosto = (UILabel *)[cell viewWithTag:1];
    UILabel *telefonePosto = (UILabel *)[cell viewWithTag:2];

    
    // Recuperando meus dados do array
    NSDictionary *dadosTmp = [filtro objectAtIndex:indexPath.row];
    nomePosto.text = [dadosTmp objectForKey:@"nomePosto"];
    telefonePosto.text = [dadosTmp objectForKey:@"numeroTelefone"];


    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Linha selecionada: %ld", (long) indexPath.row);
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"Texto buscado: %@", searchText);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.nomePosto contains[c] %@", searchText];
    
    filtro = [NSMutableArray arrayWithArray: [meuDataSource filteredArrayUsingPredicate: predicate]];
    
    NSLog(@"Array filtrado: %@", filtro);
    
    [minhaGrid reloadData];
    
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


@end
