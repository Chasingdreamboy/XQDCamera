//
//  XQDCameraHelper.m
//  Pods
//
//  Created by EriceWang on 2017/7/4.
//
//

#import "XQDCameraHelper.h"

@implementation XQDCameraHelper
NSBundle *getResourceBundle() {
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"XQDCameraHolderViewController")];
    NSURL *url = [bundle URLForResource:@"XQDCameraResource" withExtension:@"bundle"];
    NSBundle *resources = [NSBundle bundleWithURL:url];
    return resources;
}
UIImage *getImageWithImageName(NSString *imageName) {
    NSBundle *resources = getResourceBundle();
    return [UIImage imageNamed:imageName inBundle:resources compatibleWithTraitCollection:nil];
}

UIImage *normalizedImage(UIImage *oriImage) {
    UIGraphicsBeginImageContextWithOptions(oriImage.size, NO, oriImage.scale);
    [oriImage drawInRect:(CGRect){0, 0, oriImage.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}
UIImage *scaleToSize(UIImage *oriImage, CGSize newSize) {
    CGSize selfSize = oriImage.size;
    CGSize reSize = newSize;
    CGFloat rw = reSize.width / selfSize.width;
    CGFloat rh = reSize.height / selfSize.height;
    CGFloat rate = MAX(rw, rh);
    UIGraphicsBeginImageContext(CGSizeMake(oriImage.size.width * rate, oriImage.size.height * rate));
    [oriImage drawInRect:CGRectMake(0, 0, oriImage.size.width * rate, oriImage.size.height * rate)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGRect cutRect = CGRectMake((scaledImage.size.width - reSize.width) / 2, (scaledImage.size.height - reSize.height) / 2, reSize.width, reSize.height);
    CGImageRef imageRef = scaledImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, cutRect);
    
    UIGraphicsBeginImageContext(reSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, cutRect, subImageRef);
    UIImage *cutImage = [UIImage imageWithCGImage:subImageRef];
    CGImageRelease(subImageRef);
    UIGraphicsEndImageContext();
    
    return cutImage;
}
UIImage *crop(UIImage *oriImage, CGRect rect) {
    
    rect = CGRectMake(rect.origin.x * oriImage.scale,
                      rect.origin.y * oriImage.scale,
                      rect.size.width * oriImage.scale,
                      rect.size.height * oriImage.scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(oriImage.CGImage, rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:oriImage.scale orientation:oriImage.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}
@end
