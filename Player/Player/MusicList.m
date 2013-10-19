//
//  MusicList.m
//  Player
//
//  Created by Marcelo Anton on 19/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "MusicList.h"

@implementation MusicList

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
                           @"3333-1234", @"numeroTelefone", @"1001", @"idPosto", nil];
    NSDictionary *dado2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Posto Ipiranga", @"nomePosto",
                           @"0800456 7898", @"numeroTelefone", @"1002", @"idPosto", nil];
    NSDictionary *dado3 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Posto Shell", @"nomePosto",
                           @"4004-0001", @"numeroTelefone", @"1003", @"idPosto", nil];
    
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

// Metodos necessários pela ScrollViewer
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

// Metodos necessários pela ScrollViewer
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [filtro count];
}

// Metodos necessários pela ScrollViewer
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

// Metodos necessários pela ScrollViewer
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Recuperar meu array
    NSDictionary *dadosTemp = [filtro objectAtIndex: indexPath.row];
    NSString *idPosto = [dadosTemp objectForKey:@"idPosto"];
    
    // Logando o que recuperei
    NSLog(@"Linha selecionada: %ld", (long) indexPath.row);
    NSLog(@"idPosto selecionado: %@", idPosto);
    
    
    // Pegando da storyboard a ViewController de detalhamento dos postos
    //DetalhePosto *controller = (DetalhePosto*) [self.storyboard
    //instantiateViewControllerWithIdentifier:@"DetalhePostosScreen" ];
    // Setando a propriedade que será passada adiante
    //[controller setIdPosto:idPosto];
    
    // fazendo a navegação propriamente dita
    //[self.navigationController pushViewController:controller animated:YES];
    
}

// Metodo de busca - Necessita que tenhamos no .h o delegate UISearchBarDelegate
- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"Texto buscado: %@", searchText);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.nomePosto contains[c] %@", searchText];
    
    filtro = [NSMutableArray arrayWithArray: [meuDataSource filteredArrayUsingPredicate: predicate]];
    
    NSLog(@"Array filtrado: %@", filtro);
    
    [minhaGrid reloadData];
    
}


@end

