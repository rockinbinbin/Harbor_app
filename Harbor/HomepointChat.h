//
//  HomepointChat.h
//  bounce
//
//  Created by Robin Mehta on 8/27/15.
//  Copyright (c) 2015 hobble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatView.h"
#import <Parse/Parse.h>
#import "ParseManager1.h"

@interface HomepointChat : ChatView

//@property PFObject *homepoint;

// A RootTabBarController delegate
@property (strong, nonatomic) id rootTabBarDelegate;

@end
