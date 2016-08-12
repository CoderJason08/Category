//
//  UIViewController+BackButtonHandler.m
//  backButtonTest
//
//  Created by 洛克韦驼 on 16/8/12.
//  Copyright © 2016年 洛克韦驼. All rights reserved.
//

#import "UIViewController+BackButtonHandler.h"

@implementation UIViewController (BackButtonHandler)

@end


@implementation UINavigationController (ShouldPopOnBacButton)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    if (self.viewControllers.count < navigationBar.items.count) {
        return YES;
    }
    BOOL shouldPop = YES;
    UIViewController *vc = [self topViewController];
    if ([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    if (shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }else {
        // 解决iOS7下会导致导航栏显示异常的bug
        for (UIView *subview in [navigationBar subviews]) {
            if (subview.alpha > 0. && subview.alpha < 1.) {
                [UIView animateWithDuration:0.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
    }
    return NO;
}

@end