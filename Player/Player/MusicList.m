//
//  MusicList.m
//  Player
//
//  Created by Marcelo Anton on 19/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "MusicList.h"

@implementation MusicList


// Data
NSMutableArray *data;
NSMutableArray *filters;

// Local controls
UITableView *tableViewMusicList;

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
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
    filters = [[NSMutableArray alloc] initWithArray:data copyItems:TRUE];
    
    // Controls
    UITableView *tableViewMusicList = (UITableView*)[self.view viewWithTag:2];
    
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
    NSLog(@"Filters Count: %lu", (unsigned long)filters.count);
    return [filters count];
}

// Metodos necessários pela ScrollViewer
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    /// Controle
    UILabel *nmGenero = (UILabel *)[cell viewWithTag:21];
    
    // Recuperando meus dados do array
    NSDictionary *tmp = [filters objectAtIndex:indexPath.row];
    nmGenero.text = [tmp objectForKey:@"nomePosto"];
    
    return cell;
}

#pragma mark - UITableView Delegate Methods

// Metodos necessários pela ScrollViewer
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Recuperar meu array
    NSDictionary *dadosTemp = [filters objectAtIndex: indexPath.row];
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

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

#pragma mark - Search Bar Delegate

// Metodo de busca - Necessita que tenhamos no .h o delegate UISearchBarDelegate
- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"Texto buscado: %@", searchText);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.nomePosto contains[c] %@", searchText];
    
    filters = [NSMutableArray arrayWithArray: [data filteredArrayUsingPredicate: predicate]];
    
    NSLog(@"Array filtrado: %@", filters);
    
    [tableViewMusicList reloadData];
    
}



@end
