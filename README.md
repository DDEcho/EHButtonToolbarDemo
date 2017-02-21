# EHButtonToolbarDemo
ButtonToolbarDemo project shows how to customize a tool bar containning several buttons. In the use, you can update, add, and remove tool bar item as need.
## Usage
### Initialization
    self.customButtonToolbar = [[ButtonToolbar alloc] initWithFrame:CGRectMake(0, 200, 200, 55)];
    self.customButtonToolbar.backgroundColor = [UIColor whiteColor];
    self.customButtonToolbar.buttonTitleColor = [UIColor whiteColor];
    self.customButtonToolbar.buttonsSpace = 12.0f;
    self.customButtonToolbar.buttonCornerRadius = 3.0f;
    self.customButtonToolbar.buttonHeight = 41.0f;
    self.customButtonToolbar.buttonLabelFont = [UIFont boldSystemFontOfSize:14.0f];
    [self.view addSubview:self.customButtonToolbar];

    __weak typeof(self) weakSelf = self;
    ButtonToolbarItem *uploadItem = [ButtonToolbarItem itemWithTitle:@"Delete" backgroundColor:[UIColor redColor] handler:^(ButtonToolbarItem *item) {
        //define your own button handler here
    }];
    [self.customButtonToolbar addButtonTabBarItem:uploadItem];

    ButtonToolbarItem *deleteItem = [ButtonToolbarItem itemWithTitle:@"Upload" backgroundColor:[UIColor greenColor] handler:^(ButtonToolbarItem *item) {
        //define your own button handler here
    }];
    [self.customButtonToolbar addButtonTabBarItem:deleteItem];
### Insert Item
     __weak typeof(self) weakSelf = self;
    ButtonToolbarItem *pauseItem = [ButtonToolbarItem itemWithTitle:@"Pause" backgroundColor:[UIColor blueColor] handler:^(ButtonToolbarItem *item) {
        //define your own button handler here
    }];
    [self.customButtonToolbar insertItem:pauseItem atIndex:0];
### Remove Item
    [self.customButtonToolbar removeItemAtIndex:0];
### Update Item
    __weak typeof(self) weakSelf = self;
    [self.customButtonToolbar updateItemInIndex:0 withNewTitle:nil newButtonTitleColor:[UIColor darkGrayColor] newBackgroundColor:[UIColor lightGrayColor] newHandler:^(ButtonToolbarItem *item) {
        //define your own button handler here
    }];
### Remove All Items
    [self.customButtonToolbar removeAllItems];
