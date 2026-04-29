//
//  NSKeyedArchiver+YYAdd.h
//  YYKit <https://github.com/ibireme/YYKit>
//
//  Created by ibireme on 13/8/4.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSKeyedArchiver (YYAdd)

+ (nullable NSData *)yy_archivedDataWithRootObject:(id)rootObject;

@end

NS_ASSUME_NONNULL_END
