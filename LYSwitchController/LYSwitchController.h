//
//  LYSwitchController.h
//  LYSwitchControllerDemo
//
//  Created by HENAN on 2019/8/28.
//  Copyright © 2019 HENAN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LYSwitchSubControllerDelegate <NSObject>

/// 模拟 viewDidLoad
- (void)subViewDidLoad;

/// 模拟 - (void)viewWillAppear:(BOOL)animated;
- (void)subViewWillAppear;
/// 模拟 - (void)viewDidAppear:(BOOL)animated;
- (void)subViewDidAppear;
/// 模拟 - (void)viewWillDisappear:(BOOL)animated;
- (void)subViewWillDisappear;
/// 模拟 - (void)viewDidDisappear:(BOOL)animated;
- (void)subViewDidDisappear;

@end

@class LYSwitchController;
@protocol LYSwitchControllerDelegate <NSObject>

/// 获取子视图个数
- (NSInteger)numberOfSubControllers;
/// 获取子视图
- (UIViewController<LYSwitchSubControllerDelegate> *)switchController:(LYSwitchController *)switchController controllerWithIndex:(NSInteger)index;
/// 切换到某一视图
- (void)switchController:(LYSwitchController *)switchController didScrollControllerWithIndex:(NSInteger)index;

@end

@interface LYSwitchController : UIViewController
/// 资源代理
@property (nonatomic, assign) id<LYSwitchControllerDelegate> delegate;
/// 默认切换到某一子视图
@property (nonatomic, assign) NSInteger selectIndex;
/// 滚动到某一子视图
- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animated;
@end

NS_ASSUME_NONNULL_END
