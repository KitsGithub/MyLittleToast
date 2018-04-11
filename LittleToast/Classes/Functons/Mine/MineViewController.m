//
//  MineViewController.m
//  LittleToast
//
//  Created by Mr_kit on 2018/4/10.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "MineViewController.h"


#import "UINavigationController+XWTransition.h"
#import "UIViewController+XWTransition.h"
#import "XWCircleSpreadAnimator.h"



@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupView {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    button.backgroundColor = COLOR_THEME;
    [button addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)logout {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
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
