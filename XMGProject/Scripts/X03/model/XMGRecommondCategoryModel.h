//
//  XMGRecommondCategoryModel.h
//  XMGProject
//
//  Created by scuplt on 16/4/20.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGRecommondCategoryModel : NSObject

//id : 16,
//name : 原创,
//count : 170

/** 名字 */
@property (nonatomic,copy) NSString *name;

/** id */
@property (nonatomic,assign) NSInteger id;

/** 总数 */
@property (nonatomic,assign) NSInteger count;

/** user分类下的内容 */
@property (nonatomic,strong) NSMutableArray *userArrCategory;

/** 总条数 */
@property (nonatomic,assign) NSInteger total;

/** 当前页码 */
@property (nonatomic,assign) NSInteger currentPage;

/** 总页数 没多大鸟用 */
//@property (nonatomic,assign) NSInteger total_page;


@end
