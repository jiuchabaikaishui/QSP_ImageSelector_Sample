//
//  ViewController.m
//  QSP_ImageSelector_Sample
//
//  Created by     -MINI on 16/3/17.
//  Copyright © 2016年 QSP. All rights reserved.
//

#import "ViewController.h"
#import "QSP_ImageSelectView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet QSP_ImageSelectView *imageSelectView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:1];
    NSMutableArray *hArr = [NSMutableArray arrayWithCapacity:1];
    for (int index = 0; index < 100; index++) {
        UIImage *image = [UIImage imageNamed:@"add_image_hight"];
        UIImage *hImage = [UIImage imageNamed:@"add_image"];
        [arr addObject:image];
        [hArr addObject:hImage];
    }
    [self.imageSelectView addImageButtonsWithImages:arr andHightImages:hArr];
}
- (IBAction)button1Action:(UIButton *)sender {
}
- (IBAction)button2Action:(UIButton *)sender {
}
- (IBAction)button3Action:(UIButton *)sender {
}
- (IBAction)button4Action:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
