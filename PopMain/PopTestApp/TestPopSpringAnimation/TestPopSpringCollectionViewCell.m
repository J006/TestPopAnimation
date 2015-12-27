//
//  TestPopSpringCollectionViewCell.m
//  PopTestApp
//
//  Created by J006 on 15/12/20.
//  Copyright © 2015年 j006. All rights reserved.
//

#import "TestPopSpringCollectionViewCell.h"
#import <Masonry.h>
@interface TestPopSpringCollectionViewCell ()

@property (strong ,nonatomic) UIImageView                 *imageView;
@property (strong ,nonatomic) UILabel                     *contentLabel;
@property (strong ,nonatomic) UISwipeGestureRecognizer    *swipGestureToTop;
@property (strong ,nonatomic) UISwipeGestureRecognizer    *swipGestureToBottom;

@end
@implementation TestPopSpringCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self)
  {
    [self  addSubview:self.imageView];
    [self  addSubview:self.contentLabel];
    [self  setBackgroundColor:[UIColor redColor]];
  }
  return self;
}

- (void)layoutSubviews
{
  [super  layoutSubviews];
  [self layTheFrame];
}

- (void)layTheFrame
{
  [self  addGestureRecognizer:self.swipGestureToTop];
  [self  addGestureRecognizer:self.swipGestureToBottom];
  [self.imageView  mas_remakeConstraints:^(MASConstraintMaker *make) {
    make.center.equalTo(self);
    make.width.mas_equalTo(2*self.frame.size.width/3);
    make.height.mas_equalTo(2*self.frame.size.width/3);
  }];
  [self doCircleFrameWithUIImageView:self.imageView  withWidth:2*self.frame.size.width/3];
  UIImage *image  = [UIImage  imageNamed:@"ceshibg.jpg"];
  [_imageView  setImage:image];
  [_imageView  setContentMode:UIViewContentModeScaleToFill];
  
  [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.imageView);
    make.top.equalTo(self.imageView.mas_bottom).offset(10);
  }];
  [self.contentLabel sizeToFit];

}

- (void)doCircleFrameWithUIImageView:(UIImageView*)imageView  withWidth:(CGFloat)width
{
  imageView.layer.masksToBounds = YES;
  imageView.layer.cornerRadius = width/2;
  imageView.layer.borderWidth = 0.5;
  imageView.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)swipGestureFromBottomToTopEvent:(UISwipeGestureRecognizer*)swip
{
  [self.delegate swipTheViewToTopWithCell:self];
}

- (void)swipGestureFromTopToBottomEvent:(UISwipeGestureRecognizer*)swip
{
  [self.delegate  swipTheViewToBottomWithCell:self];
}


#pragma getter setter
- (UIImageView*)imageView
{
  if(!_imageView)
  {
    _imageView  = [[UIImageView  alloc]init];
    [_imageView  setBackgroundColor:[UIColor whiteColor]];
  }
  return _imageView;
}

- (UILabel*)contentLabel
{
  if(!_contentLabel)
  {
    _contentLabel = [[UILabel  alloc]init];
    [_contentLabel setFont:[UIFont systemFontOfSize:12]];
    [_contentLabel setBackgroundColor:[UIColor whiteColor]];
    [_contentLabel setTextColor:[UIColor blackColor]];
    [_contentLabel setText:@"测试测试"];
  }
  return _contentLabel;
}

-   (UISwipeGestureRecognizer*)swipGestureToTop
{
  if(!_swipGestureToTop)
  {
    _swipGestureToTop =   [[UISwipeGestureRecognizer   alloc]init];
    _swipGestureToTop.direction   =   UISwipeGestureRecognizerDirectionUp;
    [_swipGestureToTop addTarget:self action:@selector(swipGestureFromBottomToTopEvent:)];
  }
  return _swipGestureToTop;
}

-   (UISwipeGestureRecognizer*)swipGestureToBottom
{
  if(!_swipGestureToBottom)
  {
    _swipGestureToBottom =   [[UISwipeGestureRecognizer   alloc]init];
    _swipGestureToBottom.direction   =   UISwipeGestureRecognizerDirectionDown;
    [_swipGestureToBottom addTarget:self action:@selector(swipGestureFromTopToBottomEvent:)];
  }
  return _swipGestureToBottom;
}

@end
