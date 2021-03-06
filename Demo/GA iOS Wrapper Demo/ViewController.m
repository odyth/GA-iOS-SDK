//
//  ViewController.m
//  GA iOS Wrapper Demo
//
//  Created by Aleksandras Smirnovas on 2/3/13.
//  Copyright (c) 2013 Aleksandras Smirnovas. All rights reserved.
//

#import "ViewController.h"
#import "GameAnalytics.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.toggleLogButton setTitle:@"Disable Debug Log" forState:UIControlStateNormal];
    [GameAnalytics setDebugLogEnabled:YES];
    [GameAnalytics setBatchRequestsEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)logUserData:(id)sender
{
    [GameAnalytics logUserDataWithGender:@"M"
                               birthYear:@1981
                             friendCount:@10];
}

-(IBAction)logBusinessData:(id)sender
{
    [GameAnalytics logBusinessDataEvent:@"PurchaseWeapon:Shotgun"
                         currencyString:@"LTL"
                           amountNumber:@100
                                   area:@"Level1"
                                      x:@1.0f
                                      y:@1.5f
                                      z:@2.5f];
    
//    [GameAnalytics logBusinessDataEvent:@"PurchaseWeapon:Shotgun"
//                         currencyString:@"LTL"
//                           amountNumber:@1000
//                             withParams:@{@"area" : @"Level 1", @"x" : @1.0f, @"y" : @1.0f, @"z" : @1.0f}];
}

-(IBAction)logGameDesingData:(id)sender
{
    [GameAnalytics logGameDesignDataEvent:@"PickedUpAmmo:Shotgun"
                                    value:@1.0f
                                     area:@"Level 1"
                                        x:@1.0f
                                        y:@2.0f
                                        z:@3.0f];
    
//    [GameAnalytics logGameDesignDataEvent:@"PickedUpAmmo:Shotgun"
//                               withParams:@{@"area" : @"Level 1", @"x" : @1.0f, @"y" : @1.0f, @"z" : @1.0f, @"value" : @1.0f}];
}

-(IBAction)logQAData:(id)sender
{
    [GameAnalytics logQualityAssuranceDataEvent:@"Exceptaion:NullReferenceException"
                                        message:@"at Infragistics.Windows.Internal.TileManager.ItemRowColumnSizeInfo.."
                                           area:@"area"
                                              x:@1
                                              y:@2
                                              z:@3];
    
//    [GameAnalytics logQualityAssuranceDataEvent:@"Exceptaion:NullReferenceException"
//                                     withParams:@{ @"area" : @"Level 1", @"x" : @1.0f, @"y" : @1.0f, @"z" : @1.0f, @"message" : @"at Infragistics.Windows.Internal.TileManager.ItemRowColumnSizeInfo.."}];
}

-(IBAction)toggleDebugLog:(id)sender
{
    if([self.toggleLogButton.titleLabel.text isEqualToString:@"Enable Debug Log"])
    {
        [self.toggleLogButton setTitle:@"Disable Debug Log" forState:UIControlStateNormal];
        [GameAnalytics setDebugLogEnabled:YES];
    } else {
        [self.toggleLogButton setTitle:@"Enable Debug Log" forState:UIControlStateNormal];
        [GameAnalytics setDebugLogEnabled:NO];
    }
}

@end
