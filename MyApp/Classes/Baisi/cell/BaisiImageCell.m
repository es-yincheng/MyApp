//
//  BaisiImageCell.m
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaisiImageCell.h"
#import "UIImage+GIF.h"

@interface BaisiImageCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet UIImageView        *autorIcon;
@property (weak, nonatomic) IBOutlet UILabel            *autorName;
@property (weak, nonatomic) IBOutlet UILabel            *lastTime;
@property (weak, nonatomic) IBOutlet UILabel            *text;
@property (weak, nonatomic) IBOutlet UIImageView        *itemImage;
@property (weak, nonatomic) IBOutlet UIView             *zuizanView;
@property (weak, nonatomic) IBOutlet UILabel            *zuizanText;
@property (weak, nonatomic) IBOutlet UILabel            *tag1;
@property (weak, nonatomic) IBOutlet UILabel            *zuizanLable;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *zanViewHeight;

@property (weak, nonatomic) IBOutlet UIButton *zanButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *pinglunButton;

@end

@implementation BaisiImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _autorIcon.layer.masksToBounds = YES;
    _autorIcon.layer.cornerRadius = 14;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configWithModel:(BaisiModel *)model{
    
//    NSLog(@"model :%ld  %ld ",(long)model.width, (long)model.height);
//    
//    if (!model) {
//        return;
//    }
//    
//    _imageHeight.constant = (model.height * (ScreenWith-16)/model.width > 400) ? 300 : model.height * (ScreenWith-16)/model.width;
//    [_autorIcon sd_setImageWithURL:[NSURL URLWithString:[model.u.header yc_objectAtIndex:0]] placeholderImage:nil];
//    _autorName.text = model.u.name;
//    _lastTime.text = model.passtime;
//    _text.text = model.text;
//    _itemImage.contentMode = UIViewContentModeScaleAspectFill;
//    _itemImage.clipsToBounds = YES;
//    [_itemImage sd_setImageWithURL:[NSURL URLWithString:model.medium] placeholderImage:nil];    
//    if (model.zanName) {
//        _zuizanText.text = [NSString stringWithFormat:@"%@ :%@",model.zanName,model.zanText];
//    } else {
//        _zanViewHeight.constant = 0.f;
//    }
//    [_zanButton setTitle:[NSString stringWithFormat:@" %@",model.up] forState:UIControlStateNormal];
//    [_caiButton setTitle:[NSString stringWithFormat:@" %@",model.down] forState:UIControlStateNormal];
//    [_shareButton setTitle:[NSString stringWithFormat:@" %@",model.bookmark] forState:UIControlStateNormal];
//    [_pinglunButton setTitle:[NSString stringWithFormat:@" %@",model.comment] forState:UIControlStateNormal];
//    
//    if (model.tags) {
//        NSString *temp = @"";
//        for (NSDictionary *dict in model.tags) {
//            temp = [NSString stringWithFormat:@"%@  %@",temp,dict[@"name"]];
////            [temp stringByAppendingFormat:@"%@",[dict yc_objectForKey:@"name"]];
//        }
//        _tag1.text = temp;
//    }
}

@end
