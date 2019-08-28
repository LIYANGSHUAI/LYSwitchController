//
//  LYSwitchController.m
//  LYSwitchControllerDemo
//
//  Created by HENAN on 2019/8/28.
//  Copyright © 2019 HENAN. All rights reserved.
//

#import "LYSwitchController.h"
#import <objc/runtime.h>

@interface LYSwitchController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray<UIViewController<LYSwitchSubControllerDelegate> *> *controllerArrs;
@property (nonatomic, strong) UIViewController<LYSwitchSubControllerDelegate> *lastVC;
@end

@implementation LYSwitchController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.controllerArrs = [NSMutableArray array];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfSubControllers)])
    {
        NSInteger num = [self.delegate numberOfSubControllers];
        CGFloat w = CGRectGetWidth(self.view.bounds);
        CGFloat h = CGRectGetHeight(self.view.bounds);
        for (int i = 0; i < num; i++) {
            UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(i * w, 0, w, h)];
            contentView.tag = 200+i;
            [self.scrollView addSubview:contentView];
        }
        [self.scrollView setContentSize:CGSizeMake(w * num, h)];
        [self changeToController:self.selectIndex];
    }
}
- (void)changeToController:(NSInteger)index
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchController:controllerWithIndex:)])
    {
        UIViewController<LYSwitchSubControllerDelegate> *currentVC = [self .delegate switchController:self controllerWithIndex:index];
        if ([self.lastVC isEqual:currentVC]) {
            return;
        }
        if (![self.controllerArrs containsObject:currentVC])
        {
            UIView *contentView = [self.scrollView viewWithTag:200+index];
            [self addChildViewController:currentVC];
            [contentView addSubview:currentVC.view];
            UIView *view1 = currentVC.view;
            view1.translatesAutoresizingMaskIntoConstraints = NO;
            NSArray *h1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view1]-0-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(view1)];
            NSArray *v1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view1]-0-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(view1)];
            [contentView addConstraints:h1];
            [contentView addConstraints:v1];
            if ([currentVC respondsToSelector:@selector(subViewDidLoad)])
            {
                [currentVC subViewDidLoad];
                [self.scrollView setContentOffset:CGPointMake(index * CGRectGetWidth(self.view.bounds), 0) animated:NO];
            }
            if (self.lastVC)
            {
                if ([self.lastVC respondsToSelector:@selector(subViewWillDisappear)])
                {
                    [self.lastVC subViewWillDisappear];
                }
                if ([currentVC respondsToSelector:@selector(subViewWillAppear)])
                {
                    [currentVC subViewWillAppear];
                }
                if ([self.lastVC respondsToSelector:@selector(subViewDidDisappear)])
                {
                    [self.lastVC subViewDidDisappear];
                }
                if ([currentVC respondsToSelector:@selector(subViewDidAppear)])
                {
                    [currentVC subViewDidAppear];
                }
            } else {
                if ([currentVC respondsToSelector:@selector(subViewWillAppear)])
                {
                    [currentVC subViewWillAppear];
                }
                if ([currentVC respondsToSelector:@selector(subViewDidAppear)])
                {
                    [currentVC subViewDidAppear];
                }
            }
            [self.controllerArrs addObject:currentVC];
            if (self.delegate && [self.delegate respondsToSelector:@selector(switchController:didScrollControllerWithIndex:)])
            {
                [self.delegate switchController:self didScrollControllerWithIndex:index];
            }
        } else {
            if (self.lastVC)
            {
                if ([self.lastVC respondsToSelector:@selector(subViewWillDisappear)])
                {
                    [self.lastVC subViewWillDisappear];
                }
                if ([currentVC respondsToSelector:@selector(subViewWillAppear)])
                {
                    [currentVC subViewWillAppear];
                }
                if ([self.lastVC respondsToSelector:@selector(subViewDidDisappear)])
                {
                    [self.lastVC subViewDidDisappear];
                }
                if ([currentVC respondsToSelector:@selector(subViewDidAppear)])
                {
                    [currentVC subViewDidAppear];
                }
            } else {
                if ([currentVC respondsToSelector:@selector(subViewWillAppear)])
                {
                    [currentVC subViewWillAppear];
                }
                if ([currentVC respondsToSelector:@selector(subViewDidAppear)])
                {
                    [currentVC subViewDidAppear];
                }
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(switchController:didScrollControllerWithIndex:)])
            {
                [self.delegate switchController:self didScrollControllerWithIndex:index];
            }
        }
        self.lastVC = currentVC;
    }
}

- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animated
{
    [self.scrollView setContentOffset:CGPointMake(index * CGRectGetWidth(self.view.bounds), 0) animated:animated];
    [self changeToController:index];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / CGRectGetWidth(self.view.bounds);
    [self changeToController:index];
}

@end
