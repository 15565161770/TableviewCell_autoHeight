//
//  HMViewController.m
//  05-新浪微博
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMViewController.h"
#import "HMStatus.h"
#import "HMStatusCell.h"
#import "HMStatusFrame.h"

@interface HMViewController ()
/** 保存statusFrame模型的数组 */
@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation HMViewController
static NSString *ID = @"Cell";

- (NSArray *)statusFrames
{
    if (_statusFrames == nil) _statusFrames = [HMStatusFrame statusFrames];
    return _statusFrames;
}

// 界面创建完成被调用
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 为tableView注册可重用单元格
    [self.tableView registerClass:[HMStatusCell class] forCellReuseIdentifier:ID];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     在Storyboard中指定了可重用标示符，同时指定了Cell的类是HMStatusCell
     
     系统会为tableView注册一个原形Cell，专门用来做可重用单元格的，一旦缓冲区中不存在
     可重用单元格，系统会使用原形Cell新实例化一个Cell用程序使用！
     
     因此如果在，Storyboard中，注册了原形Cell，就不再需要 cell == nil的判断了
     */
//    HMStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // unable to dequeue a cell with identifier Cell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard
    // 使用这个方法，要求一定注册可重用单元格，否则就会崩溃！
    // 官方建议使用以下方法，利用程序的崩溃，及时发现问题
    HMStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    // 一旦在注册了可重用Cell，以上两个方法是等价的
    
//    if (cell == nil) {
//        cell = [[HMStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
    
    // 赋值
    // 取出StatusFrame模型
    HMStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    cell.statusFrame = statusFrame;
    NSLog(@"%@",cell.textLabel.font);
    return cell;
}

#pragma mark - 代理方法
/** 计算单元格行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     计算行高的方法，会在加载表格数据时，有多少行计算多少次 contentSize
     
     问题：此方法执行的时候，cell还没有被实例化！
     但是：行高计算是在实例化cell时，通过设置status属性，计算的=>有了status模型，就可以知道行高！
     
     问题：如何在cell实例化之前，获得行高？
     解决方法：通过status可以计算得到行高！=》再建立一个模型，专门计算所有控件的位置
     */
    HMStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    
    return statusFrame.cellHeight;
}

@end
