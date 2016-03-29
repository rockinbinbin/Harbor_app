//
//  HomepointChat.m
//  bounce
//
//  Created by Robin Mehta on 8/27/15.
//  Copyright (c) 2015 hobble. All rights reserved.
//

#import "HomepointChat.h"
#import "Utility.h"
#import "ParseManager1.h"
#import "Harbor-Swift.h"
#import "AppConstant.h"

@interface HomepointChat ()
@property BOOL firstDone;
@end

@implementation HomepointChat
{
}

//- (id)initWithDelegate:(id<RootTabBarControllerDelegate>)delegate {
//    self = [super init];
//    if (self) {
//        self.rootTabBarDelegate = delegate;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homepointChat = YES;
    
    UILabel *navLabel = [UILabel new];
    navLabel.textColor = [UIColor whiteColor];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:20];
    self.navigationItem.titleView = navLabel;
    navLabel.text = @"Chat";
    [navLabel sizeToFit];
    
    self.navigationController.navigationBar.barTintColor = teal;
    self.navigationController.navigationBar.translucent = NO;
//    UIButton *customButton = [[Utility getInstance] createCustomButton:[UIImage imageNamed:@"common_back_button"]];
//
//    [customButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
}


- (void)loadMessages{
    [super loadMessages];
}

- (void)didFailWithError:(NSError *)error {
    [[Utility getInstance] hideProgressHud];
}

#pragma mark - Clear Messages
- (void) clearMessagesAndStopUpdate
{
    @try {
        [self.messages removeAllObjects];
        [self.collectionView reloadData];
        [self.timer invalidate];
    }
    @catch (NSException *exception) {
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - back Button Action
-(void)backButtonClicked{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
