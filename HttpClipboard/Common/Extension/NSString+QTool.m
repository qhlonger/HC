//
//  NSString+QTool.m
//  teacher
//
//  Created by 邱海龙 on 16/5/9.
//  Copyright © 2016年 xiayp. All rights reserved.
//

#import "NSString+QTool.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (QTool)
/**
 *  返回字符串需要所占的空间
 *
 *  @param font    字符串字号
 *  @param maxSize 最大的范围
 *
 *  @return 返回范围
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName :font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
- (NSString*)md532BitLower
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}
- (NSString*)md532BitUpper
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}
- (NSString *)md5Str
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

//返回时间
+ (NSString *)getTimeBySeparator:(NSString *)sep{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"yyyy%@MM%@dd",sep,sep]];
    return [dateF stringFromDate:[NSDate date]];
}
+ (NSString *)getTimeMinBySeparator:(NSString *)sep{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"yyyy%@MM%@dd   HH:mm",sep,sep]];
    return [dateF stringFromDate:[NSDate date]];
}
+ (NSString *)getMinSecStringByDate:(NSDate *)date{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"mm:SS"]];
    return [dateF stringFromDate:date];
}
+ (NSDate *)getMinSecDateByString:(NSString *)str{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:[NSString stringWithFormat:@"mm:SS"]];
    return  [dateFormat dateFromString:str];
}

+ (NSString *)getTimeByDate:(NSDate *)date Separator:(NSString *)sep{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"yyyy%@MM%@dd",sep,sep]];
    return [dateF stringFromDate:date];
}
- (NSDate *)changeToDateWithSeparator:(NSString *)sep{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:[NSString stringWithFormat:@"yyyy%@MM%@dd HH:mm:ss", sep, sep]];
    NSDate *date =  [dateFormat dateFromString:self];
    return date;
}
- (NSDate *)getDate{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd"]];
    NSDate *date =  [dateFormat dateFromString:self];
    return date;
}
//+ (NSString *) compareCurrentTime:(NSString *) compareDate{
//    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *date =[dateFormat dateFromString:compareDate];
//    
//    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
//    timeInterval = -timeInterval;
//    NSInteger temp = 0;
//    NSString *result;
//    if (timeInterval < 60) {
//        result = [NSString stringWithFormat:@"刚刚"];
//    }
//    else if((temp = timeInterval/60) <60){
//        result = [NSString stringWithFormat:@"%ld分钟前",(long)temp];
//    }
//    else if((temp = temp/60) <24){
//        result = [NSString stringWithFormat:@"%ld小时前",(long)temp];
//    }
//    else if((temp = temp/24) <30){
//        result = [NSString stringWithFormat:@"%ld天前",(long)temp];
//    }
//    
//    else if((temp = temp/30) <12){
//        result = [NSString stringWithFormat:@"%ld月前",(long)temp];
//    }
//    else{
//        temp = temp/12;
//        result = [NSString stringWithFormat:@"%ld年前",(long)temp];
//    }
//    
//    return  result;
//}


//+ (NSString *) compareCurrentTime:(NSString *) compareDate{
////    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
////    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
////    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate*inputDate = [NSDate dateWithString:compareDate];
//    //NSLog(@"startDate= %@", inputDate);
//    
////    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
////    [outputFormatter setLocale:[NSLocale currentLocale]];
////    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
////    //get date str
////    NSString *str= [outputFormatter stringFromDate:inputDate];
////    //str to nsdate
////    NSDate *strDate = [outputFormatter dateFromString:str];
////    //修正8小时的差时
////    NSTimeZone *zone = [NSTimeZone systemTimeZone];
////    NSInteger interval = [zone secondsFromGMTForDate: strDate];
////    NSDate *endDate = [strDate  dateByAddingTimeInterval: interval];
////
////    
////    
//    NSTimeInterval secondsPerDay = 24 * 60 * 60;
////    //修正8小时之差
////    NSDate *date1 = [NSDate date];
////    NSTimeZone *zone1 = [NSTimeZone systemTimeZone];
////    NSInteger interval1 = [zone1 secondsFromGMTForDate: date1];
////    NSDate *localeDate = [date1  dateByAddingTimeInterval: interval1];
//    
//    //NSLog(@"nowdate=%@\nolddate = %@",localeDate,date);
//    NSDate *today = [NSDate date];
//    NSDate *yesterday,*beforeOfYesterday;
//    //今年
//    NSString *toYears;
//    
//    toYears = [[today description] substringToIndex:4];
//    
//    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
//    beforeOfYesterday = [yesterday dateByAddingTimeInterval: -secondsPerDay];
//    
//    // 10 first characters of description is the calendar date:
//    NSString *todayString = [[today description] substringToIndex:10];
//    NSString *yesterdayString = [[yesterday description] substringToIndex:10];
//    NSString *beforeOfYesterdayString = [[beforeOfYesterday description] substringToIndex:10];
//    
//    NSString *dateString = [[inputDate description] substringToIndex:10];
//    NSString *dateYears = [[inputDate description] substringToIndex:4];
//    
//    NSString *dateContent;
//    if ([dateYears isEqualToString:toYears]) {//同一年
//        //今 昨 前天的时间
//        NSString *time = [[inputDate description] substringWithRange:(NSRange){11,5}];
//        //其他时间
//        NSString *time2 = [[inputDate description] substringWithRange:(NSRange){5,11}];
//        if ([dateString isEqualToString:todayString]){
//            dateContent = [NSString stringWithFormat:@"今天 %@",time];
//            return dateContent;
//        } else if ([dateString isEqualToString:yesterdayString]){
//            dateContent = [NSString stringWithFormat:@"昨天 %@",time];
//            return dateContent;
//        }else if ([dateString isEqualToString:beforeOfYesterdayString]){
//            dateContent = [NSString stringWithFormat:@"前天 %@",time];
//            return dateContent;
//        }else{
//            
//            NSString *str = [NSString stringWithFormat:@"%@-%@",inputDate.MM,inputDate.dd];
//            return str;
//        }
//    }else{
//        NSString *str = [NSString stringWithFormat:@"%@-%@",inputDate.MM,inputDate.dd];
//        return str;
//    }
//}



+ (NSString *) compareCurrentTime:(NSString *) compareDate{
    
    
    
//    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
////    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    
    
    NSDate *today = [NSDate date];//[[NSDate date]dateByAddingTimeInterval:interval];
    NSDate *date = [NSDate dateWithString:compareDate];//[[dateFormatter dateFromString:compareDate] dateByAddingTimeInterval:interval];
    NSDate *yesterday = [today lastDay];
    NSDate *theDayBeforeYesterday = [yesterday lastDay];
    
    
    
    
    if([date isSameDayWithDate2:today]){
        return [NSString stringWithFormat:@"今天%@",date.HHmm];
    }else if([date isSameDayWithDate2:yesterday]){
        return [NSString stringWithFormat:@"昨天%@",date.HHmm];
    }else if([date isSameDayWithDate2:theDayBeforeYesterday]){
        return [NSString stringWithFormat:@"前天%@",date.HHmm];
    }else{
        return date.MMdd;
    }
}

+ (NSString *)getYearByDate:(NSDate *)date{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"yyyy"]];
    return [dateF stringFromDate:date];
}
+ (NSString *)getMonthByDate:(NSDate *)date{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"MM"]];
    return [dateF stringFromDate:date];
}
+ (NSString *)getDateByDate:(NSDate *)date{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"dd"]];
    return [dateF stringFromDate:date];
}
+ (NSString *)getTimeByDate:(NSDate *)date{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"HH:mm"]];
    return [dateF stringFromDate:date];
}




- (NSString *)setIncrement:(NSInteger)increment{
    NSInteger number = [self integerValue];
    number += increment;
    return [NSString stringWithFormat:@"%ld",(long)number];
}
+ (NSString *)getYearMonthByDate:(NSDate *)date{
    NSDateFormatter *dateF  = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:[NSString stringWithFormat:@"yyyy-MM"]];
    return [dateF stringFromDate:date];
}




- (BOOL)isSameDay:(NSString *)dateStr{
    NSRange dateRange = NSMakeRange(0, 10);
    return [[self substringWithRange:dateRange] isEqualToString:[dateStr substringWithRange:dateRange]];
}





+ (NSString *)trim:(NSString *)val trimCharacterSet:(NSCharacterSet *)characterSet {
    NSString *returnVal = @"";
    if (val) {
        returnVal = [val stringByTrimmingCharactersInSet:characterSet];
    }
    return returnVal;
}
+ (NSString *)trimWhitespace:(NSString *)val {
    return [self trim:val trimCharacterSet:[NSCharacterSet whitespaceCharacterSet]]; //去掉前后空格
}
+ (NSString *)trimNewline:(NSString *)val {
    return [self trim:val trimCharacterSet:[NSCharacterSet newlineCharacterSet]]; //去掉前后回车符
}
+ (NSString *)trimWhitespaceAndNewline:(NSString *)val {
    return [self trim:val trimCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去掉前后空格和回车符
}





//计算时间差
+ (NSString *)nowFromdDate:(NSString *)dateString{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    NSDate *today = [[NSDate date]dateByAddingTimeInterval:interval];
    NSDate *day = [[dateFormatter dateFromString:dateString] dateByAddingTimeInterval:interval];
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
        if(time < 0){
            [timeStr appendFormat:@"刚刚"];
        }else{
            [timeStr appendFormat:@"%d秒前",(int)time];
        }
    }
    
    return timeStr;
}
- (NSString *)stringByDeletingHtmlLabel{
    NSString *noHtmlString = [self stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    noHtmlString = [noHtmlString stringByReplacingOccurrencesOfString:@"</br>" withString:@"\n"];
    noHtmlString = [noHtmlString stringByReplacingOccurrencesOfString:@"</p>" withString:@"\n"];
    noHtmlString = [noHtmlString stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    noHtmlString = [noHtmlString stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@"  "];
    
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|"
                                                                                    options:0
                                                                                      error:nil];
    noHtmlString=[regularExpretion stringByReplacingMatchesInString:noHtmlString options:NSMatchingReportProgress range:NSMakeRange(0, noHtmlString.length) withTemplate:@""];
    return noHtmlString;
}





/**
 *  URLEncode
 */
- (NSString *)URLEncodedString
{
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *unencodedString = self;
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString
{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *encodedString = self;
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

@end
