//
//  CustomUICollectionViewFlowLayout.h
//  PopTestApp
//
//  Created by J006 on 15/12/20.
//  Copyright © 2015年 j006. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UICollectionViewCellWidth   250
#define UICollectionViewCellHeight  500
typedef NS_ENUM(NSInteger, CollectionViewType)
{
  defaultSize                           = 1,//原始大小
  maxSize                               = 2,//放大的大小
  miniSize                              = 3,//缩回原来的大小
};

@interface CustomUICollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSInteger cellCount;

/**
 *  @author J.006, 15-12-25 14:12:05
 *
 *  初始化Layout
 *
 *  @param type 类型,是原始大小还是放大后的大小
 *
 *  @return 
 */
- (instancetype)initWithCollectionViewType  :(CollectionViewType)type;

@end
