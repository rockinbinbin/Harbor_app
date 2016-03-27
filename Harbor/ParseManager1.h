//
//  ParseManager.h
//  ChattingApp
//
//  Created by Shimaa Essam on 3/16/15.
//  Copyright (c) 2015 Shimaa Essam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@protocol ParseManagerAddAddressDelegate;
@protocol ParseManagerLoadAddressesDelegate;
@protocol ParseManagerLoadImagesDelegate;

@interface ParseManager1 : NSObject


@property id<ParseManagerAddAddressDelegate> addAddressdelegate;
@property id<ParseManagerLoadAddressesDelegate> loadAddressesDelegate;
@property id<ParseManagerLoadImagesDelegate> loadImagesDelegate;

+ (ParseManager1*) getInstance;

- (void) addAddress:(NSString*)addressName withAddress:(NSString*)address withPhone:(NSString *)phone withStreet:(NSString *)street withCity:(NSString *)city withState:(NSString *)state withZip:(NSString *)zip;
-(void) loadAddresses;
-(void) loadImages;

@end


@protocol ParseManagerAddAddressDelegate <NSObject>
- (void) didAddAddressWithError:(NSError *) error;
@end

@protocol ParseManagerLoadAddressesDelegate <NSObject>
- (void) didLoadAddresses:(NSArray *) objects;
@end

@protocol ParseManagerLoadImagesDelegate <NSObject>

- (void) didLoadImages:(NSArray *) objects;

@end