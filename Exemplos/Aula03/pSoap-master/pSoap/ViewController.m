//
//  ViewController.m
//  pSoap
//
//  Created by Jorge Flor on 10/3/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import "ViewController.h"
#import "XMLDictionary.h"

@interface ViewController ()
    @property (retain, nonatomic) IBOutlet NSMutableData *webData;
@end

@implementation ViewController
@synthesize webData;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
     
     <nVlAltura>#nVlAltura#</nVlAltura>
     <nVlLargura>#nVlLargura#</nVlLargura>
     <nVlDiametro>#nVlDiametro#</nVlDiametro>
     <sCdMaoPropria>#sCdMaoPropria#</sCdMaoPropria>
     <nVlValorDeclarado>#nVlValorDeclarado#</nVlValorDeclarado>
     <sCdAvisoRecebimento>#sCdAvisoRecebimento#</sCdAvisoRecebimento>
     <sDtCalculo>#sDtCalculo#</sDtCalculo>
     
     */
    
    //////
    /// WebService ENVELOPE REQUEST
    //////
    ///http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?op=CalcPrecoData
    
    /// Monta envelope com os dados que estão em arquivo txt
    NSString *arquivoSoap = [[NSBundle mainBundle] pathForResource: @"CalcPrecoData" ofType: @"txt"];
    NSStringEncoding encoding;
    NSError *error;
    NSString *soapMessage = [NSString stringWithContentsOfFile:arquivoSoap usedEncoding:&encoding error:&error];
    
    /// Ajustando Variáveis no Envelope
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nCdEmpresa#" withString:@"."];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#sDsSenha#" withString:@"."];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nCdServico#" withString:@"40010"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#sCepOrigem#" withString:@"90450050"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#sCepDestino#" withString:@"91410080"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlPeso#" withString:@"1"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nCdFormato#" withString:@"1"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlComprimento#" withString:@"20.50"];

    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlAltura#" withString:@"2.10"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlLargura#" withString:@"11.50"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlDiametro#" withString:@"0.50"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#sCdMaoPropria#" withString:@"0.50"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlValorDeclarado#" withString:@"0.50"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#sCdAvisoRecebimento#" withString:@"0.50"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#sDtCalculo#" withString:@"03/10/2013"];
    
    
    
    /// Envelope Request
    NSLog(@"Envelope Request: %@", soapMessage);
    NSString *UrlWsdl = @"http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?op=CalcPrecoData";
    NSURL *url = [NSURL URLWithString:UrlWsdl];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest addValue:@"http://tempuri.org/CalcPrecoData" forHTTPHeaderField:@"SOAPAction"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    // return
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    //        [theRequest release];
    
    if( theConnection )
    {
        NSMutableData *webDataLocal;
        webDataLocal = [NSMutableData data];
        [self setWebData:webDataLocal];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    
    
    
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"ERROR with theConenction -- MVC");
    //    [connection release];
    //    [webData release];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{

    NSString *theXML = [[NSString alloc] initWithBytes: [[self webData] mutableBytes] length:[[self webData] length] encoding:NSUTF8StringEncoding];

    NSLog(@"ConnFinish");
    NSLog(@"Request: %@", theXML);
    
    
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:theXML];
    
    NSString *ValorCorreios = [xmlDoc valueForKeyPath:@"soap:Body.CalcPrecoDataResponse.CalcPrecoDataResult.Servicos.cServico.Valor"];
    
    NSLog(@"==================================");
    NSLog(@"Valor Orçamento Correios: %@", ValorCorreios);
    UILabel *ValorServico = (UILabel *)[self.view viewWithTag:1];
    ValorServico.text = ValorCorreios;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    

    
}

@end
