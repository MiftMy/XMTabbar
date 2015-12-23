//
//  XXViewController.m
//  XMTabbar
//
//  Created by mifit on 15/11/6.
//  Copyright © 2015年 mifit. All rights reserved.
//

#import "XXViewController.h"

@interface XXViewController ()
@property (nonatomic,strong) UIImageView *iv;
@end

@implementation XXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UITabBar *tabBar = self.tabBar;
    [tabBar setTintColor:[UIColor colorWithRed:195/255.0 green:13/255.0 blue:34/255.0 alpha:1.0]];
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UIImage *iamge = [UIImage imageNamed:@"applictionY"];
    
    tabBarItem1.selectedImage = [iamge imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"controlN"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"myInfoY"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    /// 去掉黑线，不然图片被截取
    self.tabBar.shadowImage = [[UIImage alloc]init];
    self.tabBar.backgroundImage = [[UIImage alloc]init];
    
    CGFloat addH = 18;
    CGRect r = self.tabBar.frame;
    r.origin.y = -addH;
    r.size.height += addH;
    UIImageView *bgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbarBG"]];
    bgIV.frame = r;
    [self.tabBar insertSubview:bgIV belowSubview:[self.tabBar.subviews objectAtIndex:0]];
    
    UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"controlMidN"] highlightedImage:[UIImage imageNamed:@"controlMidY"]];
    CGRect rect = self.tabBar.frame;
    rect.origin.y = -addH;
    rect.origin.x = (rect.size.width - 90)/2;
    rect.size.width = 90;
    rect.size.height += addH;
    iv.frame = rect;
    self.iv = iv;
    [self.tabBar insertSubview:iv aboveSubview:[self.tabBar.subviews objectAtIndex:0]];
    [self.tabBar addObserver:self forKeyPath:@"selectedItem" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"selectedItem"]) {
        if ([((UIBarItem *)[change valueForKey:@"new"]).title isEqualToString:@"遥控器"]) {
            self.iv.highlighted = YES;
        } else {
            self.iv.highlighted = NO;
        }
    }
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
