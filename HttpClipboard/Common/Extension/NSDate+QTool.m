//
//  NSDate+QTool.m
//  teacher
//
//  Created by 邱海龙 on 16/5/9.
//  Copyright © 2016年 xiayp. All rights reserved.
//

#import "NSDate+QTool.h"

@implementation NSDate (QTool)
- (NSDate *)lastDay{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate*)nextDay{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)lastMonth{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}
- (NSDate *)nextMonth{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}
- (NSDate *)nextYear{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}
- (NSDate *)lastYear{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}
- (BOOL) isEarlierThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) isLaterThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}




//
//+ (MyWeekDayCalculator *)shareManager {
//    
//    static MyWeekDayCalculator *myWeekCalculator = nil;
//    
//    static dispatch_once_t once;
//    
//    dispatch_once(&once, ^{
//        
//        if (myWeekCalculator == nil) {
//            
//            myWeekCalculator = [[MyWeekDayCalculator alloc]init];
//        }
//    });
//    
//    return myWeekCalculator;
//}

//计算今天是周几
- (NSString *)calculateWeekdayStringWithDate:(NSString *)date{
    
    NSInteger weekDay = [self calculateWeekDayNumberWithDate:date];
    
    switch (weekDay) {
        case 1:
            return @"周一";
            break;
        case 2:
            return @"周二";
            break;
        case 3:
            return @"周三";
            break;
        case 4:
            return @"周四";
            break;
        case 5:
            return @"周五";
            break;
        case 6:
            return @"周六";
            break;
        case 0:
            return @"周日";
            break;
        default:
            return nil;
            break;
    }
}

//计算今天是一周的第几天（周日记为0）
- (NSInteger)calculateWeekDayNumberWithDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    
    NSDate *thatDay = [[dateFormatter dateFromString:@"2001-01-01"] dateByAddingTimeInterval:interval];
    NSDate *day = [[dateFormatter dateFromString:date] dateByAddingTimeInterval:interval];
    
    NSTimeInterval timeInterval = [day timeIntervalSinceDate:thatDay];
    
    NSInteger days = ((NSInteger)timeInterval) / (3600 * 24) + 1;
    
    return days % 7;
}

//判断是否是今天
- (BOOL)isTodayWithDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    
    NSDate *today = [self extractDate:[NSDate date]];
    NSDate *day = [[dateFormatter dateFromString:date] dateByAddingTimeInterval:interval];
    
    NSTimeInterval timeInterval = [day timeIntervalSinceDate:today];
    
    if (((NSInteger)timeInterval) / (3600 * 24) == 0) {
        
        return YES;
        
    }else {
        
        return  NO;
    }
}

//仅计算天数忽略时分秒
- (NSDate *)extractDate:(NSDate *)date {
    
    
    NSTimeInterval interval = [date timeIntervalSince1970];
    NSInteger daySeconds = 24 * 60 * 60;
    
    NSInteger allDays = interval / daySeconds;
    
    return [NSDate dateWithTimeIntervalSince1970:allDays * daySeconds];
}

//获取上一天日期
- (NSDate *)calculateLastDayDateWithDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    
    NSDate *thisDayDate = [[dateFormatter dateFromString:date] dateByAddingTimeInterval:interval];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = -1;
    
    NSDate *lastDayDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:thisDayDate options:0];
    
    return lastDayDate;
}

//获取下一天日期
- (NSDate *)calculateNextDayDateWithDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    
    NSDate *thisDayDate = [[dateFormatter dateFromString:date] dateByAddingTimeInterval:interval];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = 1;
    
    NSDate *lastDayDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:thisDayDate options:0];
    
    return lastDayDate;
}

//计算时间差
- (NSString *)calculateTimeWithDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    
    NSDate *today = [[NSDate date]dateByAddingTimeInterval:interval];
    NSDate *day = [[dateFormatter dateFromString:date] dateByAddingTimeInterval:interval];
    
    NSTimeInterval time = [today timeIntervalSinceDate:day];
    
    NSMutableString *timeStr = [NSMutableString string];
    
    if (time >= 3600) {
        
        int hour = time / 3600;
        
        if (hour >= 24) {
            if(hour > 240){
                [timeStr appendFormat:@"%@", [[NSString stringWithFormat:@"%@", day] substringToIndex:10]];
            }else{
                [timeStr appendFormat:@"%d小时前",hour/24];
            }
        }else {
            
            [timeStr appendFormat:@"%d小时前",hour];
        }
        
    }else if (time >= 60) {
        
        int min = time / 60;
        [timeStr appendFormat:@"%d分钟前",min];
        
    }else {
        
        [timeStr appendFormat:@"%d秒前",(int)time];
    }
    
    return timeStr;
}

//获取今天日期
- (NSDate *)getThisZoneTodayDate {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    return  [[NSDate date]dateByAddingTimeInterval:interval];
}
- (NSString *)getThisZoneTodayDateString {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    NSDate *today = [[NSDate date]dateByAddingTimeInterval:interval];
    
    return [[NSString stringWithFormat:@"%@", today] substringToIndex:10];
}

