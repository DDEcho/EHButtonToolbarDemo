//
//  ButtonToolbar.h
//  EHButtonToolbarDemo
//
//  Created by 张婷 on 17/02/2017.
//  Copyright © 2017 personnal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonToolbarItem : UIButton

+ (instancetype)itemWithTitle:(NSString *)title
              backgroundColor:(UIColor *)color
                      handler:(void (^)(ButtonToolbarItem *item))handler;

- (void)updateTapBlock:(void (^)(ButtonToolbarItem *item))newHandler;

@end

@interface ButtonToolbar : UIView

@property (nonatomic, strong) UIColor *buttonTitleColor;
@property (nonatomic, assign) CGFloat buttonsSpace;
@property (nonatomic, assign) CGFloat buttonCornerRadius;
@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) UIFont *buttonLabelFont;
@property (nonatomic, readonly) NSArray<ButtonToolbarItem *> *items;

- (void)addButtonTabBarItem:(ButtonToolbarItem *)item;

/**
 if the param is nil, then do not update the item.
 */
- (void)updateItemInIndex:(NSUInteger)index withNewTitle:(NSString *)title newButtonTitleColor:(UIColor *)buttonTitleColor newBackgroundColor:(UIColor *)backgroundColor newHandler:(void (^)(ButtonToolbarItem *item))handler;

- (void)insertItem:(ButtonToolbarItem *)item atIndex:(NSUInteger)index;
- (void)removeItemAtIndex:(NSUInteger)index;

- (void)removeAllItems;

@end
