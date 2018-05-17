//
//  SplashViewController.m
//  RTL
//
//  Created by Arash on 5/21/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "SplashViewController.h"
#import "ViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
   
    _aLabel.text = [@"welcome" localize];
    [self performSelector:@selector(nextView) withObject:nil afterDelay:2.0];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage:) name:@"notificationName" object:nil];
}

-(void)changeLanguage:(NSNotification*)notification
{
     _aLabel.text = [@"welcome" localize];
}


- (void)nextView{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *view = (ViewController *)[story instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:view animated:YES];
}

@end
