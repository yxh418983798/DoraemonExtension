//
//  AFViewController.m
//  DoraemonExtension
//
//  Created by Alfie on 08/12/2022.
//  Copyright (c) 2022 Alfie. All rights reserved.
//

#import "AFViewController.h"
#import <DoraemonKit/DoraemonManager.h>

@interface AFViewController ()

@end

@implementation AFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [NSUserDefaults.standardUserDefaults setBool:YES forKey:@"doraemon_nslog_key"];
    [[DoraemonManager shareInstance] install];

    for (int i = 0; i < 1000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"-------------------------- 测试：%i %@--------------------------", i, NSThread.currentThread);
        });
    }
    

    for (int i = 0; i < 10000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"-------------------------- 测试：%i %@--------------------------", i, NSThread.currentThread);
        });
    }
    
    for (int i = 0; i < 1000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"-------------------------- 测试：%i %@--------------------------", i, NSThread.currentThread);
        });
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
