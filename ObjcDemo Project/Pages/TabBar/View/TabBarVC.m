//
//  TabBarVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import "TabBarVC.h"
#import "CustomTabBar.h"

@interface TabBarVC ()

@end
//MARK: - TabBarVC
@implementation TabBarVC

CustomTabBar *customTabBar;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabbar];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavBar];
}

-(void) setNavBar{
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"NeoSTORE";
    self.navigationItem.backButtonTitle = @"";
}

- (void)setTabbar{
    customTabBar = [[CustomTabBar alloc] init];
    [self setValue:customTabBar forKey:@"tabBar"];
    
    // Create instances of the view controllers
    HomeVC *homeVC = [[HomeVC alloc] init];
    ProfileVC *profileVC = [[ProfileVC alloc] init];
    CartVC *cartVC = [[CartVC alloc] init];
    
    // Set titles and tab bar icons for each view controller
    profileVC.title = @"Profile";
    profileVC.tabBarItem.image = [UIImage systemImageNamed:@"person.fill"] ;
    
    homeVC.title = @"Home";
    homeVC.tabBarItem.image = [UIImage systemImageNamed:@"house.fill"];
    
    cartVC.title = @"Cart";
    cartVC.tabBarItem.image = [UIImage systemImageNamed:@"cart.fill"];
    
    // Create an array of view controllers
    NSArray *vc = @[profileVC, homeVC, cartVC];
    self.viewControllers = vc;
    
    self.tabBar.backgroundColor = [UIColor colorNamed:@"secondary"];
    self.tabBar.tintColor = UIColor.whiteColor;
    self.tabBar.barTintColor = [UIColor colorNamed:@"secondary"];
    self.tabBar.unselectedItemTintColor = [UIColor colorNamed:@"primary"];
    self.tabBar.translucent = NO;
    self.selectedIndex = 1;
    
}
@end
