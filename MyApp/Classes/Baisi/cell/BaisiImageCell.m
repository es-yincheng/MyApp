//
//  BaisiImageCell.m
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaisiImageCell.h"

@interface BaisiImageCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet UIImageView *autorIcon;
@property (weak, nonatomic) IBOutlet UILabel *autorName;
@property (weak, nonatomic) IBOutlet UILabel *lastTime;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UIView *zuizanView;
@property (weak, nonatomic) IBOutlet UILabel *zuizanText;
@property (weak, nonatomic) IBOutlet UILabel *tag1;

@end

@implementation BaisiImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configWithModel:(BaisiModel *)model{
    
    NSLog(@"model :%ld  %ld ",(long)model.width, (long)model.height);
    
    if (!model) {
        return;
    }
    
    _imageHeight.constant = (model.height * ScreenWith/model.width > 400) ? 400 : model.height * ScreenWith/model.width;
    [_autorIcon sd_setImageWithURL:[NSURL URLWithString:[model.u.header yc_objectAtIndex:0]] placeholderImage:nil];
    _autorName.text = model.u.name;
    _lastTime.text = model.passtime;
    _text.text = model.text;
    _itemImage.contentMode = UIViewContentModeScaleAspectFill;
    _itemImage.clipsToBounds = YES;
    [_itemImage sd_setImageWithURL:[NSURL URLWithString:model.medium] placeholderImage:nil];
}

@end
