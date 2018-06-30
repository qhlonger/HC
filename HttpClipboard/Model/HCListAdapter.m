//
//  HCListAdapter.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCListAdapter.h"

@implementation HCListAdapter
- (void)setItem:(HCItem *)item{
    _item = item;
    
    self.numberOfInfo = item.info.count;
    
    self.numberOfItems = item.subItems.count;
    
    
    
}
- (NSString *)mimeTypeForFileAtPath:(NSString *)path{
    return [path lastPathComponent];
    NSDictionary *info = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    return    info[NSFileType];
    
    
    if (![[[NSFileManager alloc] init] fileExistsAtPath:path]) {
        return nil;
    }

    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)(MIMEType);
}

//- (HCFileType)typeOfPath:(NSString *)path{
//    NSString *type = [path pathExtension];
//    
//    return type;
//    
//}
- (NSString *)pathOfIndex:(NSInteger)index{
    return [self.item.path stringByAppendingPathComponent:[self titleForIndex:index]];
}
- (NSString *)titleForIndex:(NSInteger)index{
    return self.item.subItems[index];
}

- (NSString *)detailKeyForIndex:(NSInteger)index{
    return self.item.info.allKeys[index];
}
- (NSString *)detailValueForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%@", self.item.info[ self.item.info.allKeys[index]]];
}
@end
