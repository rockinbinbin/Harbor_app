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


#pragma mark - Addresses
- (void) addAddress:(NSString*)addressName withAddress:(NSString*)address withPhone:(NSString *)phone withStreet:(NSString *)street withCity:(NSString *)city withState:(NSString *)state withZip:(NSString *)zip {
    if ([[Utility getInstance] checkReachabilityAndDisplayErrorMessage]) {
        
        PFObject *object = [PFObject objectWithClassName:@"Address"];
        object[@"Name"] = addressName;
        object[@"Address"] = address;
        object[@"Phone"] = phone;
        object[@"Street"] = street;
        object[@"City"] = city;
        object[@"State"] = state;
        object[@"Zip"] = zip;
        
        [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            PFRelation *usersRelation = [PFUser.currentUser relationForKey:@"Addresses"];
            [usersRelation addObject:object];
            [[PFUser currentUser] saveInBackground];
            
            if ([self.addAddressdelegate respondsToSelector:@selector(didAddAddressWithError:)]) {
                [self.addAddressdelegate didAddAddressWithError:error];
            }
        }];
    }
}

#pragma load Addresses

-(void) loadAddresses {
        if ([[Utility getInstance] checkReachabilityAndDisplayErrorMessage]) {
    PFRelation *relation = [PFUser.currentUser relationForKey:@"Addresses"];
    PFQuery *query = [relation query];
    query.limit = 1000;
    [query orderByDescending:@"createdAt"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if ([self.loadAddressesDelegate respondsToSelector:@selector(didLoadAddresses:)]) {
            [self.loadAddressesDelegate didLoadAddresses:objects];
        }
    }];
        }
}

#pragma load images

-(void) loadImages {
    if ([[Utility getInstance] checkReachabilityAndDisplayErrorMessage]) {
        PFQuery *query = [PFQuery queryWithClassName:@"Image"];
        query.limit = 1000;
        [query orderByDescending:@"createdAt"];
        [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            if ([self.loadImagesDelegate respondsToSelector:@selector(didLoadImages:)]) {
                [self.loadImagesDelegate didLoadImages:objects];
            }
        }];
    }
}

@end
