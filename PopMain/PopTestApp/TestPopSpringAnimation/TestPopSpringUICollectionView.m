//
//  TestPopSpringUICollectionView.m
//  PopTestApp
//
//  Created by J006 on 15/12/20.
//  Copyright © 2015年 j006. All rights reserved.
//

#import "TestPopSpringUICollectionView.h"
#import "TestPopSpringCollectionViewCell.h"
#import "CustomUICollectionViewFlowLayout.h"
#import <POP.h>
#import <TLTransitionLayout.h>

#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width  [UIScreen mainScreen].bounds.size.width

@interface TestPopSpringUICollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,TestPopSpringCollectionViewCellDelegate>

@property (strong,  nonatomic)  UICollectionView                  *mainCollectionView;
@property (strong,  nonatomic)  CustomUICollectionViewFlowLayout  *customFlowLayout;
@property (strong,  nonatomic)  NSMutableArray                    *contentArray;

@end

@implementation TestPopSpringUICollectionView

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];
  self.automaticallyAdjustsScrollViewInsets = NO;
  [self initTheCollectionView];

  [self.view addSubview:self.mainCollectionView];
  [_mainCollectionView setFrame:CGRectMake(0, kScreen_Height-UICollectionViewCellHeight, self.view.frame.size.width, UICollectionViewCellHeight)];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma init
- (void)initTheCollectionView
{
  self.contentArray = [[NSMutableArray alloc]init];
  for (NSInteger i =0; i<10; i++)
    [_contentArray addObject:@"a"];
}

#pragma UICollectionDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return 1;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  NSInteger   sections    =   0;
  if(_contentArray)
    sections =   [_contentArray count];
  return sections;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  TestPopSpringCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TestPopSpringCollectionViewCellReg forIndexPath:indexPath];
  cell.delegate = self;
  return cell;
}

#pragma TestPopSpringUICollectionViewDelegate
- (void)swipTheViewToTopWithCell  :(UICollectionViewCell*)cell
{
  
  POPBasicAnimation *popBasicAnimation  = [POPBasicAnimation  animationWithPropertyNamed:kPOPViewFrame];
  CGFloat height = CGRectGetHeight(self.view.bounds);
  CGFloat width = CGRectGetWidth(self.view.bounds);
  popBasicAnimation.toValue  = [NSValue  valueWithCGRect:CGRectMake(0, 64, width, height)];
  
  [popBasicAnimation setAnimationDidApplyBlock:^(POPAnimation *anmia) {
    CustomUICollectionViewFlowLayout  *newLayout  = [[CustomUICollectionViewFlowLayout alloc]initWithCollectionViewType:maxSize];
     [newLayout  invalidateLayout];
     [self.mainCollectionView  setCollectionViewLayout:newLayout];
  }];
  [popBasicAnimation setDuration:1.0];
  [_mainCollectionView pop_addAnimation:popBasicAnimation forKey:@"collectionViewSizeToMax"];
  
  /*
   CustomUICollectionViewFlowLayout  *newLayout  = [[CustomUICollectionViewFlowLayout alloc]initWithCollectionViewType:maxSize];
   
   UICollectionViewTransitionLayout  *transLayout  = [self.mainCollectionView startInteractiveTransitionToCollectionViewLayout:newLayout completion:nil];
   POPBasicAnimation *layoutAnimation  = [POPBasicAnimation  animation];
   POPAnimatableProperty *property = [POPAnimatableProperty propertyWithName:@"com.photos.transition" initializer:^(POPMutableAnimatableProperty *prop) {
   prop.readBlock = ^(id obj, CGFloat values[]) {
   values[0] = [obj transitionProgress];
   };
   prop.writeBlock = ^(id obj, const CGFloat values[]) {
   [obj setTransitionProgress:values[0]];
   };
   prop.threshold = 0.01;
   }];
   layoutAnimation.property = property;
   layoutAnimation.fromValue = @(transLayout.transitionProgress);
   layoutAnimation.toValue = @(1.0);
   layoutAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished){
   if (finished) {
   [transLayout setTransitionProgress:1];
   [self.mainCollectionView finishInteractiveTransition];
   }
   };
   [transLayout pop_addAnimation:layoutAnimation forKey:NSStringFromSelector(@selector(transitionProgress))];
   */
  
}

