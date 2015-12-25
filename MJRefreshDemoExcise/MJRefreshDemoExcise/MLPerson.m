//
//  MLPerson.m
//  refresh
//
//  Created by 李明禄 on 15/12/24.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLPerson.h"

@implementation MLPerson

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)personWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
