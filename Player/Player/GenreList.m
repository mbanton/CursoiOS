//
//  GenreList.m
//  Player
//
//  Created by Marcelo Anton on 19/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "GenreList.h"

@implementation GenreList

// Data
NSMutableArray *data;
NSMutableArray *filter;

// Local controls
UITableView *tableViewGenre;
UISearchBar *searchBarGenre;

// Return format:
// 6[* Top Hits|7[Axé|16[Latina|9[Pop/Dance|3[Reggae|13[Rock|1[Romanticas|2[Samba/Pagode|15[Sertanejo

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
    
    data = [[NSMutableArray alloc] initWithObjects:dado1, dado2, dado3, nil];
    
    // Copio para o array filtro
    filter = [[NSMutableArray alloc] initWithArray:data copyItems:TRUE];
    
    // Controls
    UITableView *tableViewGenre = (UITableView*)[self.view viewWithTag:2];
    //[GridGenre setDelegate:self];
    //[GridGenre setDataSource:self];
    
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
    NSLog(@"Filter Count: %lu", (unsigned long)filter.count);
    return [filter count];
}

// Metodos necessários pela ScrollViewer
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellGenre";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    /// Controle
    UILabel *nmGenero = (UILabel *)[cell viewWithTag:1];
    
    // Recuperando meus dados do array
    NSDictionary *tmp = [filter objectAtIndex:indexPath.row];
    nmGenero.text = [tmp objectForKey:@"nomePosto"];

    return cell;
}

// Metodos necessários pela ScrollViewer
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Recuperar meu array
    NSDictionary *dadosTemp = [filter objectAtIndex: indexPath.row];
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
    
    filter = [NSMutableArray arrayWithArray: [data filteredArrayUsingPredicate: predicate]];
    
    NSLog(@"Array filtrado: %@", filter);
    
    [self.tableViewGenre reloadData];
    
}



@end
