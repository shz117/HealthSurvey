//
//  HealthSurveyDataViewController.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/8/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "HealthSurveyDataViewController.h"

@interface HealthSurveyDataViewController ()

@end

@implementation HealthSurveyDataViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

-(void)setHealthSurveyResults{

}

@end
