//
//  GASettings.m
//  GameAnalytics
//
//  Created by Aleksandras Smirnovas on 2/7/13.
//  Copyright (c) 2013 Aleksandras Smirnovas. All rights reserved.
//

#import "GASettings.h"



@implementation GASettings

//static GASettings *sharedInstance = nil;

static BOOL _isDebugLogEnabled = NO;
static BOOL _isArchiveDataEnabled = NO;
static NSInteger _archiveDataLimit = NO;
static NSString *_customUserID = nil;

/*
+ (instancetype)allocWithZone:(NSZone *)zone
{
    NSLog(@"GASettings allocWithZone");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(sharedInstance == nil)
        {
            sharedInstance = [super allocWithZone:zone];
        }
    });
    
    return sharedInstance;
}
*/

+ (NSString *)getCustomUserID
{
    return _customUserID;
}

+ (void)setCustomUserID:(NSString *)userID
{
    _customUserID = userID;
}

+ (BOOL)isDebugLogEnabled
{
    return _isDebugLogEnabled;
}

+ (void)setDebugLogEnabled:(BOOL)value
{
    _isDebugLogEnabled = value;
}

+ (BOOL)isArchiveDataEnabled
{
    return _isArchiveDataEnabled;
}

+ (void)setArchiveDataEnabled:(BOOL)value
{
    _isArchiveDataEnabled = value;
}

+ (NSInteger)getArchiveDataLimit
{
    return  _archiveDataLimit;
}

+ (void)setArchiveDataLimit:(NSInteger)limit
{
    _archiveDataLimit = limit;
}

@end