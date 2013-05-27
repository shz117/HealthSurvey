//
//  Question33p2.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/17/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.

#import "Question33p2.h"

@interface Question33p2 ()
@property (weak, nonatomic) IBOutlet UISwitch *q33op5sw;
@property (weak, nonatomic) IBOutlet UISwitch *q33op6sw;
@property (weak, nonatomic) IBOutlet UISwitch *q33op7sw;
@property (weak, nonatomic) IBOutlet UISwitch *q33op8sw;
@property (weak, nonatomic) IBOutlet UIPickerView *q33op5A;
@property (weak, nonatomic) IBOutlet UIPickerView *q33op6A;
@property (weak, nonatomic) IBOutlet UIPickerView *q33op7A;
@property (weak, nonatomic) IBOutlet UIPickerView *q33op8A;
@property (strong, nonatomic) NSArray* q33AArray;
@property (weak, nonatomic) IBOutlet UILabel *q33op5;
@property (weak, nonatomic) IBOutlet UILabel *q33op6;
@property (weak, nonatomic) IBOutlet UILabel *q33op7;
@property (weak, nonatomic) IBOutlet UILabel *q33op8;

@end

@implementation Question33p2

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.q33AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q33answer8", nil),NSLocalizedString(@"q33answer1", nil),NSLocalizedString(@"q33answer2",nil),NSLocalizedString(@"q33answer3",nil),NSLocalizedString(@"q33answer4",nil),NSLocalizedString(@"q33answer5",nil),nil];
    self.q33op5A.dataSource = self;
    self.q33op5A.delegate = self;
    self.q33op6A.dataSource = self;
    self.q33op6A.delegate = self;
    self.q33op7A.dataSource = self;
    self.q33op7A.delegate = self;
    self.q33op8A.dataSource = self;
    self.q33op8A.delegate = self;

    
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.q33AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.q33AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSInteger q33op5Avalue=8;
    if ([self.q33op5A selectedRowInComponent:0]) {
        q33op5Avalue=[self.q33op5A selectedRowInComponent:0];
    }
    NSInteger q33op6Avalue=8;
    if ([self.q33op6A selectedRowInComponent:0]) {
        q33op6Avalue=[self.q33op6A selectedRowInComponent:0];
    }
    NSInteger q33op7Avalue=8;
    if ([self.q33op7A selectedRowInComponent:0]) {
        q33op7Avalue=[self.q33op7A selectedRowInComponent:0];
    }
    
    NSInteger q33op8Avalue=8;
    if ([self.q33op8A selectedRowInComponent:0]) {
        q33op8Avalue=[self.q33op8A selectedRowInComponent:0];
    }
    
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", self.q33op5sw.isOn],[NSString stringWithFormat:@"%d", q33op5Avalue],[NSString stringWithFormat:@"%d", self.q33op6sw.isOn],[NSString stringWithFormat:@"%d",q33op6Avalue],[NSString stringWithFormat:@"%d", self.q33op7sw.isOn],[NSString stringWithFormat:@"%d", q33op7Avalue],[NSString stringWithFormat:@"%d", self.q33op8sw.isOn], [NSString stringWithFormat:@"%d", q33op8Avalue],nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
