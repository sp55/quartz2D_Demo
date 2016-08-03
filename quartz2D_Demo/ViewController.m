//
//  ViewController.m
//  quartz2D_Demo
//
//  Created by admin on 16/6/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//
//http://www.jianshu.com/p/98929b9aca25
//iOS利用`quartz2D`绘出tabBar的背景图片
//http://www.jianshu.com/p/6d70bb688023

#import "ViewController.h"
#import "Quartz2DView.h"
@interface ViewController ()
@property(strong,nonatomic)Quartz2DView *qzView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self configTabBars];

    [self qzViewText];
}
#pragma mark   - draw Rect
-(void)qzViewText
{
    self.qzView=[[Quartz2DView alloc] initWithFrame:self.view.bounds];
    self.qzView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.qzView];
}

#pragma mark -quartz2D画出图片
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
