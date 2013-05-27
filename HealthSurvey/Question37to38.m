//
//  Question37to38.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/18/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question37to38.h"

@interface Question37to38 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q37A;
@property (weak, nonatomic) IBOutlet UIPickerView *q38A;
@property (weak, nonatomic) IBOutlet UILabel *q37pa;
@property (strong, nonatomic) NSArray* q3738AArray;
@end

@implementation Question37to38

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.q3738AArray = [NSArray arrayWithObjects: NSLocalizedString(@"na", nil),NSLocalizedString(@"no", nil),NSLocalizedString(@"yes",nil),nil];
    self.q37A.dataSource = self;
    self.q37A.delegate = self;
    self.q38A.dataSource = self;
    self.q38A.delegate = self;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.q3738AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.q3738AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSInteger q37Avalue=8;
    if ([self.q37A selectedRowInComponent:0]) {
        q37Avalue=[self.q37A selectedRowInComponent:0];
    }
    NSInteger q38Avalue=8;
    if ([self.q38A selectedRowInComponent:0]) {
        q38Avalue=[self.q38A selectedRowInComponent:0];
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q37Avalue],[NSString stringWithFormat:@"%d", q38Avalue],nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
