//
//  XQDCameraHelper.h
//  Pods
//
//  Created by EriceWang on 2017/7/4.
//
//

#import <Foundation/Foundation.h>

@interface XQDCameraHelper : NSObject
NSBundle *getResourceBundle();
UIImage *getImageWithImageName(NSString *imageName);
UIImage *normalizedImage(UIImage *oriImage);
UIImage *scaleToSize(UIImage *oriImage, CGSize newSize) ;
UIImage *crop(UIImage *oriImage, CGRect rect) ;
@end
