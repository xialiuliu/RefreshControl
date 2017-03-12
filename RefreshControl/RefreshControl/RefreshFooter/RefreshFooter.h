//
//  RefreshFooter.h
//  RefreshControl
//
//  Created by hu on 2017/3/7.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^RefreshFooterBlock)(void);

@interface RefreshFooter : UIView

- (instancetype)initWithTarget:(id)target beginRefreshBlock:(RefreshFooterBlock)refreshHeaderBlock;

- (void)beginRefreshing;

- (void)endRefreshing;
@end
