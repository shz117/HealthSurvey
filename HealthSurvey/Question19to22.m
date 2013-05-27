//
//  Question19to22.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question19to22.h"
#import "HealthSurveyModelController.h"

@interface Question19to22 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q19A;
@property (weak, nonatomic) IBOutlet UITextField *q20tx;
@property (weak, nonatomic) IBOutlet UISwitch *q21sw;
@property (weak, nonatomic) IBOutlet UITextField *q22tx;
@property (weak, nonatomic) IBOutlet UILabel *q20title;
@property (weak, nonatomic) IBOutlet UILabel *q22title;
@property (strong, nonatomic) NSArray* q19AArray;
@property (weak, nonatomic) IBOutlet UILabel *q19title;
@end

@implementation Question19to22
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.q19AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q19answer8", nil),NSLocalizedString(@"q19answer1", nil),NSLocalizedString(@"q19answer2",nil),NSLocalizedString(@"q19answer3",nil),NSLocalizedString(@"q19answer4",nil),nil];
    self.q19A.dataSource = self;
    self.q19A.delegate = self;
    
    self.q19title.hidden=self.q19A.hidden=![[self.HealthSurveyModelController.globalData objectForKeyedSubscript:@"q19IsHidden"] boolValue];
   


}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
        return [self.q19AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
        return [self.q19AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults{
    NSInteger q19Avalue=8;
    if ([self.q19A selectedRowInComponent:0]){
    q19Avalue=[self.q19A selectedRowInComponent:0];
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q19Avalue],[NSString stringWithFormat:@"%@",self.q20tx.text],[NSString stringWithFormat:@"%d", self.q21sw.isOn], [NSString stringWithFormat:@"%@", self.q22tx.text],nil];
}










- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
