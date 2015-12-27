//
//  CustomUICollectionViewFlowLayout.m
//  PopTestApp
//
//  Created by J006 on 15/12/20.
//  Copyright © 2015年 j006. All rights reserved.
//

#import "CustomUICollectionViewFlowLayout.h"
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width  [UIScreen mainScreen].bounds.size.width
@interface CustomUICollectionViewFlowLayout()

@property (readwrite,  nonatomic)  CollectionViewType  theMainType;

@end

@implementation CustomUICollectionViewFlowLayout


- (instancetype)initWithCollectionViewType  :(CollectionViewType)type
{
  self  = [super  init];
  if (self)
  {
    _theMainType  = type;
  }
  return self;
}


- (void)prepareLayout
{
  [super prepareLayout];
  self.scrollDirection =   UICollectionViewScrollDirectionHorizontal;
  self.minimumInteritemSpacing    =   0;
  self.minimumLineSpacing =   0;
  self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 4);
  CGFloat height = CGRectGetHeight(self.collectionView.bounds);
  CGFloat width = CGRectGetWidth(self.collectionView.bounds);
  if(_theMainType ==  defaultSize)
  {
    self.itemSize = CGSizeMake([self collectionView].frame.size.height/2, [self collectionView].frame.size.height);
  }
  else  if(_theMainType ==  maxSize)
  {
    self.itemSize = CGSizeMake((width/(kScreen_Height-64))*height, height);
  }
  else  if(_theMainType  ==  miniSize)
  {
    self.itemSize = CGSizeMake(height/2, height-50);
  }
    _cellCount = [[self collectionView] numberOfSections];
}

@end
