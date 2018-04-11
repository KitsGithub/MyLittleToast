//
//  content.h
//  LittleToast
//
//  Created by Mr_kit on 2018/3/31.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#ifndef content_h
#define content_h

/**屏幕宽*/
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/**屏幕高*/
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//时间栏高度
#define STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
//导航栏内容高度
#define NavigationBar_Height 44
//导航栏整体高度
#define Navigation_Height STATUSBAR_HEIGHT + NavigationBar_Height


/**
 颜色
 */
#define COLOR_THEME [UIColor colorFormHexRGB:@"FFAE01"]
#define COLOR_TEXT [UIColor colorFormHexRGB:@"333333"]
#define COLOR_SUBTEXT [UIColor colorFormHexRGB:@"666666"]
#define COLOR_TIPS [UIColor colorFormHexRGB:@"999999"]
#define COLOR_SEPOARTE [UIColor colorFormHexRGB:@"E5E5E5"]
#define COLOR_WHITE [UIColor whiteColor]
#define CLOLR_BLACK [UIColor blackColor]

//userInfo路径
#define USERINFO_PATH [DocumentPATH stringByAppendingPathComponent:@"USERINFO.plist"]

//沙盒路径
#define DocumentPATH  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//数据库路径
#define DBPath [DocumentPATH stringByAppendingPathComponent:@"My_DataBase.sqlite"]


/** 项目间距配置 */
#define paddingLeft 20
#define MAX_SIZE CGSizeMake(MAXFLOAT, MAXFLOAT)

/** 常用字体 */
#define FONT_NORMAL [UIFont systemFontOfSize:14]
#define FONT_TITLE [UIFont systemFontOfSize:16]
#define FONT_BOLD [UIFont boldSystemFontOfSize:14]

#endif /* content_h */
