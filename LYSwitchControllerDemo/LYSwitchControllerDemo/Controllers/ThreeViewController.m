//
//  ThreeViewController.m
//  LYSwitchControllerDemo
//
//  Created by HENAN on 2019/8/28.
//  Copyright © 2019 HENAN. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor greenColor];
}
- (void)subViewDidLoad
{
    NSLog(@"加载");
}

- (void)subViewWillAppear
{
    NSLog(@"将要出现");
}

- (void)subViewDidAppear
{
    NSLog(@"已经出现");
}

- (void)subViewWillDisappear
{
    NSLog(@"将要消失");
}

- (void)subViewDidDisappear
{
    NSLog(@"已经消失");
}
@end
