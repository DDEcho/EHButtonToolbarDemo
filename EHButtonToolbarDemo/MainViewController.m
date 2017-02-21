//
//  MainViewController.m
//  EHButtonToolbarDemo
//
//  Created by 张婷 on 17/02/2017.
//  Copyright © 2017 personnal. All rights reserved.
//

#import "MainViewController.h"
#import "ButtonToolbar.h"

@interface MainViewController ()

@property (nonatomic, strong) ButtonToolbar *customButtonToolbar;

@property (nonatomic, strong) UIButton *changeFirstItemToGray;
@property (nonatomic, strong) UIButton *insertItemAt0;
@property (nonatomic, strong) UIButton *removeFirstItem;
@property (nonatomic, strong) UIButton *changeItems;
@property (nonatomic, strong) UIButton *reset;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configButton];
    [self configButtonToolbar];
}

- (void)configButtonToolbar {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat buttonToolbarHeight = 55;
    self.customButtonToolbar = [[ButtonToolbar alloc] initWithFrame:CGRectMake(0, screenSize.height - buttonToolbarHeight, screenSize.width, buttonToolbarHeight)];
    self.customButtonToolbar.backgroundColor = [UIColor whiteColor];
    self.customButtonToolbar.buttonTitleColor = [UIColor whiteColor];
    self.customButtonToolbar.buttonsSpace = 12.0f;
    self.customButtonToolbar.buttonCornerRadius = 3.0f;
    self.customButtonToolbar.buttonHeight = 41.0f;
    self.customButtonToolbar.buttonLabelFont = [UIFont boldSystemFontOfSize:14.0f];
    [self.view addSubview:self.customButtonToolbar];

    __weak typeof(self) weakSelf = self;
    ButtonToolbarItem *uploadItem = [ButtonToolbarItem itemWithTitle:@"Delete" backgroundColor:[UIColor redColor] handler:^(ButtonToolbarItem *item) {
        [weakSelf showAlertWithMessage:item.titleLabel.text];
    }];
    [self.customButtonToolbar addButtonTabBarItem:uploadItem];

    ButtonToolbarItem *deleteItem = [ButtonToolbarItem itemWithTitle:@"Upload" backgroundColor:[UIColor greenColor] handler:^(ButtonToolbarItem *item) {
        [weakSelf showAlertWithMessage:item.titleLabel.text];
    }];
    [self.customButtonToolbar addButtonTabBarItem:deleteItem];
}

- (void)configButton {
    CGFloat buttonWidth = 200;
    CGFloat buttonHeight = 50;
    CGFloat buttonXPoint = 100;

    self.changeFirstItemToGray = [[UIButton alloc] initWithFrame:CGRectMake(buttonXPoint, 50, buttonWidth, buttonHeight)];
    [self.changeFirstItemToGray setTitle:@"ModifyFirstItem" forState:UIControlStateNormal];
    [self.changeFirstItemToGray setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.changeFirstItemToGray addTarget:self action:@selector(handlerToChangeFirstItemToGray) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.changeFirstItemToGray];

    self.insertItemAt0 = [[UIButton alloc] initWithFrame:CGRectMake(buttonXPoint, self.changeFirstItemToGray.frame.origin.y + buttonHeight, buttonWidth, buttonHeight)];
    [self.insertItemAt0 setTitle:@"InsertPauseItem" forState:UIControlStateNormal];
    [self.insertItemAt0 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.insertItemAt0 addTarget:self action:@selector(handlerToInsertItemAt0) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.insertItemAt0];

    self.removeFirstItem = [[UIButton alloc] initWithFrame:CGRectMake(buttonXPoint, self.insertItemAt0.frame.origin.y + buttonHeight, buttonWidth, buttonHeight)];
    [self.removeFirstItem setTitle:@"RemoveFirstItem" forState:UIControlStateNormal];
    [self.removeFirstItem setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.removeFirstItem addTarget:self action:@selector(handlerToRemoveFirstItem) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.removeFirstItem];

    self.changeItems = [[UIButton alloc] initWithFrame:CGRectMake(buttonXPoint, self.removeFirstItem.frame.origin.y + buttonHeight, buttonWidth, buttonHeight)];
    [self.changeItems setTitle:@"ChangeItems" forState:UIControlStateNormal];
    [self.changeItems setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.changeItems addTarget:self action:@selector(handlerToChangeItems) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.changeItems];

    self.reset = [[UIButton alloc] initWithFrame:CGRectMake(buttonXPoint, self.changeItems.frame.origin.y + buttonHeight, buttonWidth, buttonHeight)];
    [self.reset setTitle:@"Reset" forState:UIControlStateNormal];
    [self.reset setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.reset addTarget:self action:@selector(handlerToReset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.reset];
}

#pragma mark - Handler

- (void)handlerToChangeFirstItemToGray {
    __weak typeof(self) weakSelf = self;
    [self.customButtonToolbar updateItemInIndex:0 withNewTitle:nil newButtonTitleColor:[UIColor darkGrayColor] newBackgroundColor:[UIColor lightGrayColor] newHandler:^(ButtonToolbarItem *item) {
        [weakSelf showAlertWithMessage:@"The item turns to be gray"];
    }];
}

- (void)handlerToInsertItemAt0 {
    __weak typeof(self) weakSelf = self;
    ButtonToolbarItem *pauseItem = [ButtonToolbarItem itemWithTitle:@"Pause" backgroundColor:[UIColor blueColor] handler:^(ButtonToolbarItem *item) {
        [weakSelf showAlertWithMessage:item.titleLabel.text];
    }];
    [self.customButtonToolbar insertItem:pauseItem atIndex:0];
}

- (void)handlerToRemoveFirstItem {
    [self.customButtonToolbar removeItemAtIndex:0];
}

- (void)handlerToChangeItems {
    [self.customButtonToolbar removeAllItems];
    __weak typeof(self) weakSelf = self;
    ButtonToolbarItem *mondayItem = [ButtonToolbarItem itemWithTitle:@"Monday" backgroundColor:[UIColor grayColor] handler:^(ButtonToolbarItem *item) {
        [weakSelf showAlertWithMessage:item.titleLabel.text];
    }];
    [self.customButtonToolbar addButtonTabBarItem:mondayItem];

    ButtonToolbarItem *tuesdayItem = [ButtonToolbarItem itemWithTitle:@"Tuesday" backgroundColor:[UIColor greenColor] handler:^(ButtonToolbarItem *item) {
        [weakSelf showAlertWithMessage:item.titleLabel.text];
    }];
    [self.customButtonToolbar addButtonTabBarItem:tuesdayItem];

    ButtonToolbarItem *thursdayItem = [ButtonToolbarItem itemWithTitle:@"Thursday" backgroundColor:[UIColor blueColor] handler:^(ButtonToolbarItem *item) {
        [weakSelf showAlertWithMessage:item.titleLabel.text];
    }];
    [self.customButtonToolbar addButtonTabBarItem:thursdayItem];
}

- (void)handlerToReset {
    [self.customButtonToolbar removeFromSuperview];
    [self configButtonToolbar];
}

- (void)showAlertWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
