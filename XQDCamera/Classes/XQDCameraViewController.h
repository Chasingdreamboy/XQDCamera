//
//  CameraViewController.h
//  gongfudai
//
//  Created by David Lan on 15/7/8.
//  Copyright (c) 2015年 dashu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQDCameraHolderViewController.h"
typedef NS_ENUM(NSInteger, XQDCameraViewPlaceholderType){
    XQDCameraViewPlaceholderTypeFront,
    XQDCameraViewPlaceholderTypeBack,
    XQDCameraViewPlaceholderTypeWithCard
};

@interface XQDCameraViewController : UIViewController
@property(nonatomic,strong) id<XQDCameraHolderViewDelegate> delegate;
@property(nonatomic)XQDCameraViewPlaceholderType placeHolderType;

//点击取消的回调事件
@property (copy, nonatomic) void(^cancel)();
//拍照成功回调
@property (copy, nonatomic) void(^finishBlock)(UIImage *image);
@end
