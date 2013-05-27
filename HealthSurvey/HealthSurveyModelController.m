//
//  HealthSurveyModelController.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/8/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "HealthSurveyModelController.h"

#import "HealthSurveyDataViewController.h"

#import "CHCSVWriter.h"

#import "NetworkManager.h"
/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface HealthSurveyModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation HealthSurveyModelController

- (id)init
{
    self = [super init];
    if (self) {
        _pageData = [NSArray arrayWithObjects:@"introduction",@"screeningQuestions",@"question3to7",@"question8", @"question9to11p1",@"question12to14p1",@"question15to18",@"question19to22",@"question23to29",@"question29to32",@"question33p1",@"question33p2",@"question35to36",@"question37to38",@"question39to40",@"question42to44",@"question45to46",@"question47to50",@"question51to54",@"question55",@"question56to59",@"thanksandsave", nil ];
        self.pageDataViewController=[NSMutableArray arrayWithCapacity:[_pageData count]];
        self.globalData=[NSMutableDictionary dictionary];    }
    return self;
}

- (HealthSurveyDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{
    HealthSurveyDataViewController *dataViewController;
    // Return the data view controller for the given index.
    if (([self.pageDataViewController count] == 0) || (index >= [self.pageDataViewController count])) {
    
    // Create a new view controller and pass suitable data.
     NSString * identifier = [self.pageData objectAtIndex:index];
    dataViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    dataViewController.dataObject = self.pageData[index];
    dataViewController.HealthSurveyModelController = self;
    dataViewController.index=index;
    [self.pageDataViewController setObject:dataViewController atIndexedSubscript:index];
    return dataViewController;
    }
    dataViewController=[self.pageDataViewController objectAtIndex:index];
    [dataViewController viewDidLoad];
    return dataViewController;

}

- (NSUInteger)indexOfViewController:(HealthSurveyDataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(HealthSurveyDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(HealthSurveyDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

-(void)submitResults {
    NSMutableArray *controllers = self.pageDataViewController;
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:[controllers count]];
    NSLog(@"controllers:%@",controllers);
    for (HealthSurveyDataViewController *controller in controllers) {
        [results addObjectsFromArray:controller.dataArray];
    }
//    NSLog(@"results array:%@",results);
//    NSLog(@"results array len:%d",results.count);
    
    [[[CHCSVWriter alloc] initWithCSVFile:[[NetworkManager sharedInstance] resultsFilePath] atomic:NO] writeLineWithFields:results];
}

//-(void)recordRefusal{
//    NSArray* refusal = [NSArray arrayWithContentsOfFile:@"refusal"];
//    
//}

+(void)initResultsFile{
    /*
     [[NSFileManager defaultManager] removeItemAtPath:[[[NetworkManager sharedInstance] resultsDir] path] error:nil];
     return;
     */
    NetworkManager * manager=[NetworkManager sharedInstance];
    if ([manager isResultsDirExisted]) {
        return;
    }
    int capacity=230;
    NSMutableArray * questionNumbers=[NSMutableArray arrayWithCapacity:capacity];
    for (int i = 1; i < capacity; i++) {
        [questionNumbers addObject:[NSString stringWithFormat:@"%u", i]];
    }
    NSMutableArray * titleRow=(NSMutableArray *)[NSMutableArray arrayWithObjects:@"Date", @"Time",@"ID",@"Willing",@"Nearby",@"ForWages",@"HperW",@"FarHome",@"ToSchool",@"FarSchool",@"Job",@"TravelWaling",@"WalingTime",@"TravelTaxi", @"TaxiTime",@"TravelRbike",@"RbikeTime",@"TravelEbike",@"EbikeTime",@"TravelBus",@"BusTime",@"TravelCarD", @"CarDTime",@"TravelCarP",@"CarPTime",@"TravelWaling2",@"WalingTime2",@"TravelTaxi2", @"TaxiTime2",@"TravelRbike2",@"RbikeTime2",@"TravelEbike2",@"EbikeTime2",@"TravelBus2",@"BusTime2",@"TravelCarD2", @"CarDTime2",@"TravelCarP2",@"CarPTime2",@"Martial",@"MartialTime",@"TaiChi",@"TCTime",@"Gym", @"GymTime",@"TraField",@"TraFieldTime",@"Socc",@"SoccTime",@"Badm",@"BadmTime",@"Walk",@"WalkTime", @"Exer",@"ExerTime",@"Other",@"OtherTime",@"WalkPlace",@"TodayCar",@"ChanPollu",@"SecondTime", @"NameDevel",@"BuildNo",@"Stories",@"PeopleNo1",@"PeopleNo2",@"OwnAuto",@"AutoNo",@"ConvWalk", @"SafeWalk",@"ConvBike",@"SafeBike",@"EnouPlc",@"EnouPlcEval",@"PubTrans",@"PubTransEval",@"FreeB", @"FreeBEval",@"EnouPar",@"EnouParEval",@"FeaWalk",@"FeaWEval",@"Crime",@"CrimeEv",@"SafeTraf", @"SafeTrafEv",@"EnouPlaEx",@"EnouPlaExEv",@"PreferLive1",@"Feel",@"BloodPre",@"Diabetes", @"Asthma",@"WhistChest",@"pep",@"happy",@"better",@"PhyAct",@"HeathyDiet",@"Birthday",@"Calendar", @"Age",@"sex",@"marital",@"householdReg",@"yearInCurDev",@"education",@"wage",@"height",@"heightType", @"weight",@"weiType", nil];
    [[[CHCSVWriter alloc] initWithCSVFile:[manager resultsFilePath] atomic:NO] writeLineWithFields:titleRow];
}



@end
