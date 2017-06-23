//
//  HMStatusFrame.h
//  05-新浪微博
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HMStatus;

/** 专门计算所有控件位置 */
@interface HMStatusFrame : NSObject
/* 头像尺寸位置**/
@property (nonatomic, assign, readonly) CGRect iconF;
/* 名字尺寸位置**/
@property (nonatomic, assign, readonly) CGRect nameF;
/* 级别尺寸位置**/
@property (nonatomic, assign, readonly) CGRect vipF;
/* 文本尺寸位置**/
@property (nonatomic, assign, readonly) CGRect textF;
/* 图片尺寸位置**/
@property (nonatomic, assign, readonly) CGRect pictureF;

/** 行高 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

/** 所有控件的尺寸都可以通过Status模型来计算得出 */
@property (nonatomic, strong) HMStatus *status;

/** 所有的statusFrame数据数组 */
+ (NSArray *)statusFrames;

@end