//获取本周周一日期
- (NSString *)getThisWeekMonDateWithThisDate:(NSString *)date {
    
    NSInteger day = [self calculateWeekDayNumberWithDate:date];
    
    if (day == 0) {
        
        day += 7;
    }
    
    if (day != 1) {
        
        for (NSInteger i = 1; i < day; i ++) {
            
            date = [[NSString stringWithFormat:@"%@", [self calculateLastDayDateWithDate:date]] substringToIndex:10];
        }
    }
    
    return date;
}

//获取本周周日日期
- (NSString *)getThisWeekSunDateWithThisDate:(NSString *)date {
    
    NSInteger day = [self calculateWeekDayNumberWithDate:date];
    
    if (day != 0) {
        
        for (NSInteger i = day; i < 7; i ++) {
            
            date = [[NSString stringWithFormat:@"%@", [self calculateNextDayDateWithDate:date]] substringToIndex:10];
        }
    }
    
    return date;
}

//获取上一周今天的日期
- (NSString *)calculateLastWeekDayWithDate:(NSString *)date {
    
    for (int i = 0; i < 7; i ++) {
        
        date = [[NSString stringWithFormat:@"%@", [self calculateLastDayDateWithDate:date]] substringToIndex:10];
    }
    
    return date;
}

//获取下一周今天的日期
- (NSString *)calculateNextWeekDayWithDate:(NSString *)date {
    
    for (int i = 0; i < 7; i ++) {
        
        date = [[NSString stringWithFormat:@"%@", [self calculateNextDayDateWithDate:date]] substringToIndex:10];
    }
    
    return date;
}


+ (NSDate *)dateWithDateString:(NSString *)dateStr{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:[NSString stringWithFormat:@"yy-MM-dd"]];
    return  [dateFormat dateFromString:dateStr];
}
- (NSInteger)totalDayInThisMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    return range.length;
}
- (BOOL)isSameDayWithDate2:(NSDate*)date2
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}




+ (NSInteger)calcuateDayWithStartTime:(NSDate *)startTime enDate:(NSDate *)endDate{
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    
    
    NSTimeInterval time = [endDate timeIntervalSinceDate:startTime];
    
    
    NSInteger itv =  time / 3600 / 24;
    itv++;
    if (itv <= 0) {
        return 1;
    }
    
    
    return itv;
}





+ (NSString *)durationWithTimeStamp:(NSNumber *)timeStamp{
    NSNumber *now = [[NSDate date] getMSStamp];
    long duration = ABS([now longLongValue]-[timeStamp longLongValue]);
    duration /= 1000;
    duration /= 60;
    long day    = duration / 60 / 24;
    long hour   = duration / 60 - day * 24;
    long min    = duration - hour * 60 - day * 24 * 60;
    return [NSString stringWithFormat:@"%ld天%ld小时%ld分",day,hour,min];
}








+ (NSDate *)tureDate{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localDate = [date  dateByAddingTimeInterval: interval];
    return localDate;
}


/**  毫秒时间戳  */
+ (NSDate *)dateWithMSStamp:(NSNumber *)stamp{
    if(!stamp)return nil;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[stamp doubleValue] / 1000];
    return date;
}
//将NSDate类型的时间转换为时间戳,从1970/1/1开始
- (NSNumber *)getMSStamp{
    NSTimeInterval interval = [self timeIntervalSince1970];
    long long totalMilliseconds = interval*1000 ;
    return [NSNumber numberWithLongLong:totalMilliseconds];
}

+ (NSDate *)dateWithString:(NSString *)string{
    NSDateFormatter* dateF = [[NSDateFormatter alloc] init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]];
    NSDate *date = [dateF dateFromString:string];
    return  date;
}

- (NSString *)yyyyMMdd_HHmmss{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateF stringFromDate:self];
}
- (NSString *)HHmmss{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"HH:mm:ss"];
    return [dateF stringFromDate:self];
}
- (NSString *)HHmm{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"HH:mm"];
    return [dateF stringFromDate:self];
}
- (NSString *)yyyyMMdd_HHmm{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    
    
    
    return [dateF stringFromDate:self];
}
- (NSString *)yyyyMMdd{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"yyyy-MM-dd"];
    return [dateF stringFromDate:self];
}
- (NSString *)yyyyMM{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"yyyy-MM"];
    return [dateF stringFromDate:self];
}
- (NSString *)yyMM{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"yyyy-MM-dd"];
    return [dateF stringFromDate:self];
}
- (NSString *)MMdd{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"MM-dd"];
    return [dateF stringFromDate:self];
}
- (NSString *)yyyy{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"yyyy"];
    return [dateF stringFromDate:self];
}
- (NSString *)MM{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"MM"];
    return [dateF stringFromDate:self];
}

- (NSString *)dd{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    dateF.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateF setDateFormat:@"dd"];
    return [dateF stringFromDate:self];
}


- (NSInteger)age{
    NSTimeInterval time=[[NSDate date] timeIntervalSinceDate:self];
    NSInteger age = ((NSInteger)time)/(3600*24*365);
    return age;
}
















@end
