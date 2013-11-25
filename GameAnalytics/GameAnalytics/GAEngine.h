//
//  GAEngine.h
//  GameAnalytics
//
//  Created by Aleksandras Smirnovas on 2/4/13.
//  Copyright (c) 2013 Aleksandras Smirnovas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GARequest.h"
#import "GAReachability.h"
#import "GAOpenUDID.h"

typedef enum : NSInteger
{
    GACategoryDesign = 0,//gameplay
    GACategoryQuality,//quality assurance
    GACategoryBusiness,//transactions
    GACategoryUser//player profiles
}GACategory;

@interface GAEngine : NSObject <GARequestDelegate>

- (id)initWithHGameKey:(NSString *)gameKey
             secretKey:(NSString *)secretKey
                 build:(NSString *)build;

@property (strong, nonatomic, readonly) NSString *host;
@property (strong, nonatomic, readonly) NSString *apiVersion;
@property (strong, nonatomic, readonly) NSString *gameKey;
@property (strong, nonatomic, readonly) NSString *secretKey;
@property (strong, nonatomic, readonly) NSString *build;

@property (strong, nonatomic, readonly) NSString *userID;
@property (strong, nonatomic) NSString *sessionID;//could be updated during game

-(void)logUserDataWithParams:(NSDictionary *)params;

-(void)logGameDesignDataEvent:(NSString *)eventID
                   withParams:(NSDictionary *)params;

-(void)logBusinessDataEvent:(NSString *)eventID
             currencyString:(NSString *)currency
               amountNumber:(NSNumber *)amount
                 withParams:(NSDictionary *)params;

-(void)logQualityAssuranceDataEvent:(NSString *)eventID
                         withParams:(NSDictionary *)params;

-(NSString *)getUserID;

-(void)updateSessionID;

-(void)clearEvents;

-(BOOL)sendBatch;


/*!
 *  @abstract Checks current reachable status
 *
 *  @discussion
 *	This method is a handy helper that you can use to check for network reachability.
 */
-(BOOL) isReachable;

@end
