//
//  CasperStore.m
//  efePortfolio
//
//  Created by Casper Schipper on 25-01-13.
//
//

#import "CasperStore.h"
#import "CasperTestDataClass.h"

@implementation CasperStore

+ (CasperStore *)defaultStore
{
    static CasperStore *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
    
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id) initWithRandomObjects:(int)numberOfObjects {
    self = [super init];
    if (self) {
        NSArray * names = [[NSArray alloc] initWithObjects:@"Casper",@"Cassie",@"Castro",@"Cassius", nil];
        for (int i = 0; i < numberOfObjects; i++ ) {
            CasperTestDataClass * myCasper = [[CasperTestDataClass alloc] init];
            int someRandIndex = rand() % [names count];
            myCasper.myString = names[someRandIndex];
        }
    }
    return self;
}

@end
