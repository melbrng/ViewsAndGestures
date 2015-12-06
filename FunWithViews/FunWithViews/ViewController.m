//
//  ViewController.m
//  FunWithViews
//
//  Created by Melissa Boring on 12/5/15.
//  Copyright © 2015 melbo. All rights reserved.
//

#import "ViewController.h"
#import "AnotherViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *testLabel;
@property (nonatomic,strong) UITapGestureRecognizer *tapped;
@property (nonatomic,strong) UITapGestureRecognizer *borderTapped;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.borderTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBorderTap:)];
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    [window makeKeyAndVisible];
    window.hidden = NO;
    [window addGestureRecognizer:self.borderTapped];
    
    self.testLabel = [[UILabel alloc]init];
    [self.testLabel setFrame:CGRectMake(20, 200, 200, 50)];
    [self.testLabel setBackgroundColor:[UIColor orangeColor]];
    [self.testLabel setText:@"Melbo Rocks!"];
    
    [self.view addSubview:self.testLabel];
    
    self.tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:self.tapped];
    
    NSLog(window.isKeyWindow ? @"YES":@"NO");
    
    NSLog(@"%@",self.borderTapped.view);
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(anotherPressed:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)sender
{
    [self.testLabel setText:@"I've been tapped"];
    
    CGPoint tappedPoint = [self.tapped locationInView:self.view];
    NSLog(@"%f , %f" ,tappedPoint.x, tappedPoint.y);
    
    CGPoint locationOfTouch = [self.tapped locationOfTouch:0 inView:self.view
                           ];
    NSLog(@"%f , %f" ,locationOfTouch.x, locationOfTouch.y);

}

- (void)handleBorderTap:(UITapGestureRecognizer *)sender
{
    
    CGPoint tappedPoint = [self.borderTapped locationInView:self.view];
    NSLog(@"handleBorderTap %f , %f" ,tappedPoint.x, tappedPoint.y);
    
    [self.testLabel setText:@"Border tapped"];
    
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void) anotherPressed:(UIBarButtonItem *) sender
{
    AnotherViewController *anotherViewC = [[AnotherViewController alloc] init];
    [anotherViewC.view setFrame:CGRectMake(10, 10, 50, 100)];
    anotherViewC.view.backgroundColor = [UIColor grayColor];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:anotherViewC];

    nav.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popoverController = nav.popoverPresentationController;
    popoverController.barButtonItem = sender;

    [self presentViewController:nav animated:YES completion:nil];
}

@end
