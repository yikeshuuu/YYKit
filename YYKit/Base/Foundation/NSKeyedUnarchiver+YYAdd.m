//
//  NSKeyedUnarchiver+YYAdd.m
//  YYKit <https://github.com/ibireme/YYKit>
//
//  Created by ibireme on 13/8/4.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "NSKeyedUnarchiver+YYAdd.h"
#import "YYKitMacro.h"

YYSYNTH_DUMMY_CLASS(NSKeyedUnarchiver_YYAdd)


@implementation NSKeyedArchiver (YYAdd)

+ (NSData *)yy_archivedDataWithRootObject:(id)rootObject {
    if (!rootObject) return nil;
    if (@available(iOS 11.0, tvOS 11.0, macOS 10.13, watchOS 4.0, *)) {
        NSError *error = nil;
        return [NSKeyedArchiver archivedDataWithRootObject:rootObject requiringSecureCoding:NO error:&error];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [NSKeyedArchiver archivedDataWithRootObject:rootObject];
#pragma clang diagnostic pop
}

@end

@implementation NSKeyedUnarchiver (YYAdd)

+ (id)yy_unarchiveObjectWithData:(NSData *)data {
    if (!data) return nil;
    if (@available(iOS 11.0, tvOS 11.0, macOS 10.13, watchOS 4.0, *)) {
        NSError *error = nil;
        return [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [NSDictionary class], [NSSet class], [NSString class], [NSNumber class], [NSData class], [NSDate class], [NSURL class], [NSValue class], [NSNull class], nil] fromData:data error:&error];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
#pragma clang diagnostic pop
}

+ (id)unarchiveObjectWithData:(NSData *)data exception:(__autoreleasing NSException **)exception {
    id object = nil;
    @try {
        object = [self yy_unarchiveObjectWithData:data];
    }
    @catch (NSException *e)
    {
        if (exception) *exception = e;
    }
    @finally
    {
    }
    return object;
}

+ (id)unarchiveObjectWithFile:(NSString *)path exception:(__autoreleasing NSException **)exception {
    id object = nil;

    @try {
        NSData *data = [NSData dataWithContentsOfFile:path];
        object = [self yy_unarchiveObjectWithData:data];
    }
    @catch (NSException *e)
    {
        if (exception) *exception = e;
    }
    @finally
    {
    }
    return object;
}

@end
