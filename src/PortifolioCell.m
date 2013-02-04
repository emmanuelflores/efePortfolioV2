//
//  PortifolioCell.m
//  efePortfolio
//
//  Created by Casper Schipper on 29-01-13.
//
//

#import "PortifolioCell.h"
#import "PortifolioCellView.h"

#define kTableWidth 256
#define kTableImageMargin 56

@implementation PortifolioCell

@synthesize tableIndex;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        PortifolioCellView * myCustomView = [[PortifolioCellView alloc]init];
        myCustomView.tableIndex = tableIndex;
        self.backgroundView = myCustomView;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(kTableImageMargin,kTableImageMargin,kTableWidth - (kTableImageMargin*2), kTableWidth - (kTableImageMargin*2));
}

@end
