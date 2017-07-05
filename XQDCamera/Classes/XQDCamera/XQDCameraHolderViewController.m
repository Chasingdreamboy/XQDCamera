//
//  XQDCameraHolderViewController
//
//  Created by david lan on 15/11/14.
//  Copyright (c) 2015 Hangzhou Tree Finance Ltd. All rights reserved.
//

#import "XQDCameraHolderViewController.h"
#import "XQDCameraViewController.h"
#import "UIView+Expand.h"
#import "XQDCameraHeader.h"


@interface XQDCameraHolderViewController (){
    
}
@property (weak, nonatomic) IBOutlet UIImageView *img_placeholder;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@end





@implementation XQDCameraHolderViewController
- (instancetype)init {
    self = [super initWithNibName:NSStringFromClass(self.class) bundle:getResourceBundle()];
    if(self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.backgroundColor = [UIColor blackColor];
    // ----- initialize placeholder -------- //
    if (_placeHolderType==ImageViewPlaceholderTypeFront) {
        UIImage *frontImage = getImageWithImageName(@"1080-1920-正面");
        
        _img_placeholder.image = frontImage;;
    }
    else if(_placeHolderType==ImageViewPlaceholderTypeBack){
        
        UIImage *backImage = getImageWithImageName(@"1080-1920-背面");
        _img_placeholder.image = backImage;
    }
    else{
        UIImage *blankImage = getImageWithImageName(@"1080-1920-空");
        _img_placeholder.image = blankImage;
    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    if (IS_Iphone4) {
        _img_placeholder.width=213;
        _img_placeholder.height=330;
        _img_placeholder.center=self.view.center;
        _img_placeholder.top=_img_placeholder.top-10;
    }
    
    if (_img_placeholder.width>270&&_placeHolderType!=ImageViewPlaceholderTypeWithCard) {
        _img_placeholder.width=270;
        _img_placeholder.height=419;
        _img_placeholder.center=self.view.center;
        _img_placeholder.top=_img_placeholder.top-10;
    }
    
    if(IS_Iphone6p_Or_Later&&_placeHolderType==ImageViewPlaceholderTypeWithCard){
        _img_placeholder.width=270*1.2;
        _img_placeholder.height=419*1.2;
        _img_placeholder.center=self.view.center;
        _img_placeholder.top=_img_placeholder.top-10;
    }
}

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)viewWillAppear:(BOOL)animated{
    [[UIApplication sharedApplication]setStatusBarHidden:YES];
    [self.imageView setImage:self.image];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(IBAction)eventConfirm:(id)sender{
    CGRect frame=CGRectMake(_img_placeholder.x-_imageView.x, _img_placeholder.y-_imageView.y, _img_placeholder.width, _img_placeholder.height);
    UIImage* img=nil;
    if (_placeHolderType==ImageViewPlaceholderTypeWithCard) {
//        img=[_image  normalizedImage];
        img = normalizedImage(_image);
    }
    else{
        UIImage *image = normalizedImage(_image);
        image = scaleToSize(image, self.imageView.size);
        img = crop(image, frame);
    }
    if (self.presentingViewController.presentingViewController) {
        [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:^{
            __strong UIImage* image=img;
            if(self.delegate&&[self.delegate respondsToSelector:@selector(photoTaken:)]){
                [self.delegate photoTaken:image];
            }
            if (self.finishBlock) {
                _finishBlock(image);
            }
        }];
    } else if(self.presentingViewController) {
        [self.presentingViewController dismissViewControllerAnimated:NO completion:^{
            __strong UIImage* image=img;
            if(self.delegate&&[self.delegate respondsToSelector:@selector(photoTaken:)]){
                [self.delegate photoTaken:image];
            }
            if (self.finishBlock) {
                _finishBlock(image);
            }
        }];
    } else {
        [self dismissViewControllerAnimated:NO completion:^{
            __strong UIImage* image=img;
            if(self.delegate&&[self.delegate respondsToSelector:@selector(photoTaken:)]){
                [self.delegate photoTaken:image];
            }
            if (self.finishBlock) {
                _finishBlock(image);
            }
        }];
    }
}

-(IBAction) eventCancel:(id)sender{
    if (self.resetPhoto) {
        self.resetPhoto(self);
    } else {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
