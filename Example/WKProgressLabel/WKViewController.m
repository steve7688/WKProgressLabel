//
//  WKViewController.m
//  WKProgressLabel
//
//  Created by steve7688@163.com on 03/23/2022.
//  Copyright (c) 2022 steve7688@163.com. All rights reserved.
//

#import "WKViewController.h"
#import "WKProgressLabel.h"

@interface WKViewController ()

@property (nonatomic,strong) WKProgressLabel * progressLabel;

@end

@implementation WKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.progressLabel];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Start Download" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startDownload:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(40, 160, CGRectGetWidth([UIScreen mainScreen].bounds) - 80, 44);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 8;
    [self.view addSubview:button];

}

-(void)startDownload:(UIButton *)sender{
    
    sender.hidden = YES;
    
    __block float progress = 0.0f;
    __weak typeof(self) weakSelf = self;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        progress+=0.03;

        if(progress < 1.0){
            weakSelf.progressLabel.progress = progress;
        }else{
            weakSelf.progressLabel.progress = 1.0;
            [timer invalidate];
            timer = nil;
            
            sender.hidden = NO;

        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (WKProgressLabel *)progressLabel{
    
    if(!_progressLabel){
        
        //You can customize the appearance of WKProgressLabel by setting these OFFICIAL properties below:
        _progressLabel = [[WKProgressLabel alloc] initWithFrame:CGRectMake(40, 100, CGRectGetWidth([UIScreen mainScreen].bounds) - 80, 44)];
        _progressLabel.layer.masksToBounds = YES;
        _progressLabel.layer.cornerRadius = 22.f;
        _progressLabel.backgroundColor = [UIColor clearColor];
        _progressLabel.layer.borderWidth = .5f;
        _progressLabel.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.8].CGColor;
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor blackColor];
        _progressLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        _progressLabel.strokeColor = [[UIColor redColor] colorWithAlphaComponent:0.16];

    }
    
    return _progressLabel;
}


@end
