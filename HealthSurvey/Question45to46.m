//
//  Question45to46.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/19/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question45to46.h"

@interface Question45to46 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q45A;
@property (weak, nonatomic) IBOutlet UIPickerView *q46A;
@property  (strong, nonatomic) NSArray* qAArray;
@end

@implementation Question45to46

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.qAArray = [NSArray arrayWithObjects: NSLocalizedString(@"na", nil),NSLocalizedString(@"q45a1", nil),NSLocalizedString(@"q45a2",nil),NSLocalizedString(@"q45a3",nil),NSLocalizedString(@"q45a4",nil),NSLocalizedString(@"q45a5",nil),nil];
    self.q45A.dataSource = self;
    self.q45A.delegate = self;
    self.q46A.dataSource = self;
    self.q46A.delegate = self;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.qAArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.qAArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSInteger q45Avalue=8;
    if ([self.q45A selectedRowInComponent:0]) {
        q45Avalue=[self.q45A selectedRowInComponent:0];
    }
    NSInteger q46Avalue=8;
    if ([self.q46A selectedRowInComponent:0]) {
        q46Avalue=[self.q46A selectedRowInComponent:0];
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q45Avalue],[NSString stringWithFormat:@"%d", q46Avalue],nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
