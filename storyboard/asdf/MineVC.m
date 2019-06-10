//
//  MineVC.m
//  asdf
//
//  Created by 胡占峰 on 2019/5/18.
//  Copyright © 2019年 八维教育. All rights reserved.
//

#import "MineVC.h"
#import "MineTBV.h"

@interface MineVC ()
- (IBAction)btnClick:(UIButton *)sender;

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnClick:(UIButton *)sender {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Mine" bundle:[NSBundle mainBundle]];
    MineTBV* mtb = [storyboard instantiateViewControllerWithIdentifier:@"MineTBV"];
    
    [self.navigationController pushViewController:mtb animated:YES];
    
}
@end
