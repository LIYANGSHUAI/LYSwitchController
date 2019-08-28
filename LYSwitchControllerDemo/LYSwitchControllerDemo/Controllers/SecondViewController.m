//
//  SecondViewController.m
//  LYSwitchControllerDemo
//
//  Created by HENAN on 2019/8/28.
//  Copyright © 2019 HENAN. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor yellowColor];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
