//
//  ParseManager.h
//  ChattingApp
//
//  Created by Shimaa Essam on 3/16/15.
//  Copyright (c) 2015 Shimaa Essam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@protocol ParseManagerFetchUserPinDelegate;
@protocol ParseManagerFetchMentorsDelegate;
@protocol ParsemanagerFetchMentorFromUserDelegate;

@interface ParseManager1 : NSObject

@property id<ParseManagerFetchUserPinDelegate> fetchUserdelegate;
@property id<ParseManagerFetchMentorsDelegate> fetchMentorsdelegate;
@property id<ParsemanagerFetchMentorFromUserDelegate> fetchMentorFromUserDelegate;

+ (ParseManager1*) getInstance;
-(void) fetchUserPin;
-(void) fetchMentors;
-(void) fetchMentorObjectFromUser;

@end


@protocol ParseManagerFetchUserPinDelegate <NSObject>
- (void) didFetchUserPinWithObject:(PFObject *)object;
@end

@protocol ParseManagerFetchMentorsDelegate <NSObject>
- (void) didFetchMentorsWithObjects:(NSArray *)objects;
@end

@protocol ParsemanagerFetchMentorFromUserDelegate <NSObject>
- (void) didFetchMentorFromUserWithObject:(PFObject *)object;
@end