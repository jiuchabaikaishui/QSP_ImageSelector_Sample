//
//  QSP_ImageSelectView.m
//  QSP_ImageSelector_Sample
//
//  Created by     -MINI on 16/3/17.
//  Copyright © 2016年 QSP. All rights reserved.
//

#import "QSP_ImageSelectView.h"

#define Default_Spacing      8
#define Default_ColumnsNum   3
//
///**
// *  行数
// */
//#define RowNum                (self.images.count/self.columnsNum + 1)
///**
// *  列宽
// */
//#define ColumnsWith           ((Self_Width - self.imageHorizontalSpacing)/self.columnsNum)

@interface QSP_ImageSelectView ()

@property (strong, nonatomic)NSMutableArray *imageButtons;

@end

@implementation QSP_ImageSelectView

#pragma mark - 属性方法
- (void)setImages:(NSArray *)images
{
    if (images) {
        _images = images;
    }
    
}
- (NSMutableArray *)imageButtons
{
    if (_imageButtons == nil) {
        _imageButtons = [NSMutableArray arrayWithCapacity:1];
    }
    
    return _imageButtons;
}
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}

#pragma mark - 系统方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self settingSubviews];
    }
    
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self settingSubviews];
    }
    
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self settingSubviewsFrame];
}

#pragma mark - 自定义方法
- (void)settingSubviews
{
    //初始化控件
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"add_image"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"add_image_hight"] forState:UIControlStateHighlighted];
    button.adjustsImageWhenHighlighted = NO;
    [self addSubview:button];
    [self.imageButtons addObject:button];
    
    //初始化数据
    self.columnsNum = Default_ColumnsNum;
    self.imageHorizontalSpacing = Default_Spacing;
    self.imageHorizontalMargin = Default_Spacing;
    self.imageVerticalSpacing = Default_Spacing;
    self.imageVerticalMargin = Default_Spacing;
}
/**
 *  设置子控件frame
 */
- (void)settingSubviewsFrame
{
    CGFloat Self_Width = self.frame.size.width;
    NSInteger RowNum = self.imageButtons.count/self.columnsNum + 1;
    CGFloat ColumnsWith = (Self_Width - self.imageHorizontalSpacing*(self.columnsNum - 1) - self.imageHorizontalMargin*2)/self.columnsNum;
    self.rowHeight = self.rowHeight ? self.rowHeight : ColumnsWith;
    
    for (NSInteger index = 0;index < self.imageButtons.count;index++) {
        NSInteger row = index/3;
        NSInteger columns = index%3;
        CGFloat X = self.imageHorizontalMargin + (ColumnsWith + self.imageHorizontalSpacing)*columns;
        CGFloat Y = self.imageVerticalMargin + (self.rowHeight + self.imageVerticalSpacing)*row;
        CGFloat W = ColumnsWith;
        CGFloat H = self.rowHeight;
        
        UIButton *button = self.imageButtons[index];
        button.frame = CGRectMake(X, Y, W, H);
    }
    
    CGSize size = self.frame.size;
    size.height = self.imageVerticalMargin*2 + (self.rowHeight + self.imageVerticalSpacing)*RowNum - self.imageVerticalSpacing;
    self.contentSize = size;
}
/**
 *  添加图片按钮
 *
 *  @param images 图片数组
 */
- (void)addImageButtonsWithImages:(NSArray *)images andHightImages:(NSArray *)hightImages
{
    NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:1];
    for (UIImage *image in images) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:image forState:UIControlStateNormal];
//        [button setImage:[hightImages objectAtIndex:[images indexOfObject:image]] forState:UIControlStateHighlighted];
        button.adjustsImageWhenHighlighted = YES;
        [self addSubview:button];
        [mArr addObject:button];
    }
    
    [mArr addObjectsFromArray:self.imageButtons];
    self.imageButtons = mArr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
