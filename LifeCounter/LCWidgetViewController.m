//
//  LCWidgetViewController.m
//  LifeCounter
//
//  Created by Wylie on 9/5/13.
//  Copyright (c) 2013 Wylie Conlon. All rights reserved.
//

#import "LCWidgetViewController.h"

@interface LCWidgetViewController ()

@end

@implementation LCWidgetViewController

@synthesize life, lifeLabel, sub1button, add1button;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self refresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setText
{
    lifeLabel.text = [NSString stringWithFormat:@"%d", life];
}

- (void)refresh
{
    life = 20;
    [self setText];
}

- (IBAction)add1:(id)sender {
    life++;
    [self setText];
}

- (IBAction)sub1:(id)sender {
    life--;
    [self setText];
}

- (IBAction)add5:(id)sender {
    life += 5;
    [self setText];
}

- (IBAction)sub5:(id)sender {
    life -= 5;
    [self setText];
}


@end
