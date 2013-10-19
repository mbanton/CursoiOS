//
//  SQLiteDatabase.h
//  mSales
//
//  Created by Jorge Luis Beckel Flor on 10/12/13.
//  Copyright (c) 2013 Jorge Flor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLiteDatabase : NSObject {
    sqlite3 *database;
}

- (id)init;
- (NSArray *)performQuery:(NSString *)query;
@end