//
//  ParseManager.m
//  ChattingApp
//
//  Created by Shimaa Essam on 3/16/15.
//  Copyright (c) 2015 Shimaa Essam. All rights reserved.
//

#import "ParseManager1.h"
#import "Utility.h"
#import "AppConstant.h"

@implementation ParseManager1
static ParseManager1 *parseManager1 = nil;

PFUser *currentUser;
+ (ParseManager1*) getInstance{
    @try {
        @synchronized(self)
        {
            if (parseManager1 == nil)
            {
                parseManager1 = [[ParseManager1 alloc] init];
                
                currentUser = [PFUser currentUser];
            }
        }
        return parseManager1;
    }
    @catch (NSException *exception) {
    }
}


#pragma fetch user pin

-(void) fetchUserPin {
    if ([[Utility getInstance] checkReachabilityAndDisplayErrorMessage]) {
        
        [[PFUser currentUser] fetchIfNeededInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
            if ([self.fetchUserdelegate respondsToSelector:@selector(didFetchUserPinWithObject:)]) {
                [self.fetchUserdelegate didFetchUserPinWithObject:object];
            }
        }];
    }
}

@end
