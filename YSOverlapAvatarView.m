//
//  YSOverlapAvatarView.m
//  ZWYProject
//
//  Created by hiyo on 2020/2/29.
//  Copyright © 2020 yesoul. All rights reserved.
//

#import "YSOverlapAvatarView.h"

@interface YSOverlapAvatarView ()

@property (nonatomic, assign) float avatarHeight;
@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, strong) NSMutableArray *imgViewArr;

@end

@implementation YSOverlapAvatarView

- (instancetype)initWithAvatarHeight:(float)height maxCount:(NSInteger)maxCount {
    self = [super init];
    if (self) {
        self.avatarHeight = height;
        self.maxCount = maxCount;
        
        _imgViewArr = [NSMutableArray array];
    }
    return self;
}

- (void)setAvatarArr:(NSArray *)avatarArr {
    for (UIImageView *imageView in self.imgViewArr) {
        imageView.hidden = YES;
    }
    
    NSInteger maxShowCount = MIN(_maxCount, avatarArr.count);
    for (NSInteger i=0; i < maxShowCount; i++) {
        UIImageView *imageView = [self imageViewWithIndex:i];
        imageView.hidden = NO;
        [imageView sd_setImageWithURL:[NSURL URLWithString:avatarArr[i]] placeholderImage:[UIImage imageNamed:@"yh_placeholder_avator"]];
    }
    
    if (self.superview) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.avatarHeight * maxShowCount);
        }];
    }
}

#pragma mark -
- (UIImageView *)imageViewWithIndex:(NSInteger)index {
    if (index >= self.imgViewArr.count) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.avatarHeight, self.avatarHeight)];
        imageView.layer.cornerRadius = self.avatarHeight / 2.0;
        imageView.clipsToBounds = YES;
        if (!self.isHideBorder) {
            //显示边框
            imageView.layer.borderColor = [UIColor whiteColor].CGColor;
            imageView.layer.borderWidth = 1;
        }
        CGSize itemSize = CGSizeMake(_avatarHeight, _avatarHeight);
        imageView.left = (itemSize.width)*self.imgViewArr.count * 0.72;
        imageView.size = itemSize;
        [self addSubview:imageView];
        [self sendSubviewToBack:imageView];
        [self.imgViewArr addObject:imageView];
        
        return imageView;
    }
    return self.imgViewArr[index];
}

@end
