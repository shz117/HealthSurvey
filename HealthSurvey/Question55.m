//
//  Question55.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/21/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question55.h"

@interface Question55 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q55A;
@property (strong, nonatomic) NSArray* q55AArray;


@end

@implementation Question55

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.q55AArray = [NSArray arrayWithObjects: NSLocalizedString(@"na", nil),NSLocalizedString(@"q55a1", nil),NSLocalizedString(@"q55a2", nil),NSLocalizedString(@"q55a3", nil),NSLocalizedString(@"q55a4", nil),NSLocalizedString(@"q55a5", nil),NSLocalizedString(@"q55a6", nil),NSLocalizedString(@"q55a7", nil),nil];
    self.q55A.dataSource = self;
    self.q55A.delegate = self;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    return [self.q55AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.q55AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSInteger q55Avalue = 9999;
    if ([self.q55A selectedRowInComponent:0]) {
        q55Avalue = [self.q55A selectedRowInComponent:0];
    }
    
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q55Avalue],nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
