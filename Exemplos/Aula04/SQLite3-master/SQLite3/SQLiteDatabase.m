//
//  SQLiteDatabase.m
//  mSales
//
//  Created by Jorge Luis Beckel Flor on 10/12/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import "SQLiteDatabase.h"
#import <sqlite3.h>

@implementation SQLiteDatabase

- (id)init
{
    if (self = [super init]) {
        
        NSString *CaminhoBD = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MeuBancoDeDados.db"];
        
        sqlite3 *dbConnection;
        if (sqlite3_open([CaminhoBD UTF8String], &dbConnection) != SQLITE_OK) {
            
            NSLog(@"[SQLITE] Unable to open database!");
            return nil; // if it fails, return nil obj
        }
        NSLog(@"Database: %@", self);
        database = dbConnection;
    }
    
    
    
    return self;
}

- (NSArray *)performQuery:(NSString *)query{

    sqlite3_stmt *statement = nil;
    const char *sql = [query UTF8String];
    if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) != SQLITE_OK) {
        NSLog(@"[SQLITE] Error when preparing query!");
    } else {
        NSMutableArray *result = [NSMutableArray array];
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSMutableArray *row = [NSMutableArray array];
            for (int i=0; i<sqlite3_column_count(statement); i++) {
                int colType = sqlite3_column_type(statement, i);
                id value;
                if (colType == SQLITE_TEXT) {
                    const unsigned char *col = sqlite3_column_text(statement, i);
                    value = [NSString stringWithFormat:@"%s", col];
                } else if (colType == SQLITE_INTEGER) {
                    int col = sqlite3_column_int(statement, i);
                    value = [NSNumber numberWithInt:col];
                } else if (colType == SQLITE_FLOAT) {
                    double col = sqlite3_column_double(statement, i);
                    value = [NSNumber numberWithDouble:col];
                } else if (colType == SQLITE_NULL) {
                    value = [NSNull null];
                } else {
                    NSLog(@"[SQLITE] UNKNOWN DATATYPE");
                }
                
                [row addObject:value];
            }
            [result addObject:row];
        }
        return result;
    }
    return nil;
}


@end
