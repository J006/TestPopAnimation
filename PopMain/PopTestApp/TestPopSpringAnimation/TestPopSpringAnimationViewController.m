//
//  TestPopSpringAnimationViewController.m
//  PopTestApp
//
//  Created by J006 on 15/12/18.
//  Copyright © 2015年 j006. All rights reserved.
//

#import "TestPopSpringAnimationViewController.h"
#import "POP.h"
@interface TestPopSpringAnimationViewController ()

@property (strong ,nonatomic) UIView    *testRedBlockView;

@end

@implementation TestPopSpringAnimationViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.view  setBackgroundColor:[UIColor whiteColor]];
  self.title  = @"TestPopSpringAnimation";
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Move" style:UIBarButtonItemStylePlain target:self action:@selector(testPopAnimation)];
  // Do any additional setup after loading the view, typically from a nib.
  [self.view    addSubview:self.testRedBlockView];

}

- (void)viewDidLayoutSubviews
{
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma private pop animation
- (void)testPopAnimation
{
  POPSpringAnimation  *popSpringAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
  NSInteger height = CGRectGetHeight(self.view.bounds);
  NSInteger width = CGRectGetWidth(self.view.bounds);
  CGFloat centerX = arc4random() % width;
  CGFloat centerY = arc4random() % height;
  popSpringAnimation.toValue  = [NSValue  valueWithCGPoint:CGPointMake(centerX, centerY)];
  popSpringAnimation.springBounciness = 8;
  popSpringAnimation.springSpeed  = 1;
  popSpringAnimation.animationDidStartBlock = ^(POPAnimation *anim)
  {
    NSLog(@"testPopAnimation animationDidStartBlock ");
  };
  popSpringAnimation.animationDidReachToValueBlock  = ^(POPAnimation *anim)
  {
    NSLog(@"animationDidReachToValueBlock");
  };
  popSpringAnimation.animationDidApplyBlock = ^(POPAnimation *anim)
  {
    NSLog(@"animationDidApplyBlock");
  };
  
  popSpringAnimation.completionBlock  = ^(POPAnimation *anim, BOOL finished)
  {
    if (finished)
      NSLog(@"Animation finished!");
  };
  [_testRedBlockView pop_addAnimation:popSpringAnimation forKey:@"center"];
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
