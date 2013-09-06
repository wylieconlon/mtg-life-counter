//
//  LCViewController.m
//  LifeCounter
//
//  Created by Wylie on 9/4/13.
//  Copyright (c) 2013 Wylie Conlon. All rights reserved.
//

#import "LCViewController.h"
#import "LCWidgetViewController.h"
#import <QuartzCore/QuartzCore.h>
#include <stdlib.h>

@interface LCViewController ()

@end

@implementation LCViewController

@synthesize widget1, widget2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    widget1 = [self makeWidget:0];
    widget2 = [self makeWidget:1];

    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);

    NSMutableArray *items = [[NSMutableArray alloc] init];

    [items addObject:[[UIBarButtonItem alloc]
                      initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                      target:self
                        action:@selector(refresh)]];

    // separator
    [items addObject:[[UIBarButtonItem alloc]
                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                      target:nil
                      action:nil]];

    [items addObject:[[UIBarButtonItem alloc]
                      initWithTitle:@"Roll for first"
                      style:UIBarButtonItemStylePlain
                      target:self
                      action:@selector(rollDice)]];

    [toolbar setItems:items animated:NO];
    [toolbar setTranslucent:NO];
    [toolbar setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:toolbar];
    
    [self.view addSubview:widget1.view];
    [self.view addSubview:widget2.view];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.97f alpha:1.0f]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (LCWidgetViewController *)makeWidget:(NSInteger) index;
{
    LCWidgetViewController *widget = [[LCWidgetViewController alloc] initWithNibName:@"LCWidgetView" bundle:nil];
    
    widget.view.frame = CGRectMake(0, 216 * index + 20, 320, 200);
    return widget;
}

- (void)refresh
{
    [widget1 refresh];
    [widget2 refresh];
}

- (void)rollDice
{
    int player1roll = arc4random_uniform(6) + arc4random_uniform(6) + 2;
    int player2roll = arc4random_uniform(6) + arc4random_uniform(6) + 2;
    
    NSString *title;
    if (player1roll > player2roll) {
        title = [NSString stringWithFormat:@"Player 1 goes first. %d beats %d", player1roll, player2roll];
    } else if (player1roll < player2roll) {
        title = [NSString stringWithFormat:@"Player 2 goes first. %d loses to %d", player1roll, player2roll];
    } else {
        title = [NSString stringWithFormat:@"Players tie %d to %d. Roll again.", player1roll, player2roll];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Results"
                                                    message:title
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
