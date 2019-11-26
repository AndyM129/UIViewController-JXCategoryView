
//
//  UIViewController+JXCategoryView.m
//  AMKCategories
//
//  Created by 孟昕欣 on 2019/11/26.
//

#import "UIViewController+JXCategoryView.h"
#import <AMKCategories/NSObject+AMKMethodSwizzling.h>
#import <JXCategoryView/JXCategoryListContainerView.h>

@implementation UIViewController (JXCategoryView)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController amk_swizzleInstanceMethod:@selector(viewDidAppear:) withMethod:@selector(JXCategoryView_UIViewController_viewDidAppear:)];
        [UIViewController amk_swizzleInstanceMethod:@selector(viewDidDisappear:) withMethod:@selector(JXCategoryView_UIViewController_viewDidDisappear:)];
    });
}

#pragma mark - Life Circle

// 若需 hook，则调用一下 代理方法
- (void)JXCategoryView_UIViewController_viewDidAppear:(BOOL)animated {
    [self JXCategoryView_UIViewController_viewDidAppear:animated];
    
    if (!self.JXCategoryView_UIViewController_shouldHook) return;
    if (![self respondsToSelector:@selector(listDidAppear)]) return;
    [(id<JXCategoryListContentViewDelegate>)self listDidAppear];
}

// 若需 hook，则调用一下 代理方法
- (void)JXCategoryView_UIViewController_viewDidDisappear:(BOOL)animated {
    [self JXCategoryView_UIViewController_viewDidDisappear:animated];
    
    if (!self.JXCategoryView_UIViewController_shouldHook) return;
    if (![self respondsToSelector:@selector(listDidDisappear)]) return;
    [(id<JXCategoryListContentViewDelegate>)self listDidDisappear];
}

#pragma mark - Properties

#pragma mark - Data & Networking

#pragma mark - Layout Subviews

#pragma mark - Public Methods

#pragma mark - Private Methods

/// 判断当前对象是否应该被 Hook。要求：实现协议，并且是 子页面
- (BOOL)JXCategoryView_UIViewController_shouldHook {
    // 若没有实现协议，则直接返回
    if (![self conformsToProtocol:@protocol(JXCategoryListContentViewDelegate)]) {
        return NO;
    }
    
    // 若是 JXCategoryListContainerView 的子页面，则直接返回
    if ([self JXCategoryView_UIViewController_nextResponderWithClass:JXCategoryListContainerView.class]) {
        return NO;
    }
    
    return YES;
}

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Helper Methods

/// 通过响应者链查找指定类的实例
- (UIResponder *)JXCategoryView_UIViewController_nextResponderWithClass:(Class)Class {
    UIResponder *nextResponder = self;
    while (nextResponder && ![nextResponder isKindOfClass:Class]) {
        nextResponder = nextResponder.nextResponder;
    }
    return nextResponder;
}

@end
