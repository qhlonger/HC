//
//  NSString+QTool.h
//  teacher
//
//  Created by 邱海龙 on 16/5/9.
//  Copyright © 2016年 xiayp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (QTool)
/**
 *  返回字符串需要所占的空间
 *
 *  @param font    字符串字号
 *  @param maxSize 最大的范围
 *
 *  @return 返回范围
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (NSString *)md5Str;
//- (NSString*) sha1Str;

+ (NSString *)getTimeBySeparator:(NSString *)sep;
+ (NSString *)getTimeMinBySeparator:(NSString *)sep;
+ (NSString *)getTimeByDate:(NSDate *)date Separator:(NSString *)sep;
- (NSDate *)changeToDateWithSeparator:(NSString *)sep;
/**
 *  返回xx小时/天前
 *
 *  @param compareDate 需要和现在比较的时间
 *
 *  @return xx小时/天前
 */
+ (NSString *) compareCurrentTime:(NSString *) compareDate;
- (BOOL)isSameDay:(NSString *)dateStr;

+ (NSString *)getYearByDate:(NSDate *)date;
+ (NSString *)getMonthByDate:(NSDate *)date;
+ (NSString *)getDateByDate:(NSDate *)date;
+ (NSString *)getYearMonthByDate:(NSDate *)date;
+ (NSString *)getTimeByDate:(NSDate *)date;


+ (NSString *)getMinSecStringByDate:(NSDate *)date;
+ (NSDate *)getMinSecDateByString:(NSString *)str;

/**
 *  为字符串格式的ininteger数字设置增量
 *
 *  @param increment 增量
 *
 *  @return +了增量后的字符串格式数字
 */
- (NSString *)setIncrement:(NSInteger)increment;
- (NSDate *)getDate;




+ (NSString *)trimWhitespace:(NSString *)val;//去掉前后空格
+ (NSString *)trimNewline:(NSString *)val;//去掉前后回车符
+ (NSString *)trimWhitespaceAndNewline:(NSString *)val;//去掉前后空格和回车符




+ (NSString *)nowFromdDate:(NSString *)dateString;
- (NSString*)md532BitLower;
- (NSString*)md532BitUpper;
- (NSString *)stringByDeletingHtmlLabel;



/**
 *  URLEncode
 */
- (NSString *)URLEncodedString;
/**
 *  URLDecode
 */
-(NSString *)URLDecodedString;


@end
