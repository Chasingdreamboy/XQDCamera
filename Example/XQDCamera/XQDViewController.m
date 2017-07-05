//
//  XQDViewController.m
//  XQDCamera
//
//  Created by acct<blob>=<NULL> on 06/29/2017.
//  Copyright (c) 2017 acct<blob>=<NULL>. All rights reserved.
//

#import "XQDViewController.h"
#import <XQDCamera/XQDCamera.h>

@interface XQDViewController ()<XQDCameraHolderViewDelegate>

@end

@implementation XQDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    XQDCameraViewController *camera = [[XQDCameraViewController alloc] init];
    camera.placeHolderType = XQDCameraViewPlaceholderTypeFront;
    camera.delegate = self;
//    camera.finishBlock = ^(UIImage *image) {
//        
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//        [imageView setImage:image];
//        [self.view addSubview:imageView];
//        
//    };
    
    [self presentViewController:camera animated:YES completion:nil];
}
- (void)photoTaken:(UIImage *)img {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setImage:img];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
