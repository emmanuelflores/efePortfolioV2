//
//  PortifolioCellView.m
//  efePortfolio
//
//  Created by Casper Schipper on 30-01-13.
//
//

#import "PortifolioCellView.h"

#define kTableWidth 256

@implementation PortifolioCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:( (rand() % 512) / 1024.0 ) + 0.5 alpha:1.0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSetShadowWithColor(currentContext,
                                CGSizeMake(1.0f, 1.0f),
                                5.0f,
                                [[UIColor colorWithWhite:0.1 alpha:1.0] CGColor]);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect firstRect = CGRectMake(5.0f, 5.0f,kTableWidth-10,kTableWidth-10);
    CGPathAddRect(path,NULL, firstRect);
    
    [[UIColor colorWithWhite:0.5 alpha:1.0] setStroke];
    CGContextSetLineWidth(currentContext,1.0f);
    
    CGContextAddPath(currentContext,path);
    
    [[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f] setFill];
    
    CGContextDrawPath(currentContext,kCGPathFillStroke);
    
    CGPathRelease(path);
}

@end
