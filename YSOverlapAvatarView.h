//
//  YSOverlapAvatarView.h
//  ZWYProject
//
//  Created by hiyo on 2020/2/29.
//  Copyright © 2020 yesoul. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSOverlapAvatarView : UIView

@property (nonatomic, assign) BOOL isHideBorder; //是否隐藏边框,default NO
@property (nonatomic, retain) NSArray *avatarArr;

- (instancetype)initWithAvatarHeight:(float)height maxCount:(NSInteger)maxCount;

@end

NS_ASSUME_NONNULL_END
