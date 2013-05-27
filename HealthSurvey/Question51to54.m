//
//  Question51to54.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/21/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question51to54.h"

@interface Question51to54 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q51A;
@property (weak, nonatomic) IBOutlet UIPickerView *q52A;
@property (weak, nonatomic) IBOutlet UITextField *q53tx;

@property (weak, nonatomic) IBOutlet UIPickerView *q54A;
@property (strong, nonatomic) NSArray* q51AArray;
@property (strong, nonatomic) NSArray* q52AArray;
@property (strong, nonatomic) NSArray* q53AArray;
@property (strong, nonatomic) NSArray* q54AArray;


@end

@implementation Question51to54

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.q51AArray = [NSArray arrayWithObjects: NSLocalizedString(@"na", nil),NSLocalizedString(@"q51a1", nil),NSLocalizedString(@"q51a2", nil),NSLocalizedString(@"q51a3", nil),NSLocalizedString(@"q51a4", nil),NSLocalizedString(@"q51a5", nil),nil];
    self.q52AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q52a1", nil),NSLocalizedString(@"q52a2", nil),nil];
    self.q54AArray = [NSArray arrayWithObjects: NSLocalizedString(@"na", nil),NSLocalizedString(@"q54a0", nil),NSLocalizedString(@"q54a1", nil),NSLocalizedString(@"q54a2", nil),NSLocalizedString(@"q54a3", nil),NSLocalizedString(@"q54a4", nil),NSLocalizedString(@"q54a5", nil),NSLocalizedString(@"q54a6", nil),nil];
    self.q51A.dataSource = self;
    self.q51A.delegate = self;
    self.q52A.dataSource = self;
    self.q52A.delegate = self;
    self.q54A.dataSource = self;
    self.q54A.delegate = self;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.q51A){
        return [self.q51AArray objectAtIndex:row];
    }
    if (pickerView == self.q52A){
        return [self.q52AArray objectAtIndex:row];
    }
    return [self.q54AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.q51A) {
        return [self.q51AArray count];
    }
    if (pickerView == self.q52A) {
        return [self.q52AArray count];
    }
    return [self.q54AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSInteger q51Avalue=8;
    if ([self.q51A selectedRowInComponent:0]) {
        q51Avalue=[self.q51A selectedRowInComponent:0];
    }
    NSInteger q52Avalue = [self.q52A selectedRowInComponent:0]+1;
    NSInteger q54Avalue=8;
    
    if ([self.q54A selectedRowInComponent:0]) {
        q54Avalue=[self.q54A selectedRowInComponent:0]-1;
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q51Avalue],[NSString stringWithFormat:@"%d", q52Avalue],[NSString stringWithFormat:@"%@", self.q53tx.text],[NSString stringWithFormat:@"%d", q54Avalue],nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
