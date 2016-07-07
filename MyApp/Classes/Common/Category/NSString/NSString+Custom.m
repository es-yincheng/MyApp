//
//  NSString+Custom.m
//  IBZApp
//
//  Created by 尹成 on 16/6/21.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import "NSString+Custom.h"

@implementation NSString (Custom)

- (BOOL)isUrlString{
    if (![self getUrlString]) {
        NSLog(@"无网址");
        return NO;
    }
    
    if ([[self getUrlString] isEqualToString:self]) {
        NSLog(@"单一地址");
        return YES;
    }
    NSLog(@"包含地址的文本");
    return NO;
}

- (BOOL)hasUrlString{
    if (![self getUrlString]) {
        NSLog(@"无网址");
        return NO;
    }
    
    if ([[self getUrlString] isEqualToString:self]) {
        NSLog(@"单一地址");
        return NO;
    }
    NSLog(@"包含地址的文本");
    return YES;
}

- (NSString *)getUrlString{
    
    NSString *pattern = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSError *error = nil;
    /*
     typedef NS_OPTIONS(NSUInteger, NSRegularExpressionOptions) {
     NSRegularExpressionCaseInsensitive             = 1 << 0, //不区分字母大小写的模式
     NSRegularExpressionAllowCommentsAndWhitespace  = 1 << 1, //忽略掉正则表达式中的空格和#号之后的字符
     NSRegularExpressionIgnoreMetacharacters        = 1 << 2, //将正则表达式整体作为字符串处理
     NSRegularExpressionDotMatchesLineSeparators    = 1 << 3, //允许.匹配任何字符，包括换行符
     NSRegularExpressionAnchorsMatchLines           = 1 << 4, //允许^和$符号匹配行的开头和结尾
     NSRegularExpressionUseUnixLineSeparators       = 1 << 5, //设置\n为唯一的行分隔符，否则所有的都有效。
     NSRegularExpressionUseUnicodeWordBoundaries    = 1 << 6 //使用Unicode TR#29标准作为词的边界，否则所有传统正则表达式的词边界都有效
     };
     */
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray<NSTextCheckingResult *> *result = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if (result) {
        for (int i = 0; i<result.count; i++) {
            NSTextCheckingResult *res = result[i];
            NSLog(@"str == %@", [self substringWithRange:res.range]);
            if ([self substringWithRange:res.range]) {
                return [self substringWithRange:res.range];
            }
        }
        return nil;
    }else{
        NSLog(@"error == %@",error.description);
        return nil;
    }
}

- (NSString *)getTimeFromIBZService{
    NSString *time = [self substringWithRange:NSMakeRange(6, 10)];
    return [time getTimeForm1970];
}

- (NSString *)getTimeForm1970{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

- (NSString *)getTimeFromNow{
    
    NSString *time = [self substringWithRange:NSMakeRange(6, 10)];
    NSTimeInterval late = [time longLongValue];
    
    
    NSDate* dat = [NSDate date];
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    NSString *timeString = @"";
    
    NSTimeInterval cha = now - late;
    
    if (cha/3600 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@分前", timeString];
        
    }
    if (cha/3600 > 1 && cha/86400 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    if (cha/86400 > 1 && cha/(86400*30) < 1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }
    if (cha/(86400*30) > 1)
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:@"YYYY/MM/dd"];
        
        NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[time longLongValue]];
        timeString = [formatter stringFromDate:confromTimesp];
    }
    return timeString;
}

@end
