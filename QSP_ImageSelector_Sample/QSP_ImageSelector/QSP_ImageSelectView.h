//
//  QSP_ImageSelectView.h
//  QSP_ImageSelector_Sample
//
//  Created by     -MINI on 16/3/17.
//  Copyright © 2016年 QSP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSP_ImageSelectView : UIScrollView

/**
 *  要展示的图片数组
 */
@property (strong, nonatomic,readonly)NSArray *images;
/**
 *  最多能接收的图片数量
 */
@property (assign,nonatomic) NSInteger maxImagesCount;
/**
 *  列数（即每行显示几个），默认为3列。
 */
@property (assign, nonatomic)int columnsNum;
/**
 *  每一行的高度
 */
@property (assign, nonatomic)CGFloat rowHeight;
/**
 *  图片的水平间距，默认为8.
 */
@property (assign, nonatomic)float imageHorizontalSpacing;
/**
 *  图片的垂直间距，默认为8.Margin
 */
@property (assign, nonatomic)float imageVerticalSpacing;
/**
 *  图片的水平边距，默认为8.
 */
@property (assign, nonatomic)float imageHorizontalMargin;
/**
 *  图片的垂直边距，默认为8.margin
 */
@property (assign, nonatomic)float imageVerticalMargin;

/**
 *  添加图片按钮
 *
 *  @param images 图片数组
 */
- (void)addImageButtonsWithImages:(NSArray *)images andHightImages:(NSArray *)hightImages;

@end
