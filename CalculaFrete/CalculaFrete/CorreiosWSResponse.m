//
//  CorreiosWSResponse.m
//  CalculaFrete
//
//  Created by Aluno on 05/10/13.
//  Copyright (c) 2013 Marcelo Anton. All rights reserved.
//

#import "CorreiosWSResponse.h"
#import "XMLDictionary.h"


@implementation CorreiosWSResponse

@synthesize cepOrigem;
@synthesize cepDestino;
@synthesize altura;
@synthesize largura;
@synthesize peso;

NSMutableData *webData;

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
	// Do any additional setup after loading the view.
    
    NSLog(@"cepOrigem: %@", cepOrigem);
    NSLog(@"cepDestino: %@", cepDestino);
    NSLog(@"altura: %@", altura);
    NSLog(@"largura: %@", largura);
    NSLog(@"peso: %@", peso);
    
    
    
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
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#sCepOrigem#" withString: cepOrigem];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#sCepDestino#" withString: cepDestino];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlPeso#" withString:peso];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nCdFormato#" withString:@"1"];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlComprimento#" withString:@"20.50"];
    
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlAltura#" withString:altura];
    soapMessage = [soapMessage stringByReplacingOccurrencesOfString:@"#nVlLargura#" withString:largura];
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
        webData = webDataLocal;
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    
    NSLog(@"ConnFinish");
    NSLog(@"Request: %@", theXML);
    
    
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:theXML];
    
    NSString* error = [xmlDoc valueForKeyPath:@"soap:Body.CalcPrecoDataResponse.CalcPrecoDataResult.Servicos.cServico.Erro"];
    NSString* msgError = [xmlDoc valueForKeyPath:@"soap:Body.CalcPrecoDataResponse.CalcPrecoDataResult.Servicos.cServico.MsgErro"];
    
    if ( error ) {
        NSLog(@"ERRO ----- %@", msgError);
    }
    
    NSString *ValorCorreios = [xmlDoc valueForKeyPath:@"soap:Body.CalcPrecoDataResponse.CalcPrecoDataResult.Servicos.cServico.Valor"];
    
    NSLog(@"==================================");
    NSLog(@"Valor Orçamento Correios: %@", ValorCorreios);
    UILabel *ValorServico = (UILabel *)[self.view viewWithTag:1];
    ValorServico.text = ValorCorreios;
}


@end
