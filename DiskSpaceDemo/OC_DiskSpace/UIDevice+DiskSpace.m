//
//  UIDevice+DiskSpace.m
//  kjsdkjfsjkd
//
//  Created by Anmo on 2021/8/11.
//

#import "UIDevice+DiskSpace.h"

@implementation UIDevice (DiskSpace)


+ (NSString *)totalDiskSpaceInGB
{
    return [NSByteCountFormatter stringFromByteCount:self.totalDiskSpaceInBytes countStyle:NSByteCountFormatterCountStyleDecimal];
}

+ (NSString *)totalDiskSpaceInMB
{
    return [self MBFormatter:self.totalDiskSpaceInBytes];
}

+ (NSString *)freeDiskSpaceInGB
{
    return [NSByteCountFormatter stringFromByteCount:self.freeDiskSpaceInBytes countStyle:NSByteCountFormatterCountStyleDecimal];
}

+ (NSString *)freeDiskSpaceInMB
{
    return [self MBFormatter:self.freeDiskSpaceInBytes];
}

+ (NSString *)usedDiskSpaceInGB
{
    return [NSByteCountFormatter stringFromByteCount:self.usedDiskSpaceInBytes countStyle:NSByteCountFormatterCountStyleDecimal];
}

+ (NSString *)usedDiskSpaceInMB
{
    return [self MBFormatter:self.usedDiskSpaceInBytes];
}

+ (NSString *)MBFormatter:(long long)byte
{
    NSByteCountFormatter * formater = [[NSByteCountFormatter alloc]init];
    formater.allowedUnits = NSByteCountFormatterUseGB;
    formater.countStyle = NSByteCountFormatterCountStyleDecimal;
    formater.includesUnit = false;
    return [formater stringFromByteCount:byte];
}

+ (long)totalDiskSpaceInBytes
{
    NSError * error = nil;
    NSDictionary<NSFileAttributeKey, id> * systemAttributes =  [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) {
        return 0;
    }
    long long space = [systemAttributes[NSFileSystemSize] longLongValue];
    return space;
}

+ (long)freeDiskSpaceInBytes
{
    if (@available(iOS 11.0, *)) {
        [NSURL alloc];
        NSURL * url = [[NSURL alloc]initFileURLWithPath:[NSString stringWithFormat:@"%@",NSHomeDirectory()]];
        NSError * error = nil;
        NSDictionary<NSURLResourceKey, id> * dict = [url resourceValuesForKeys:@[NSURLVolumeAvailableCapacityForImportantUsageKey] error:&error];
        if (error) {
            return 0;
        }
        long long space = [dict[NSURLVolumeAvailableCapacityForImportantUsageKey] longLongValue];
        return space;
    } else {
        NSError * error = nil;
        NSDictionary<NSFileAttributeKey, id> * systemAttributes =  [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
        if (error) {
            return 0;
        }
        long long space = [systemAttributes[NSFileSystemFreeSize] longLongValue];
        return space;
    }
}

+ (long)usedDiskSpaceInBytes
{
    return self.totalDiskSpaceInBytes - self.freeDiskSpaceInBytes;
}

@end