/**
 *  @author J.006, 16-12-27 16:12:36
 *
 *  在缩小时必须itemsize小于UICollectionViewSize
 *
 *  @param cell
 */
- (void)swipTheViewToBottomWithCell  :(UICollectionViewCell*)cell
{
  POPBasicAnimation *popBasicAnimation  = [POPBasicAnimation  animationWithPropertyNamed:kPOPViewFrame];
  popBasicAnimation.toValue  = [NSValue  valueWithCGRect:CGRectMake(0, kScreen_Height-UICollectionViewCellHeight, self.view.frame.size.width, UICollectionViewCellHeight)];
  [popBasicAnimation setAnimationDidApplyBlock:^(POPAnimation *anmia) {
    CustomUICollectionViewFlowLayout  *newLayout  = [[CustomUICollectionViewFlowLayout alloc]initWithCollectionViewType:miniSize];
    [newLayout invalidateLayout];
    [self.mainCollectionView  setCollectionViewLayout:newLayout];
  }];
  
  [popBasicAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
    CustomUICollectionViewFlowLayout  *newLayout  = [[CustomUICollectionViewFlowLayout alloc]initWithCollectionViewType:defaultSize];
    [newLayout invalidateLayout];
    [self.mainCollectionView  setCollectionViewLayout:newLayout];
  }];
  [popBasicAnimation setDuration:1.0];
  [_mainCollectionView pop_addAnimation:popBasicAnimation forKey:@"collectionViewSizeToMin"];
  
  
  /*
  UICollectionViewTransitionLayout  *transLayout  = [self.mainCollectionView startInteractiveTransitionToCollectionViewLayout:self.customFlowLayout completion:nil];
  POPBasicAnimation *layoutAnimation  = [POPBasicAnimation  animation];
  POPAnimatableProperty *property = [POPAnimatableProperty propertyWithName:@"com.photos.transition" initializer:^(POPMutableAnimatableProperty *prop) {
    prop.readBlock = ^(id obj, CGFloat values[]) {
      values[0] = [obj transitionProgress];
    };
    prop.writeBlock = ^(id obj, const CGFloat values[]) {
      [obj setTransitionProgress:values[0]];
    };
    prop.threshold = 0.01;
  }];
  layoutAnimation.property = property;
  layoutAnimation.fromValue = @(transLayout.transitionProgress);
  layoutAnimation.toValue = @(1.0);
  layoutAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished){
    if (finished) {
      [transLayout setTransitionProgress:1];
      [self.mainCollectionView finishInteractiveTransition];
    }
  };
  [transLayout pop_addAnimation:layoutAnimation forKey:NSStringFromSelector(@selector(transitionProgress))];
  */
}

#pragma getter setter
- (UICollectionView*)mainCollectionView
{
  if(!_mainCollectionView)
  {
    _mainCollectionView =   [[UICollectionView   alloc]initWithFrame:self.view.bounds collectionViewLayout:self.customFlowLayout];
    [_mainCollectionView    setBackgroundColor:[UIColor blackColor]];
    //_mainCollectionView.contentSize     =   CGSizeMake(UICollectionViewCellWidth*10, 0);
    _mainCollectionView.delegate        =   self;
    _mainCollectionView.dataSource      =   self;
    _mainCollectionView.pagingEnabled   =   NO;
    [_mainCollectionView registerClass:[TestPopSpringCollectionViewCell class] forCellWithReuseIdentifier:TestPopSpringCollectionViewCellReg];
    _mainCollectionView.alwaysBounceHorizontal =   YES;
  }
  return _mainCollectionView;
}

- (CustomUICollectionViewFlowLayout*)customFlowLayout
{
  if(!_customFlowLayout)
  {
    _customFlowLayout = [[CustomUICollectionViewFlowLayout alloc]initWithCollectionViewType:defaultSize];
    [_customFlowLayout invalidateLayout];
  }
  return _customFlowLayout;
}

@end
