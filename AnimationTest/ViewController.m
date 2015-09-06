//
//  ViewController.m
//  AnimationTest
//
//  Created by LXJ on 15/9/2.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "ViewController.h"

typedef enum _animationType {
    ViewMove,     //首尾移动
    Scale,        //放大缩小
    Rotation,     //旋转
    Translation   //移动
} animationType;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"动画执行前的位置：%@",NSStringFromCGPoint(self.animationView.center));
    
    int i = 1;
    
    switch (i) {
        case 0:
            [self move];
            break;
        case 1:
            [self scale];
            break;
        case 2:
            [self rotation];
            break;
        case 3:
            [self viewMove];
            break;
        default:
            break;
    }
}

//移动
- (void)move {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.f];
    [UIView setAnimationDelegate:self];
    self.animationView.center = CGPointMake(200, 300);
    [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
    [UIView commitAnimations];
}

//缩放
- (void)scale {
    [UIView animateWithDuration:2.f animations:^{
        self.animationView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 50);
        self.animationView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    } completion:^(BOOL finished) {
        
    }];
}

//旋转
- (void)rotation {
    [UIView animateWithDuration:2.f animations:^{
        self.animationView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } completion:^(BOOL finished) {
        
    }];
}

//移动
- (void)viewMove {
    [UIView animateWithDuration:2.f animations:^{
        self.animationView.transform = CGAffineTransformMakeTranslation(100, 100);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didStopAnimation {
    NSLog(@"动画执行完毕");
    NSLog(@"动画执行完毕的位置：%@",NSStringFromCGPoint(self.animationView.center));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
