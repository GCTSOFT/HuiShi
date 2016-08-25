//
//  DatePopView.m
//  HuiShi
//
//  Created by admin on 16/8/24.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "DatePopView.h"
#import "PopBackView.h"
#import "CommonDefine.h"

@interface DatePopView ()<UIPickerViewDataSource, UIPickerViewDelegate, PopBackViewDelegate>

@property (nonatomic, strong) UIPickerView *pickView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *completeButton;
@property (nonatomic, strong) NSMutableArray *dataArray;


@property (nonatomic, assign) int nian;
@property (nonatomic, assign) int jidu;
@property (nonatomic, assign) int yuefen;
@property (nonatomic, assign) CGRect fr;

@end

@implementation DatePopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.fr = frame;
        [self initialView];
    }
    return self;
}

- (void)initialView
{
    self.dataArray = [@[@[@"2011", @"2012", @"2013", @"2014", @"2015", @"2016"], @[@"Q1", @"Q2", @"Q3"], @[@"7月", @"8月", @"9月"]] copy];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelButton];
    self.cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[V(50)]" options:0 metrics:0 views:@{@"V":self.cancelButton}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[V(20)]" options:0 metrics:0 views:@{@"V":self.cancelButton}]];
    
    self.completeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.completeButton setTitle:@"完成" forState:UIControlStateNormal];
    [self.completeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.completeButton addTarget:self action:@selector(completeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.completeButton];
    self.completeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[V(50)]-10-|" options:0 metrics:0 views:@{@"V":self.completeButton}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[V(20)]" options:0 metrics:0 views:@{@"V":self.completeButton}]];
    
    
    self.pickView = [[UIPickerView alloc] init];
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    self.pickView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.pickView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[V]-5-|" options:0 metrics:0 views:@{@"V":self.pickView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[V]-5-|" options:0 metrics:0 views:@{@"V":self.pickView}]];
}

- (void)cancelButtonClick:(UIButton *)button
{
    [self dismiss];
}

- (void)completeButtonClick:(UIButton *)button
{
    [self dismiss];
}

#pragma mark - public
- (void)show
{
    UIWindow *wind = AppContext.appdelegate.window;
    PopBackView *bgView = [[PopBackView alloc] initWithFrame:wind.bounds];
    bgView.delegate = self;
    bgView.tag = kPopBackViewTag;
    [wind addSubview:bgView];
    self.frame = CGRectMake(Screen_Width-self.fr.size.width, self.fr.size.height, 0, 0);
    self.tag = 131;
    [bgView addSubview:self];
    [UIView animateWithDuration:.4 animations:^{
        self.frame = self.fr;
    }];
}

- (void)dismiss
{
    PopBackView *bgView = [AppContext.appdelegate.window viewWithTag:kPopBackViewTag];
    [UIView animateWithDuration:.4 animations:^{
        self.frame = CGRectMake(Screen_Width-300, 400, 0, 0);
    } completion:^(BOOL finished) {
        bgView.delegate = nil;
        [bgView removeFromSuperview];
    }];
}

#pragma mark - PopBackViewDelegate
- (void)touchBgView:(UIView *)backView
{
    [self dismiss];
}

#pragma mark - UIPickerViewDataSource, UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return self.dataArray.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *array = [self.dataArray objectAtIndex:component];
    return array.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *array = [self.dataArray objectAtIndex:component];
    return [array objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        NSArray *array = [self.dataArray objectAtIndex:component];
        self.nian = [[array objectAtIndex:row] integerValue];
    } else if (component == 1) {
        NSArray *array = [self.dataArray objectAtIndex:component];
        self.jidu = [[array objectAtIndex:row] integerValue];
    } else {
        NSArray *array = [self.dataArray objectAtIndex:component];
        self.yuefen = [[array objectAtIndex:row] integerValue];
    }
    
}

@end
