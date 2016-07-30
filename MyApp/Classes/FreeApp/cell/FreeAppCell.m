//
//  FreeAppCell.m
//  MyApp
//
//  Created by 尹成 on 16/7/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "FreeAppCell.h"

@interface FreeAppCell()

@property (weak, nonatomic) IBOutlet UILabel *orignPrice;
@property (weak, nonatomic) IBOutlet UILabel *nowPrice;

@end

@implementation FreeAppCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:@"1320" attributes:attribtDic];
    _orignPrice.attributedText = attribtStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
