//
//  ButtonToolbar.m
//  EHButtonToolbarDemo
//
//  Created by 张婷 on 17/02/2017.
//  Copyright © 2017 personnal. All rights reserved.
//

#import "ButtonToolbar.h"

@interface ButtonToolbarItem ()

@property (nonatomic, copy) void (^tapBlock)(ButtonToolbarItem *item);

@end

@implementation ButtonToolbarItem

+ (instancetype)itemWithTitle:(NSString *)title
              backgroundColor:(UIColor *)color
                      handler:(void (^)(ButtonToolbarItem *))handler {
    ButtonToolbarItem *item = [ButtonToolbarItem buttonWithType:UIButtonTypeCustom];
    [item setTitle:title forState:UIControlStateNormal];
    item.backgroundColor = color;
    [item addTarget:item action:@selector(handleButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    item.tapBlock = handler;
    return item;
}

- (void)handleButtonTap:(id)sender {
    if (self.isEnabled && self.tapBlock) {
        self.tapBlock(self);
    }
}

- (void)updateTapBlock:(void (^)(ButtonToolbarItem *))newHandler {
    self.tapBlock = newHandler;
}

@end

@interface ButtonToolbar ()

@property (nonatomic, strong) NSMutableArray<ButtonToolbarItem *> *itemsArray;

@end

@implementation ButtonToolbar

- (void)configCustomUI {
    self.backgroundColor = [UIColor whiteColor];
    self.buttonTitleColor = [UIColor whiteColor];
    self.buttonsSpace = 12.0f;
    self.buttonCornerRadius = 3.0f;
    self.buttonHeight = 41.0f;
    self.buttonLabelFont = [UIFont boldSystemFontOfSize:14.0f];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if ([self.itemsArray count] > 0) {
        CGFloat buttonWidth = (self.frame.size.width - ([self.itemsArray count] + 1) * self.buttonsSpace) / [self.itemsArray count];
        NSUInteger i;
        for (i = 0; i < [self.itemsArray count];i++) {
            CGRect frame = CGRectMake(i * (self.buttonsSpace + buttonWidth) + self.buttonsSpace, (self.frame.size.height  - self.buttonHeight) / 2, buttonWidth, self.buttonHeight);
            self.itemsArray[i].frame = frame;
        }
    }
}

- (void)configItemUI:(ButtonToolbarItem *)item {
    item.layer.cornerRadius = self.buttonCornerRadius;
    [item setTitleColor:self.buttonTitleColor forState:UIControlStateNormal];
    item.titleLabel.font = self.buttonLabelFont;
    [self addSubview:item];
}

#pragma mark - Public methods

- (void)addButtonTabBarItem:(ButtonToolbarItem *)item {
    if (item) {
        [self configItemUI:item];
        [self.itemsArray addObject:item];
    }
}

- (void)updateItemInIndex:(NSUInteger)index withNewTitle:(NSString *)title newButtonTitleColor:(UIColor *)buttonTitleColor newBackgroundColor:(UIColor *)backgroundColor newHandler:(void (^)(ButtonToolbarItem *))handler {
    if (index < self.itemsArray.count) {
        ButtonToolbarItem *item = self.itemsArray[index];
        if (title) {
            [item setTitle:title forState:UIControlStateNormal];
        }
        if (buttonTitleColor) {
            [item setTitleColor:buttonTitleColor forState:UIControlStateNormal];
        }
        if (backgroundColor) {
            item.backgroundColor = backgroundColor;
        }
        if (handler) {
            [item updateTapBlock:handler];
        }
    }
}

- (void)insertItem:(ButtonToolbarItem *)item atIndex:(NSUInteger)index {
    [self configItemUI:item];
    [self.itemsArray insertObject:item atIndex:index];
}

- (void)removeItemAtIndex:(NSUInteger)index {
    if (index < self.itemsArray.count) {
        ButtonToolbarItem *item = self.itemsArray[index];
        [item removeFromSuperview];
        [self.itemsArray removeObjectAtIndex:index];
    }
}

- (void)removeAllItems {
    [self.itemsArray enumerateObjectsUsingBlock:^(ButtonToolbarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.itemsArray removeAllObjects];
}

#pragma mark - Getter & Setter

- (NSMutableArray<ButtonToolbarItem *> *)itemsArray {
    if (_itemsArray == nil) {
        _itemsArray = [[NSMutableArray alloc] init];
    }
    return _itemsArray;
}

- (NSArray<ButtonToolbarItem *> *)items {
    return [self.itemsArray copy];
}

@end
