//
//  TestPopSpringSIzeToMaxVC.m
//  PopTestApp
//
//  Created by J006 on 15/12/18.
//  Copyright © 2015年 j006. All rights reserved.
//

#import "TestPopSpringSIzeToMaxVC.h"
#import "POP.h"
@interface TestPopSpringSIzeToMaxVC ()

@property (strong ,nonatomic) UIView    *testRedBlockView;

@end

@implementation TestPopSpringSIzeToMaxVC

- (void)viewDidLoad {
    [super viewDidLoad];
  [self.view  setBackgroundColor:[UIColor whiteColor]];
  self.title  = @"TestPopSpringAnimation";
  UIBarButtonItem *rightBarSizeToMaxItem = [[UIBarButtonItem alloc] initWithTitle:@"Max" style:UIBarButtonItemStylePlain target:self action:@selector(maxSizePopSpringAnimation)];
  UIBarButtonItem *rightBarSizeToMinItem = [[UIBarButtonItem alloc] initWithTitle:@"Min" style:UIBarButtonItemStylePlain target:self action:@selector(minSizePopSpringAnimation)];
  NSArray<UIBarButtonItem*> *bardArray  = @[rightBarSizeToMaxItem,rightBarSizeToMinItem];
  self.navigationItem.rightBarButtonItems = bardArray;
  [self.view    addSubview:self.testRedBlockView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma private pop animation
- (void)maxSizePopSpringAnimation
{
  POPSpringAnimation  *popSpringAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
  NSInteger height = CGRectGetHeight(self.view.bounds);
  NSInteger width = CGRectGetWidth(self.view.bounds);
  popSpringAnimation.toValue  = [NSValue  valueWithCGRect:CGRectMake(0, 64, width, height-64)];
  popSpringAnimation.springBounciness = 4;
  popSpringAnimation.springSpeed  = 1;
  popSpringAnimation.animationDidStartBlock = ^(POPAnimation *anim)
  {
  };
  popSpringAnimation.animationDidReachToValueBlock  = ^(POPAnimation *anim)
  {
  };
  popSpringAnimation.animationDidApplyBlock = ^(POPAnimation *anim)
  {
  };
  
  popSpringAnimation.completionBlock  = ^(POPAnimation *anim, BOOL finished)
  {
  };
  [_testRedBlockView pop_addAnimation:popSpringAnimation forKey:@"sizeToMax"];
}

- (void)minSizePopSpringAnimation
{
  POPSpringAnimation  *popSpringAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
  NSInteger height = 50;
  NSInteger width = 50;
  popSpringAnimation.toValue  = [NSValue  valueWithCGRect:CGRectMake(self.view.center.x-25, self.view.center.y-25, width, height)];
  popSpringAnimation.springBounciness = 4;
  popSpringAnimation.springSpeed  = 1;
  popSpringAnimation.animationDidStartBlock = ^(POPAnimation *anim)
  {
  };
  popSpringAnimation.animationDidReachToValueBlock  = ^(POPAnimation *anim)
  {
  };
  popSpringAnimation.animationDidApplyBlock = ^(POPAnimation *anim)
  {
  };
  
  popSpringAnimation.completionBlock  = ^(POPAnimation *anim, BOOL finished)
  {
  };
  [_testRedBlockView pop_addAnimation:popSpringAnimation forKey:@"sizeToMin"];
}

- (void)maxSizeBasicPopAnimation
{
  POPBasicAnimation *popBasicAnimation  = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
  NSInteger height = CGRectGetHeight(self.view.bounds);
  NSInteger width = CGRectGetWidth(self.view.bounds);
  popBasicAnimation.toValue  = [NSValue  valueWithCGRect:CGRectMake(0, 64, width, height-64)];
  [_testRedBlockView pop_addAnimation:popBasicAnimation forKey:@"basicSizeToMax"];
}

- (void)minSizeBasicPopAnimation
{
  POPBasicAnimation *popBasicAnimation  = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
  NSInteger height = 50;
  NSInteger width = 50;
  popBasicAnimation.toValue  = [NSValue  valueWithCGRect:CGRectMake(self.view.center.x-25, self.view.center.y-25, width, height)];
  [_testRedBlockView pop_addAnimation:popBasicAnimation forKey:@"basicSizeToMax"];
}


#pragma getter setter
- (UIView*)testRedBlockView
{
  if(!_testRedBlockView)
  {
    _testRedBlockView = [[UIView alloc]init];
    _testRedBlockView.center  = self.view.center;
    [_testRedBlockView setBackgroundColor:[UIColor  redColor]];
    CGRect frame  = _testRedBlockView.frame;
    frame.size    = CGSizeMake(50, 50);
    _testRedBlockView.frame = frame;
  }
  return _testRedBlockView;
}

@end
