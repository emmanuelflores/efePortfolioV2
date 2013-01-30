//
//  PortifolioCell.m
//  efePortfolio
//
//  Created by Casper Schipper on 29-01-13.
//
//

#import "PortifolioCell.h"
#import "PortifolioCellView.h"

#define kTableImageMargin 56

@implementation PortifolioCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.backgroundView = [[PortifolioCellView alloc]init];
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
    self.imageView.frame = CGRectMake(kTableImageMargin,kTableImageMargin,256 - (kTableImageMargin*2), 256 - (kTableImageMargin*2));
}

@end
