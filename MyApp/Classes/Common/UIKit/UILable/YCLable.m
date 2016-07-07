//
//  YCLable.m
//  MyApp
//
//  Created by 尹成 on 16/7/7.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "YCLable.h"

@implementation YCLable

//为了能接收到事件（能成为第一响应者)
- (BOOL)canBecomeFirstResponder{
    return YES;
}

// 可以响应的方法
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    return (action == @selector(copy:));
}

//针对于响应方法的实现
- (void)copy:(id)sender{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

//UILabel默认是不接收事件的，我们需要自己添加touch事件
- (void)attachTapHandler{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    touch.numberOfTapsRequired = 2;
    [self addGestureRecognizer:touch];
}

-(void)handleTap:(UIGestureRecognizer*) recognizer
{
    [self becomeFirstResponder];
//    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制"
//                                                      action:@selector(copy:)];
//    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
}  


//绑定事件
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self attachTapHandler];
    }
    return self;
}
//同上
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}

@end
