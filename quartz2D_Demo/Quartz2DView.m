//
//  Quartz2DView.m
//  quartz2D_Demo
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "Quartz2DView.h"

@implementation Quartz2DView

#pragma mark - 画一条简单的线
//方法一
- (void)drawLine1{
    // 1.获取图像上下文
    // 目前我们所用的上下文都是UIGraphics开头的
    // CGContextRef Ref:引用 CG：目前使用到的类型和函数一般都是CG开头 CoreGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.描述路径
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    // 设置起点
    // path：给哪个路径设置起点
    CGPathMoveToPoint(path, NULL, 100, 80);
    // 添加一根线到某个点
    CGPathAddLineToPoint(path, NULL, 150, 150);
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path);
    // 4.渲染上下文
    CGContextStrokePath(ctx);
}

//方法二
-(void)drawLine2 {
    // 1.获取图像上下文
    // 目前我们所用的上下文都是UIGraphics开头的
    // CGContextRef Ref:引用 CG：目前使用到的类型和函数一般都是CG开头 CoreGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.描述路径
    // 设置起点
    CGContextMoveToPoint(ctx, 20, 40);
    // 设置某个线从某个点(里面封装了添加到上下文的代码)
    CGContextAddLineToPoint(ctx, 250, 250);
    // 3.渲染上下文
    CGContextStrokePath(ctx);
}

//方法三
- (void)drawLine3{
    // 贝瑟尔路径
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 设置起点
    [path moveToPoint:CGPointMake(50, 50)];
    // 添加一根线到某个点
    [path addLineToPoint:CGPointMake(200, 200)];
    // 绘制路径
    [path stroke];
}


#pragma mark - 绘制基本形状
//方法一
- (void)drawCtxState1
{
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 描述路径
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 50);
    // 设置起点
    CGContextMoveToPoint(ctx, 80, 60);
    // 如果不重新设置起点，默认下一根线的起点是上一根线的终点
    CGContextAddLineToPoint(ctx, 100, 200);
    // 设置绘图状态, 一定要在渲染之前
    // 颜色
    [[UIColor greenColor] setStroke];
    // 线宽
    CGContextSetLineWidth(ctx, 5);
    // 设置连接样式(kCGLineJoinRound 圆角， kCGLineJoinMiter直角， kCGLineJoinBevel正切 缺一个角)
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    // 设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 渲染上下文
    CGContextStrokePath(ctx);
}
//方法二
- (void)drawCtxState2
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(200, 200)];
    path.lineWidth = 5;
    [[UIColor redColor] set];
    [path stroke];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0, 0)];
    [path1 addLineToPoint:CGPointMake(30, 60)];
    [[UIColor greenColor] set];
    path1.lineWidth = 5;
    [path1 stroke];
}
#pragma mark - 绘制曲线
-(void)drawCircleLine1{
    // Drawing code
    // 如何绘制曲线
    // 原声绘制方法
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 描述路径
    // 设置起点
    CGContextMoveToPoint(ctx, 100, 100);
    // cpx：控制点的x
    CGContextAddQuadCurveToPoint(ctx, 150, 50, 250, 50);
    // 渲染上下文
    CGContextStrokePath(ctx);
}


#pragma mark - 圆角矩形
-(void)drawRoundAngle1{
    // 圆角矩形
     UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:10];
    [path stroke];
    // 填充：必须是一个完整的封闭路径, 默认会自动关闭路径
     [path fill];
}


#pragma mark - 圆弧&扇形
-(void)drawCircleAndFan1{
    // 圆弧
    // center:圆心
    // startAngle：弧度 M_PI:180度 clockwise:yes是顺时针 no逆时针
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 250) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [[UIColor purpleColor] set];
    
    // 扇形
    CGPoint center = CGPointMake(150, 250);
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    // 添加一根线到圆心
    [path addLineToPoint:center];
    // 封闭路径，关闭路径，从路径的终点到起点
    [path closePath];
    
    [path stroke];
    // 填充：必须是一个完整的封闭路径, 默认会自动关闭路径
    [path fill];
}

#pragma mark - 绘制文字
-(void)drawText1{
    // 绘制文字
    NSString *str = @"Draw";
    // 文字的起点
    // Attributes 文本属性
    NSMutableDictionary *textDic = [NSMutableDictionary dictionary];
    // 设置文字颜色等属性
    textDic[NSForegroundColorAttributeName] = [UIColor redColor];
    textDic[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    // 设置文字的空心颜色和宽度
    textDic[NSStrokeWidthAttributeName] = @3;
    textDic[NSStrokeColorAttributeName] = [UIColor yellowColor];
    // 创建阴影对象
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor purpleColor];
    shadow.shadowOffset = CGSizeMake(10, 10);
    shadow.shadowBlurRadius = 5;
    textDic[NSShadowAttributeName] = shadow;
    // 富文本，给普通的文字添加颜色，字体大小
    [str drawAtPoint:CGPointZero withAttributes:textDic];
}

-(void)drawRect:(CGRect)rect{
//绘制直线
    
//    [self drawLine1];
//    [self drawLine2];
//    [self drawLine3];
    
//绘制基本曲线

//    [self drawCtxState1];
//    [self drawCtxState2];
    
//绘制曲线
    
//    [self drawCircleLine1];
    
//圆角矩形
//    [self drawRoundAngle1];
    
//圆弧扇形
//    [self drawCircleAndFan1];
    
//绘制文字
    [self drawText1];
}

@end
