//
//  ViewController.m
//  HTMLImg
//
//  Created by ms on 2019/7/22.
//  Copyright © 2019 ms. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MSHTMLLabel.h"
#define WeakObj(o) __weak typeof(o) o##Weak = o;
@interface ViewController ()
@property(nonatomic,strong) MSHTMLLabel *label;
@property(nonatomic,copy) NSArray *arr;
@property(nonatomic,strong) UIImageView *img;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [MSHTMLLabel new];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).offset(20);
        make.top.mas_equalTo(self.view).offset(100);
    }];
    
    
    NSString *str = @"<p>这是第一张图片</p><p><img src=\"http://139.224.196.100:81/OtherImage/2021-04/TempImg_20210422173015886264530.jpg\" width=\"375\"  ></p><p>这是第二张图片这是第二张图片这是第二张图片这是第二张图片这是第二张图片这是第二张图片这是第二张图片</p><p><img src=\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563787705041&di=7708747caf3ee9da672ce4ce0848a60c&imgtype=0&src=http%3A%2F%2Fpic41.nipic.com%2F20140508%2F18609517_112216473140_2.jpg\" width=\"375\" ></p>";
    
    NSMutableAttributedString *htmlStr = [[NSMutableAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    [htmlStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, htmlStr.length)];
    
    self.label.attributedText = htmlStr;
    
    
    // 如果放到tableview 中的话 可以计算高度 进行复制
    CGFloat height = [self.label.attributedText boundingRectWithSize:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
    // 这个方法可以替换掉对应的width width 替换成为系统设备的宽度
//    str = [str stringByReplacingOccurrencesOfString:@"width: 100%" withString:@"width: 414"];
    
    NSLog(@"height---%.2f",height);
    
    
    
}

@end
