//
//  XMGTopicModel.h
//  XMGProject
//
//  Created by SunSi on 16/5/8.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGTopicModel : NSObject
/** 名称  */
@property (copy,nonatomic) NSString *name;

/** 头像  */
@property (copy,nonatomic) NSString *profile_image;
/** 发帖时间  */
@property (copy,nonatomic) NSString *created_at;

/** 文字内容  */
@property (copy,nonatomic) NSString *text;

/** 顶的数量  */
@property (assign,nonatomic) NSInteger ding;
/** 踩的数量  */
@property (assign,nonatomic) NSInteger cai;

/** 转发的数量  */
@property (assign,nonatomic) NSInteger repost;

/** 评论数量  */
@property (assign,nonatomic) NSInteger comment;

/** 评论数量  */
@property (assign,nonatomic,getter=isSina_v) BOOL  sina_v;
@end
