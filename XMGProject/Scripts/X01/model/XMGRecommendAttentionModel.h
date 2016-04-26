//
//  XMGRecommendAttentionModel.h
//  XMGProject
//
//  Created by scuplt on 16/4/23.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGRecommendAttentionModel : NSObject

/** 名字 */
@property (nonatomic,copy) NSString *theme_name;

/** 头像地址 */
@property (nonatomic,copy) NSString *image_list;


/** 粉丝 */
@property (nonatomic,assign) NSInteger sub_number;

//"theme_name": "生活百科",
//"image_list": "http:%/%/img.spriteapp.cn%/ugc%/2015%/04%/23%/160559_24190.jpg",
//"sub_number": "36824",



@end
