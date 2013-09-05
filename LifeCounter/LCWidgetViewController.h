//
//  LCWidgetViewController.h
//  LifeCounter
//
//  Created by Wylie on 9/5/13.
//  Copyright (c) 2013 Wylie Conlon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCWidgetViewController : UIViewController

@property NSInteger life;
@property (nonatomic, retain) IBOutlet UILabel *lifeLabel;
@property (nonatomic, retain) IBOutlet UIButton *sub1button;
@property (nonatomic, retain) IBOutlet UIButton *add1button;

- (IBAction)add1:(id)sender;
- (IBAction)sub1:(id)sender;
- (IBAction)add5:(id)sender;
- (IBAction)sub5:(id)sender;

- (void)setText;
- (void)refresh;

@end
