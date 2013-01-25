//
//  CasperStore.h
//  efePortfolio
//
//  Created by Casper Schipper on 25-01-13.
//
//

#import <Foundation/Foundation.h>

@interface CasperStore : NSObject {
    NSMutableArray * myCasperObjects;
}

+ (CasperStore *)defaultStore;

- (id) initWithRandomObjects: (int) numberOfObjects;

@end
