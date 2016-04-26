//
//  XMGRecommondUserModel.h
//  XMGProject
//
//  Created by scuplt on 16/4/20.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGRecommondUserModel : NSObject
//    header : http://wimg.spriteapp.cn/profile/large/2016/03/09/56dfd36c49c80_mini.jpg,
//    fans_count : 3570,
//    screen_name : 翻唱视频秀

/** 头像 */
@property (nonatomic,copy) NSString *header;
/** 关注人数 */
@property (nonatomic,copy) NSString *fans_count;
/** 名字 */
@property (nonatomic,copy) NSString *screen_name;
@end
