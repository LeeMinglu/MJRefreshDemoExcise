//
//  MLPerson.h
//  refresh
//
//  Created by 李明禄 on 15/12/24.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLPerson : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)personWithDict:(NSDictionary *)dict;
@end
