//
//  TestObjectStore.h
//  efePortfolio
//
//  Created by Casper Schipper on 01-02-13.
//
//

#import <Foundation/Foundation.h>

@interface TestObjectStore : NSObject

{

}

@property (nonatomic,retain) NSMutableArray * allItems;

+ (TestObjectStore *)defaultStore;

+ (NSArray *)allItemsFromRow:(int)rowNumber;

@end
