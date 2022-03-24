//
//  WKProgressLabel.m
//  howear
//
//  Created by weike on 2022/3/23.
//  Copyright © 2022 Wake. All rights reserved.
//

#import "WKProgressLabel.h"

@implementation WKProgressLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
            
    [[self.layer sublayers] makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    CAShapeLayer * progressLayer = [CAShapeLayer layer];
    [self.layer addSublayer:progressLayer];
    progressLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    progressLayer.lineWidth = CGRectGetHeight(self.frame);
    progressLayer.strokeColor = self.strokeColor.CGColor;
    progressLayer.lineCap = kCALineCapButt;
    progressLayer.strokeStart = 0;
    progressLayer.strokeEnd = self.progress;

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, progressLayer.frame.size.height / 2)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, progressLayer.frame.size.height / 2)];
    progressLayer.path = path.CGPath;

}

- (void)setProgress:(float)progress{
        
    _progress = progress;

    if(progress < 1.0){
        self.text = [NSString stringWithFormat:@"%.0f%@",progress * 100,@"%"];
    }else{
        self.text = @"100%";
    }

}

@end
