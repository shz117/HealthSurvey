//
//  Welcome.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/22/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Welcome.h"

@interface Welcome ()
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UILabel *introcontent;
@property (weak, nonatomic) IBOutlet UILabel *adult;
@property (weak, nonatomic) IBOutlet UILabel *abb;
@property (weak, nonatomic) IBOutlet UILabel *intro;

@end

@implementation Welcome


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    _introcontent.text = NSLocalizedString(@"introcontent", nil);
//    _introcontent.lineBreakMode = UILineBreakModeWordWrap;
//    _introcontent.numberOfLines = 0;
//    _Title.text = NSLocalizedString(@"Title", nil);
//    _adult.text = NSLocalizedString(@"adult", nil);
//    _abb.text = NSLocalizedString(@"abb", nil);
//    _intro.text = NSLocalizedString(@"intro", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
