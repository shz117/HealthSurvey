//
//  Question29to32.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question29to32.h"

@interface Question29to32 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q29A;
@property (weak, nonatomic) IBOutlet UIPickerView *q30A;
@property (weak, nonatomic) IBOutlet UIPickerView *q31A;
@property (weak, nonatomic) IBOutlet UIPickerView *q32A;
@property (strong, nonatomic) NSArray* q32AArray;
@property (strong, nonatomic) NSArray* q31AArray;
@property (strong, nonatomic) NSArray* q30AArray;
@property (strong, nonatomic) NSArray* q29AArray;

@property (weak, nonatomic) IBOutlet UILabel *q29title;
@property (weak, nonatomic) IBOutlet UILabel *q30title;
@property (weak, nonatomic) IBOutlet UILabel *q31title;
@property (weak, nonatomic) IBOutlet UILabel *q32title;


@end

@implementation Question29to32

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.q29AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q29answer8", nil),NSLocalizedString(@"q29answer1", nil),NSLocalizedString(@"q29answer2",nil),NSLocalizedString(@"q29answer3",nil),NSLocalizedString(@"q29answer4",nil),NSLocalizedString(@"q29answer5",nil),nil];
    self.q29A.dataSource = self;
    self.q29A.delegate = self;
    
    self.q31AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q29answer8", nil),NSLocalizedString(@"q29answer1", nil),NSLocalizedString(@"q29answer2",nil),NSLocalizedString(@"q29answer3",nil),NSLocalizedString(@"q29answer4",nil),NSLocalizedString(@"q29answer5",nil),nil];
    self.q31A.dataSource = self;
    self.q31A.delegate = self;
    
    self.q30AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q30answer8", nil),NSLocalizedString(@"q30answer1", nil),NSLocalizedString(@"q30answer2",nil),NSLocalizedString(@"q30answer3",nil),NSLocalizedString(@"q30answer4",nil),NSLocalizedString(@"q30answer5",nil),nil];
    self.q30A.dataSource = self;
    self.q30A.delegate = self;
    
    self.q32AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q30answer8", nil),NSLocalizedString(@"q30answer1", nil),NSLocalizedString(@"q30answer2",nil),NSLocalizedString(@"q30answer3",nil),NSLocalizedString(@"q30answer4",nil),NSLocalizedString(@"q30answer5",nil),nil];
    self.q32A.dataSource = self;
    self.q32A.delegate = self;

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.q29A){
        return [self.q29AArray  objectAtIndex:row];
    }
    if (pickerView == self.q30A){
        return [self.q30AArray  objectAtIndex:row];
    }
    if (pickerView == self.q31A){
        return [self.q31AArray  objectAtIndex:row];
    }

    return [self.q32AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.q29A){
    return [self.q29AArray count];
    }
    if (pickerView == self.q29A){
        return [self.q30AArray count];
    }
    if (pickerView == self.q29A){
        return [self.q31AArray count];
    }
    return [self.q32AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSInteger q29Avalue=8;
    if ([self.q29A selectedRowInComponent:0]) {
    q29Avalue=[self.q29A selectedRowInComponent:0];
    }
    NSInteger q30Avalue=8;
    if ([self.q30A selectedRowInComponent:0]) {
        q30Avalue=[self.q30A selectedRowInComponent:0];
    }
    NSInteger q31Avalue=8;
    if ([self.q31A selectedRowInComponent:0]) {
        q31Avalue=[self.q29A selectedRowInComponent:0];
    }
    NSInteger q32Avalue=8;
    if ([self.q32A selectedRowInComponent:0]) {
        q32Avalue=[self.q29A selectedRowInComponent:0];
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q29Avalue],[NSString stringWithFormat:@"%d",q30Avalue],[NSString stringWithFormat:@"%d", q31Avalue], [NSString stringWithFormat:@"%d", q32Avalue],nil];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
