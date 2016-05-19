//
//  XMGTopicCellTexture.h
//  XMGProject
//
//  Created by SunSi on 16/5/19.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGTopicModel;
@interface XMGTopicCellTexture : UIView
/** model值  */
@property (strong,nonatomic) XMGTopicModel *topicModel;

+(instancetype)instanceTopicTexture;

@end
