//
//  LCViewController.h
//  LifeCounter
//
//  Created by Wylie on 9/4/13.
//  Copyright (c) 2013 Wylie Conlon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCWidgetViewController.h"

@interface LCViewController : UIViewController

@property (nonatomic, retain) LCWidgetViewController *widget1;
@property (nonatomic, retain) LCWidgetViewController *widget2;

- (void)refresh;
- (void)rollDice;

@end

