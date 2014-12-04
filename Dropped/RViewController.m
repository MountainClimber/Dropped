//
//  RViewController.m
//  Dropped
//
//  Created by Ravinder Vatish on 5/29/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "RViewController.h"

@interface RViewController ()

@end

@implementation RViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMap:(id)sender {
   // [self loadView:];
    NSString *storyBoardName = @"Main_iPhone";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"MapScreenDisplay"];
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
