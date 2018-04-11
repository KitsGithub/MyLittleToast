//
//  MainViewController.m
//  LittleToast
//
//  Created by Mr_kit on 2018/3/31.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "MainViewController.h"
#import "BaseViewController.h"
#import "BaseNavigationController.h"

#import "AccountController.h"
#import "MineViewController.h"


@interface MainViewController ()

@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *vcArr;
@property (nonatomic, strong) NSMutableArray *imgArr;
@property (nonatomic, strong) NSMutableArray *selImgArr;

@end

@implementation MainViewController {
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //去除顶部很丑的border
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    //自定义分割线颜色
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(self.tabBar.bounds.origin.x, self.tabBar.bounds.origin.y, self.tabBar.bounds.size.width, 0.5)];
    bgView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.1].CGColor;
    bgView.layer.borderWidth = 0.5;
    bgView.alpha = 0.6;
    bgView.layer.shadowPath = [UIBezierPath bezierPathWithRect:bgView.layer.bounds].CGPath;
    bgView.layer.shadowColor = [[UIColor blackColor] CGColor];//阴影的颜色
    bgView.layer.shadowOpacity = 0.15f;   // 阴影透明度
    bgView.layer.shadowOffset =CGSizeMake(0.0,-0.7f); // 阴影的范围
    bgView.layer.shadowRadius = .7;  // 阴影扩散的范围控制
    [self.tabBar insertSubview:bgView atIndex:0];
//    tab.opaque = YES;

    
    //初始化基础页面
    for (NSInteger i = 0; i < self.titleArr.count; i++) {
        [self addChildViewWithView:self.vcArr[i] name:self.titleArr[i] tag:i];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addChildViewWithView:(UIViewController *)childVc name:(NSString *)name tag:(NSInteger)tag{
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [[UIImage imageNamed:self.imgArr[tag]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:self.selImgArr[tag]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:COLOR_THEME forKey:NSForegroundColorAttributeName];
    [childVc.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
    childVc.title = name;
    
    
    childVc.view.backgroundColor = [UIColor whiteColor]; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    //包装导航栏
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [NSMutableArray arrayWithObjects:@"记账",@"账户",@"成员",@"我的", nil];
    }
    return _titleArr;
}

- (NSMutableArray *)vcArr {
    if (!_vcArr) {
        //记账
        AccountController *accounting = [AccountController new];
        //账户
        BaseViewController *cards = [BaseViewController new];
        //成员
        BaseViewController *menbers = [BaseViewController new];
        //我的
        MineViewController *mine = [MineViewController new];
        
        _vcArr = [NSMutableArray arrayWithObjects:accounting,cards,menbers,mine, nil];
    }
    return _vcArr;
}

- (NSMutableArray *)imgArr {
    if (!_imgArr) {
        _imgArr = [NSMutableArray arrayWithObjects:@"Accounting",@"Cards",@"Member",@"Mine", nil];
    }
    return _imgArr;
}

- (NSMutableArray *)selImgArr {
    if (!_selImgArr) {
        _selImgArr = [NSMutableArray arrayWithObjects:@"Accounting_selected",@"Cards_selected",@"Member_selected",@"Mine_selected", nil];
    }
    return _selImgArr;
}

@end
