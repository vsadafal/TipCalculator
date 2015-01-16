//
//  SettingViewController.m
//  TipCalculator
//
//  Created by Videsh Sadafal on 1/15/15.
//  Copyright (c) 2015 Videsh Sadafal. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipDefaultPercent;
@property (weak, nonatomic) IBOutlet UISlider *tipDefaultSlider;

@end

@implementation SettingViewController
@synthesize tipDefaultPercent, tipDefaultSlider;

- (IBAction)onChange:(UISlider *)sender {
    int value = tipDefaultSlider.value;
    NSString *valueStr = [NSString stringWithFormat:@"%d", value];
    tipDefaultPercent.text = valueStr;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:value forKey:@"defaultTip"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    tipDefaultSlider.value = [defaults floatForKey:@"defaultTip"];
    tipDefaultPercent.text = [NSString stringWithFormat:@"%d", (int)tipDefaultSlider.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
