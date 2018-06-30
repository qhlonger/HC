//
//  NSDate+QTool.h
//  teacher
//
//  Created by 邱海龙 on 16/5/9.
//  Copyright © 2016年 xiayp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (QTool)
- (NSDate *)lastDay;

- (NSDate*)nextDay;

- (NSDate *)lastMonth;

- (NSDate *)nextMonth;

- (NSDate *)nextYear;

- (NSDate *)lastYear;

- (BOOL) isEarlierThanDate: (NSDate *) aDate;

- (BOOL) isLaterThanDate: (NSDate *) aDate;

//+ (MyWeekDayCalculator *)shareManager;

//计算今天是周几
- (NSString *)calculateWeekdayStringWithDate:(NSString *)date;

//计算今天是一周的第几天（周日记为0）
- (NSInteger)calculateWeekDayNumberWithDate:(NSString *)date;

//判断是否是今天
- (BOOL)isTodayWithDate:(NSString *)date;

//获取上一天日期
- (NSDate *)calculateLastDayDateWithDate:(NSString *)date;

//获取下一天日期
- (NSDate *)calculateNextDayDateWithDate:(NSString *)date;

//计算时间差
- (NSString *)calculateTimeWithDate:(NSString *)date;

//获取今天日期
- (NSDate *)getThisZoneTodayDate;
- (NSString *)getThisZoneTodayDateString;

//获取本周周一日期
- (NSString *)getThisWeekMonDateWithThisDate:(NSString *)date;

//获取本周周日日期
- (NSString *)getThisWeekSunDateWithThisDate:(NSString *)date;

//获取上一周今天的日期
- (NSString *)calculateLastWeekDayWithDate:(NSString *)date;

//获取下一周今天的日期
- (NSString *)calculateNextWeekDayWithDate:(NSString *)date;
/**  忽略时分秒  */
- (NSDate *)extractDate:(NSDate *)date ;


+ (NSDate *)dateWithDateString:(NSString *)dateStr;

- (NSInteger)totalDayInThisMonth;
- (BOOL)isSameDayWithDate2:(NSDate*)date2;

+ (NSInteger)calcuateDayWithStartTime:(NSDate *)startTime enDate:(NSDate *)endDate;



+ (NSString *)durationWithTimeStamp:(NSNumber *)timeStamp;
+ (NSDate *)tureDate;

/**  将毫秒时间戳转化为nadate  */
+ (NSDate *)dateWithMSStamp:(NSNumber *)stamp;
/**  获取毫秒时间戳  */
- (NSNumber *)getMSStamp;
/**  字符串时间  */
+ (NSDate *)dateWithString:(NSString *)string;

- (NSInteger)age;

@property (nonatomic, copy)NSString *yyyyMMdd_HHmmss;
@property (nonatomic, copy)NSString *yyyyMMdd_HHmm;
@property (nonatomic, copy)NSString *HHmm;
@property (nonatomic, copy)NSString *HHmmss;
@property (nonatomic, copy)NSString *yyyyMMdd;
@property (nonatomic, copy)NSString *yyyyMM;
@property (nonatomic, copy)NSString *MMdd;
@property (nonatomic, copy)NSString *yyyy;
@property (nonatomic, copy)NSString *MM;
@property (nonatomic, copy)NSString *dd;






@end
