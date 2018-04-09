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
 主题颜色
 */
#define ThemeColor [UIColor colorFormHexRGB:@"FFAE01"]

#define TextColor [UIColor colorFormHexRGB:@"333333"]
#define SubTextColor [UIColor colorFormHexRGB:@"666666"]
#define TipsColor [UIColor colorFormHexRGB:@"999999"]
#define SepoartColor [UIColor colorFormHexRGB:@"E5E5E5"]


//userInfo路径
#define USERINFO_PATH [DocumentPATH stringByAppendingPathComponent:@"USERINFO.plist"]

//沙盒路径
#define DocumentPATH  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//数据库路径
#define DBPath [DocumentPATH stringByAppendingPathComponent:@"SFWL_DataBase.sqlite"]



#endif /* content_h */
