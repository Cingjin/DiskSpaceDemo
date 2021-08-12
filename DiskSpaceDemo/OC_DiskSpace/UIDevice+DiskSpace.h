//
//  UIDevice+DiskSpace.h
//  kjsdkjfsjkd
//
//  Created by Anmo on 2021/8/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (DiskSpace)

/**
 * @abstract 获取设备磁盘总容量
 * @return 单位GB
 */
+ (NSString *)totalDiskSpaceInGB;
/**
 * @abstract 获取设备磁盘总容量
 * @return 单位M
 */
+ (NSString *)totalDiskSpaceInMB;
/**
 * @abstract 获取设备磁盘空余容量
 * @return 单位GB
 */
+ (NSString *)freeDiskSpaceInGB;
/**
 * @abstract 获取设备磁盘空余容量
 * @return 单位M
 */
+ (NSString *)freeDiskSpaceInMB;
/**
 * @abstract 获取设备磁盘已使用量
 * @return 单位GB
 */
+ (NSString *)usedDiskSpaceInGB;
/**
 * @abstract 获取设备磁盘已使用量
 * @return 单位M
 */
+ (NSString *)usedDiskSpaceInMB;

@end

NS_ASSUME_NONNULL_END
