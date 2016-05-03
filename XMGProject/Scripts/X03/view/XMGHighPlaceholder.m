//
//  XMGHighPlacer.m
//  XMGProject
//
//  Created by SunSi on 16/5/3.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGHighPlaceholder.h"

@implementation XMGHighPlaceholder
//这里有 运行时 机制的内容
static NSString * const xmgPlaceHolderColorKeyPath=@"_placeholderLabel.textColor";
//
-(void)awakeFromNib{
    self.tintColor=self.textColor;
    [self resignFirstResponder];
}

-(BOOL)becomeFirstResponder
{
    [self setValue:self.textColor forKeyPath:xmgPlaceHolderColorKeyPath];//吃大亏了,是forkeypath 而不是 forKey
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [self setValue:[UIColor grayColor] forKeyPath:xmgPlaceHolderColorKeyPath];//吃大亏了,是forkeypath 而不是 forKey
    return [super resignFirstResponder];
}
@end
