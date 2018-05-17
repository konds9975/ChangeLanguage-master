//
//  SettingViewController.m
//  RTL
//
//  Created by Arash on 5/21/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "SettingViewController.h"
#import "AppDelegate.h"
#import "NSBundle+Language.h"
#import "Header.h"
@interface SettingViewController ()
{
    
    __weak IBOutlet UIButton *englishButton;
    __weak IBOutlet UIButton *farsiButton;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [farsiButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [farsiButton setTitle:[@"farsi" localize] forState:UIControlStateNormal];
    [farsiButton addTarget:self action:@selector(farsiButtonAction) forControlEvents:UIControlEventTouchUpInside];
   

  
    [englishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [englishButton setTitle:[@"english" localize] forState:UIControlStateNormal];
    [englishButton addTarget:self action:@selector(englishButtonAction) forControlEvents:UIControlEventTouchUpInside];
  
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage:) name:@"notificationName" object:nil];
}

-(void)changeLanguage:(NSNotification*)notification
{
    [englishButton setTitle:[@"english" localize] forState:UIControlStateNormal];
     [farsiButton setTitle:[@"farsi" localize] forState:UIControlStateNormal];
}



- (void)farsiButtonAction{
    [[NSUserDefaults standardUserDefaults]setObject:@[@"fa", @"en"] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSBundle *langBundle = [[NSBundle alloc]init];
    [langBundle setLanguage:@"fa"];
     [[NSUserDefaults standardUserDefaults]setObject:@"fa" forKey:@"selectedLanguage"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationName" object:nil];
    
    
}


- (void)englishButtonAction{
    [[NSUserDefaults standardUserDefaults]setObject:@[@"en", @"fa"] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSBundle *langBundle = [[NSBundle alloc]init];
    [langBundle setLanguage:@"en"];
      [[NSUserDefaults standardUserDefaults]setObject:@"en" forKey:@"selectedLanguage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationName" object:nil];
    

    
}

@end
