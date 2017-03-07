//
//  RefreshHeader.h
//  RefreshControl
//
//  Created by hu on 2017/3/7.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^RefreshHeaderBlock)(void);

@interface RefreshHeader : UIView

- (instancetype)initWithTarget:(id)target beginRefreshBlock:(RefreshHeaderBlock)refreshHeaderBlock;

- (void)beginRefreshing;

- (void)endRefreshing;

@end



@interface UIColor (hex)
+ (UIColor *)colorWithHexString:(NSString *)hex;
@end

@interface NSString (hex)
- (NSUInteger)integerValueFromHex;
@end
