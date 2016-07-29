//
//  BaisiCell.m
//  MyApp
//
//  Created by 尹成 on 16/7/29.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaisiCell.h"

@interface BaisiCell()

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *publishTime;
@property (weak, nonatomic) IBOutlet UILabel *baisiText;
@property (weak, nonatomic) IBOutlet UIImageView *baisiImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewConstraint;
/**
 *  userName,CommentText
 */
@property (weak, nonatomic) IBOutlet UILabel *commentInfo;
@property (weak, nonatomic) IBOutlet UILabel *baisiTags;
@property (weak, nonatomic) IBOutlet UIButton *baisiZanButton;
@property (weak, nonatomic) IBOutlet UIButton *baisicaiButton;
@property (weak, nonatomic) IBOutlet UIButton *baisiShareButton;
@property (weak, nonatomic) IBOutlet UIButton *baisiCommentButton;

@end

@implementation BaisiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _userIcon.layer.masksToBounds = YES;
    _userIcon.layer.cornerRadius = 15;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configWithModel:(BaisiModel *)model{
    [_userIcon sd_setImageWithURL:[NSURL URLWithString:model.userIcon] placeholderImage:nil];
    _userName.text = model.userName;
    _publishTime.text = model.publishTime;
    _baisiText.text = model.baisiText;
    [_baisiImage sd_setImageWithURL:[NSURL URLWithString:model.baisiImageSmal] placeholderImage:nil];
    if (model.imageHeight < 5) {
        _imageHeight.constant = 0.f;
    } else {
        _imageHeight.constant = (model.imageHeight * (ScreenWith-16)/model.imageWidth > 400) ? 300 : model.imageHeight * (ScreenWith-16)/model.imageWidth;
    }
    if (model.commentText.length < 3) {
        _commentViewConstraint.priority = UILayoutPriorityDefaultHigh + 100;
    } else {
        _commentViewConstraint.priority = UILayoutPriorityDefaultHigh - 100;
        _commentInfo.attributedText = model.commentText;
    }
    _baisiTags.text = model.baisiTags;
    [_baisiZanButton setTitle:model.zanCount forState:UIControlStateNormal];
    [_baisicaiButton setTitle:model.caiCount forState:UIControlStateNormal];
    [_baisiShareButton setTitle:model.shareCount forState:UIControlStateNormal];
    [_baisiCommentButton setTitle:model.commentCount forState:UIControlStateNormal];
}

- (IBAction)moreMenuAction:(id)sender {
    
}

- (IBAction)zanAction:(UIButton *)sender {
}

- (IBAction)caiAction:(id)sender {
}

- (IBAction)shareAction:(id)sender {
}

- (IBAction)commentAction:(id)sender {
}


@end
