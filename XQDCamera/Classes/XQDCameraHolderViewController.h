//
//  ImageViewController.h
//  LLSimpleCameraExample
//
//  Created by Ömer Faruk Gül on 15/11/14.
//  Copyright (c) 2014 Ömer Faruk Gül. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,XQDCameraHolderViewPlaceholderType) {
    ImageViewPlaceholderTypeFront,
    ImageViewPlaceholderTypeBack,
    ImageViewPlaceholderTypeWithCard
};

@protocol XQDCameraHolderViewDelegate <NSObject>
-(void)photoTaken:(UIImage*)img;
@end

@interface XQDCameraHolderViewController : UIViewController
@property(nonatomic,strong) id<XQDCameraHolderViewDelegate> delegate;
@property(nonatomic,strong) UIImage* image;
@property(nonatomic)XQDCameraHolderViewPlaceholderType placeHolderType;

@property (copy, nonatomic) void(^resetPhoto)(XQDCameraHolderViewController *holder);
@property (copy, nonatomic) void(^finishBlock)(UIImage *image);
@end
