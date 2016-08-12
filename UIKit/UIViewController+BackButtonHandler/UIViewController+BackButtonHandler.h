//
//  UIViewController+BackButtonHandler.h
//  backButtonTest
//
//  Created by 洛克韦驼 on 16/8/12.
//  Copyright © 2016年 洛克韦驼. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>
@optional
// override this method in UIViewController to control backItem's click action
- (BOOL)navigationShouldPopOnBackButton;
@end

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end
