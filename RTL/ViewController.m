//
//  ViewController.m
//  RTL
//
//  Created by Arash on 5/21/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"
#import "Header.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *changeLanguageButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

 
    _a.text = [@"hi" localize];
    _a.backgroundColor = [UIColor redColor];
   

    
   
    _a2.text = [@"bye" localize];
    _a2.backgroundColor = [UIColor redColor];
   
    
   
    [_changeLanguageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_changeLanguageButton setTitle:[@"setting" localize] forState:UIControlStateNormal];
    [_changeLanguageButton addTarget:self action:@selector(changeLanguageButtonAction) forControlEvents:UIControlEventTouchUpInside];
  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage:) name:@"notificationName" object:nil];
}

-(void)changeLanguage:(NSNotification*)notification
{
     [_changeLanguageButton setTitle:[@"setting" localize] forState:UIControlStateNormal];
    _a.text = [@"hi" localize];
   _a2.text = [@"bye" localize];
}


- (void)changeLanguageButtonAction{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SettingViewController *view = (SettingViewController *)[story instantiateViewControllerWithIdentifier:@"SettingViewController"];
    [self.navigationController pushViewController:view animated:YES];
}



@end
