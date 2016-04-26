//
//  XMGRecommondCategoryModel.m
//  XMGProject
//
//  Created by scuplt on 16/4/20.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGRecommondCategoryModel.h"

@implementation XMGRecommondCategoryModel

/** 懒加载 */
-(NSMutableArray *)userArrCategory{
    if(!_userArrCategory){
        _userArrCategory=[NSMutableArray array];
    }
    return _userArrCategory;
}
@end
