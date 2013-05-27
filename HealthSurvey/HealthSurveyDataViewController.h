//
//  HealthSurveyDataViewController.h
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/8/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HealthSurveyModelController;

@interface HealthSurveyDataViewController : UIViewController

@property (strong,nonatomic) HealthSurveyModelController *HealthSurveyModelController;

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic)NSMutableArray *dataArray;
@property(nonatomic)NSUInteger index;
-(void)setHealthSurveyResults;
@end
