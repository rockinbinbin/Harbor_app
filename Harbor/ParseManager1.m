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

-(void) fetchMentors {
    if ([[Utility getInstance] checkReachabilityAndDisplayErrorMessage]) {
        
        PFQuery *query = [PFQuery queryWithClassName:@"Mentor"];
        [query orderByDescending:@"createdAt"];
        query.limit = 1000;
        
        [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            if ([self.fetchMentorsdelegate respondsToSelector:@selector(didFetchMentorsWithObjects:)]) {
                [self.fetchMentorsdelegate didFetchMentorsWithObjects:objects];
            }
        }];
    }
}


// If a user is a mentor,
-(void) fetchMentorObjectFromUser {
    if ([[Utility getInstance] checkReachabilityAndDisplayErrorMessage]) {
        if ([PFUser currentUser] != nil) {
            if ([[PFUser currentUser] objectForKey:@"isMentor"] == YES) {
                [[[PFUser currentUser] objectForKey:@"MentorPointer"] fetchInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
                    if ([self.fetchMentorFromUserDelegate respondsToSelector:@selector(didFetchMentorFromUserWithObject:)]) {
                        [self.fetchMentorFromUserDelegate didFetchMentorFromUserWithObject:object];
                    }
                }];
            }
        }
    }
}

-(void) fetchUserObjectFromMentor:(PFObject *)mentor {
    if ([[Utility getInstance] checkReachabilityAndDisplayErrorMessage]) {
        [[mentor objectForKey:@"User"] fetchInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
            if ([self.fetchUserFromMentorDelegate respondsToSelector:@selector(didFetchUserFromMentorWithObject:)]) {
                [self.fetchUserFromMentorDelegate didFetchUserFromMentorWithObject:object];
            }
        }];
    }
}


#pragma mark - Create Chat message channel
- (void) createMessageItemForUser:(PFUser *)user andMentor:(PFUser *)mentor {
    
    if ([[Utility getInstance] checkReachabilityAndDisplayErrorMessage]) {
        PFQuery *query = [PFQuery queryWithClassName:@"Messages"];
        [query whereKey:@"user" equalTo:user];
        [query whereKey:@"mentor" equalTo:mentor];
        [query setLimit:1000];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
         {
             if (error == nil)
             {
                 if ([objects count] == 0)
                 {
                     PFObject *message = [PFObject objectWithClassName:@"Messages"];
                     message[@"user"] = user;
                     message[@"mentor"] = mentor;
                     message[@"lastUser"] = [PFUser currentUser];
                     message[@"lastMessage"] = @"";
                     message[@"counter"] = @0;
                     message[@"updatedAction"] = [NSDate date];
                     [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
                      {
                          if (error != nil) NSLog(@"CreateMessageItem save error.");
                          else {
                              if ([self.createMessageDelegate respondsToSelector:@selector(didCreateMessageWithObjectID:)]) {
                                  [self.createMessageDelegate didCreateMessageWithObjectID:message.objectId];
                              }
                          }
                      }];
                 }
                 else {
                     if ([self.createMessageDelegate respondsToSelector:@selector(didCreateMessageWithObjectID:)]) {
                         PFObject *firstObj = objects[0];
                         NSString *firstObjID = firstObj.objectId;
                         [self.createMessageDelegate didCreateMessageWithObjectID:firstObjID];
                     }
                 }
             }
             else NSLog(@"CreateMessageItem query error.");
         }];
    }
}

@end
