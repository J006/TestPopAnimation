//
//  ViewController.m
//  PopTestApp
//
//  Created by J006 on 15/12/17.
//  Copyright © 2015年 j006. All rights reserved.
//

#import "ViewController.h"
#import "TestPopSpringSIzeToMaxVC.h"
#import "TestPopSpringUICollectionView.h"

@interface ViewController ()

@property (strong,  nonatomic)  UIButton  *testPopSpringSizeBtn;
@property (strong,  nonatomic)  UIButton  *testPopSpringCollectionViewBtn;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];
  [self.view addSubview:self.testPopSpringSizeBtn];
  [self.view addSubview:self.testPopSpringCollectionViewBtn];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidLayoutSubviews
{
  [super  viewDidLayoutSubviews];
  [self.testPopSpringSizeBtn setFrame:CGRectMake(self.view.center.x-50, self.view.center.y-25, 100, 50)];
  [self.testPopSpringSizeBtn sizeToFit];
  [self.testPopSpringCollectionViewBtn setFrame:CGRectMake(self.view.center.x-100, self.view.center.y+50, 200, 50)];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma Button Action
- (void)testPopSpringSizeBtnAction
{
  TestPopSpringSIzeToMaxVC  *testPopSpringSizeToMaxVC = [[TestPopSpringSIzeToMaxVC alloc]init];
  [testPopSpringSizeToMaxVC.view setFrame:self.view.bounds];
  [self.navigationController pushViewController:testPopSpringSizeToMaxVC animated:YES];
}

- (void)testPopSpringCollectionViewBtnAction
{
  TestPopSpringUICollectionView  *testPopSpringCollection = [[TestPopSpringUICollectionView alloc]init];
  [testPopSpringCollection.view setFrame:self.view.bounds];
  [self.navigationController pushViewController:testPopSpringCollection animated:YES];
}

#pragma getter setter
- (UIButton*)testPopSpringSizeBtn
{
  if(!_testPopSpringSizeBtn)
  {
    _testPopSpringSizeBtn = [[UIButton alloc]init];
    [_testPopSpringSizeBtn setBackgroundColor:[UIColor blackColor]];
    [_testPopSpringSizeBtn.titleLabel  setFont:[UIFont systemFontOfSize:12]];
    [_testPopSpringSizeBtn setTitle:@"testPopSpringSize" forState:UIControlStateNormal];
    [_testPopSpringSizeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_testPopSpringSizeBtn  addTarget:self action:@selector(testPopSpringSizeBtnAction) forControlEvents:UIControlEventTouchUpInside];
  }
  return _testPopSpringSizeBtn;
}

- (UIButton*)testPopSpringCollectionViewBtn
{
  if(!_testPopSpringCollectionViewBtn)
  {
    _testPopSpringCollectionViewBtn = [[UIButton alloc]init];
    [_testPopSpringCollectionViewBtn setBackgroundColor:[UIColor blackColor]];
    [_testPopSpringCollectionViewBtn.titleLabel  setFont:[UIFont systemFontOfSize:12]];
    [_testPopSpringCollectionViewBtn setTitle:@"testPopSpringCollectionView" forState:UIControlStateNormal];
    [_testPopSpringCollectionViewBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_testPopSpringCollectionViewBtn  addTarget:self action:@selector(testPopSpringCollectionViewBtnAction) forControlEvents:UIControlEventTouchUpInside];
  }
  return _testPopSpringCollectionViewBtn;
}

@end
