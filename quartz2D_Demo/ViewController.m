//
//  ViewController.m
//  quartz2D_Demo
//
//  Created by admin on 16/6/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//
//http://www.jianshu.com/p/98929b9aca25
//iOS利用`quartz2D`绘出tabBar的背景图片

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configTabBars];

}


-(void)configTabBars{
    
    CGSize tabSize = CGSizeMake(100, 100);
    UIGraphicsBeginImageContext(tabSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw whole image background color
    CGContextSetFillColorWithColor(context,[UIColor redColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, tabSize.width, tabSize.height));
    
    // draw special middle item color
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGFloat width=tabSize.width/5;
    CGContextFillRect(context, CGRectMake(width*2, 0, width, tabSize.height));
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imgView.image = img;
    [self.view addSubview:imgView];
}



@end
