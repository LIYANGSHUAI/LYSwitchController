//
//  ViewController.m
//  LYSwitchControllerDemo
//
//  Created by HENAN on 2019/8/28.
//  Copyright © 2019 HENAN. All rights reserved.
//

#import "ViewController.h"
#import "LYSwitchController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
@interface ViewController ()<LYSwitchControllerDelegate>
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) LYSwitchController *contentVC;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"页面一",@"页面二",@"页面三"]];
    self.segmentedControl.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds)/2.0-20-50, CGRectGetWidth(self.view.bounds), 50);
    [self.view addSubview:self.segmentedControl];
    [self.segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:(UIControlEventValueChanged)];
    
    LYSwitchController *contentVC = [[LYSwitchController alloc] init];
    contentVC.delegate = self;
    contentVC.selectIndex = 2;
    [self addChildViewController:contentVC];
    contentVC.view.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds)/2.0-20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)/2.0);
    [self.view addSubview:contentVC.view];
    self.contentVC = contentVC;
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    ThreeViewController *thressVC = [[ThreeViewController alloc] init];
    self.dataArr = @[firstVC,secondVC,thressVC];

}

- (void)segmentAction:(UISegmentedControl *)control
{
    [self.contentVC scrollToIndex:control.selectedSegmentIndex animated:NO];
}

- (NSInteger)numberOfSubControllers
{
    return 3;
}

- (UIViewController<LYSwitchSubControllerDelegate> *)switchController:(LYSwitchController *)switchController controllerWithIndex:(NSInteger)index
{
    return self.dataArr[index];
}

- (void)switchController:(LYSwitchController *)switchController didScrollControllerWithIndex:(NSInteger)index
{
    [self.segmentedControl setSelectedSegmentIndex:index];
}


@end
