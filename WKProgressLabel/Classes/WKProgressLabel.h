//
//  WKProgressLabel.h
//  howear
//
//  Created by weike on 2022/3/23.
//  Copyright © 2022 Wake. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKProgressLabel : UILabel

/// progress like : 0.23 max value is 1.0.Keep updating this value when you get a progress from you downloading misstion.
@property (nonatomic,assign) float progress;

/// The strokeColor of shapeLayer
@property (nonatomic,strong) UIColor * strokeColor;

@end

NS_ASSUME_NONNULL_END
