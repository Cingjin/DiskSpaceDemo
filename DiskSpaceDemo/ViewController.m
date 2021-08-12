//
//  ViewController.m
//  DiskSpaceDemo
//
//  Created by Anmo on 2021/8/12.
//

#import "ViewController.h"
#import "DiskSpaceDemo_Swift.h"
#import "UIDevice+DiskSpace.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, self.view.bounds.size.width - 40, 300)];
    label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
    label.numberOfLines = 0;
    label.text = self.diskSpace;
    [self.view addSubview:label];
    
    SwiftViewController * switfVC = [[SwiftViewController alloc]init];
    [self addChildViewController:switfVC];
    switfVC.view.frame = CGRectMake(20, CGRectGetMaxY(label.frame), CGRectGetWidth(label.frame), CGRectGetHeight(label.frame));
    [self.view addSubview:switfVC.view];
}

- (NSString *)diskSpace
{
    NSString * space = [NSString stringWithFormat:@"总内存：%@ \n已使用内存：%@ \n可用内存：%@",UIDevice.totalDiskSpaceInGB,UIDevice.usedDiskSpaceInGB,UIDevice.freeDiskSpaceInGB];
    return space;
}


@end
