//
//  TestObjects.h
//  efePortfolio
//
//  Created by Casper Schipper on 25-01-13.
//
//

#import <Foundation/Foundation.h>

@interface TestObjects : NSObject{
    
}

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *surname;
@property (nonatomic) int heigth;
@property (nonatomic,retain) UIImage * image;

@end
