//
//  JKViewController.m
//  JKUBSAspects
//
//  Created by HHL110120 on 06/04/2017.
//  Copyright (c) 2017 HHL110120. All rights reserved.
//

#import "JKViewController.h"
#import <JKUBSAspects/JKUBSAspects.h>

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  UIButton *button = [UIButton new];
[button setTitle:@"点击" forState:UIControlStateNormal];
[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
button.frame = CGRectMake(0, 0, 100, 30);
button.center = self.view.center;
[button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:button];
 
    [self aspect_hookSelector:@selector(viewWillAppear:) withOptions:JKUBSAspectPositionBefore usingBlock:^(id<JKUBSAspectInfo> data){
        NSLog(@"MMM_1");
    } error:nil];
    
    [JKViewController aspect_hookClassSelector:@selector(doSomething) withOptions:JKUBSAspectPositionBefore usingBlock:^(id<JKUBSAspectInfo> data){
        NSLog(@"doSomething_1");
    } error:nil];

}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"MMM");
}

#pragma mark - - - - UIEvent - - - -
- (void)buttonClicked{
    [JKViewController doSomething];
}

+ (void)doSomething{
    NSLog(@"doSomething");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
