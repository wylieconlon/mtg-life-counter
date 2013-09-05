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
    [toolbar setItems:items animated:NO];
    [self.view addSubview:toolbar];
    
    [self.view addSubview:widget1.view];
    [self.view addSubview:widget2.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (LCWidgetViewController *)makeWidget:(NSInteger) index;
{
    LCWidgetViewController *widget = [[LCWidgetViewController alloc] initWithNibName:@"LCWidgetView" bundle:nil];
    
    widget.view.frame = CGRectMake(0, 220 * index + 20, 320, 200);
    return widget;
}

- (void)refresh
{
    [widget1 refresh];
    [widget2 refresh];
}

@end
