//
//  TestObjectStore.m
//  efePortfolio
//
//  Created by Casper Schipper on 01-02-13.
//
//

#import "TestObjectStore.h"


@implementation TestObjectStore

@synthesize allItems;

+ (TestObjectStore *)defaultStore
{
    static TestObjectStore *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
    
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (NSMutableArray *)allItemsFromRow:(int)rowNumber {
    NSMutableArray * items = [[NSMutableArray alloc]init];
    for (int i = 0; i < [[self allItems] count]; i++) {
        if ([[allItems objectAtIndex:i] row] == rowNumber) {
            [items addObject:[allItems objectAtIndex:i]];
        }
    }
    return items;
}

- (id)init
{
    self = [super init];
    if(self) {
        // If the array hadn't been saved previously, create a new empty one
        if(!allItems)
            allItems = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
