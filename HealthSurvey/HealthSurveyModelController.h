//
//  HealthSurveyModelController.h
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/8/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HealthSurveyDataViewController;

@interface HealthSurveyModelController : NSObject <UIPageViewControllerDataSource>

- (HealthSurveyDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(HealthSurveyDataViewController *)viewController;

//to be implemented
- (void)submitResults;
+(void)initResultsFile;
@property(strong,nonatomic)NSMutableDictionary *globalData;

@property (strong, nonatomic) NSMutableArray *pageDataViewController;
@end
