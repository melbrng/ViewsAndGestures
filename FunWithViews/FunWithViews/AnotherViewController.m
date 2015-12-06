//
//  AnotherViewController.m
//  FunWithViews
//
//  Created by Melissa Boring on 12/5/15.
//  Copyright © 2015 melbo. All rights reserved.
//

#import "AnotherViewController.h"

@interface AnotherViewController ()

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonPressed:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) backButtonPressed:(UIBarButtonItem *) sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
