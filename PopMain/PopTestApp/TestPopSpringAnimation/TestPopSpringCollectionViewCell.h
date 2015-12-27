//
//  TestPopSpringCollectionViewCell.h
//  PopTestApp
//
//  Created by J006 on 15/12/20.
//  Copyright © 2015年 j006. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TestPopSpringCollectionViewCellReg  @"TestPopSpringCollectionViewCell"
@protocol TestPopSpringCollectionViewCellDelegate <NSObject>

@optional

/**
 *  @author J.006, 15-12-22 11:12:21
 *
 *  上划放大整个Collection
 *
 *  @param cell
 */
- (void)swipTheViewToTopWithCell  :(UICollectionViewCell*)cell;

/**
 *  @author J.006, 15-12-22 11:12:38
 *
 *  下滑缩小整个Collection
 *
 *  @param cell
 */
- (void)swipTheViewToBottomWithCell  :(UICollectionViewCell*)cell;
@end


@interface TestPopSpringCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id<TestPopSpringCollectionViewCellDelegate>               delegate;

@end
