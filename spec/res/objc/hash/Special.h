//
//  Special.h
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//  Generated by Kilza https://github.com/Jaspion/Kilza
//

#import <Foundation/Foundation.h>


@interface Special : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong, nullable) id a;
@property (nonatomic, strong, nullable) NSString * _b______;
@property (nonatomic, strong, nullable) NSString * with_some_spaces;
@property (nonatomic, strong, nullable) NSNumber * _new;

+ (Special * _Nonnull)modelWithDictionary:(NSDictionary * _Nonnull)dict;
+ (Special * _Nonnull)modelWithString:(NSString * _Nonnull)json;

- (instancetype _Nonnull)initWithString:(NSString * _Nonnull)json;
- (instancetype _Nonnull)initWithDictionary:(NSDictionary * _Nonnull)dict;
- (NSDictionary * _Nonnull)dictionaryRepresentation;

@end
