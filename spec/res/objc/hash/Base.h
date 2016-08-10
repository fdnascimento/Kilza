//
//  Base.h
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//  Generated by Kilza https://github.com/Jaspion/Kilza
//

#import <Foundation/Foundation.h>

@class Space;
@class Special;
@class Obj;
@class Underscore;

@interface Base : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong, nullable) NSString * _id;
@property (nonatomic, strong, nullable) NSString * str;
@property (nonatomic, strong, nullable) NSNumber * num;
@property (nonatomic, strong, nullable) NSNumber * flo;
@property (nonatomic, strong, nullable) NSNumber * boo;
@property (nonatomic, strong, nullable) Space * spa_ce;
@property (nonatomic, strong, nullable) Special * special;
@property (nonatomic, strong, nullable) NSMutableArray * arrdouble;
@property (nonatomic, strong, nullable) NSMutableArray * arrnum;
@property (nonatomic, strong, nullable) NSMutableArray * arrstr;
@property (nonatomic, strong, nullable) NSMutableArray * arrboo;
@property (nonatomic, strong, nullable) NSMutableArray * arrnull;
@property (nonatomic, strong, nullable) Obj * obj;
@property (nonatomic, strong, nullable) NSMutableArray * arrobj;
@property (nonatomic, strong, nullable) Underscore * _underscore;

+ (Base * _Nonnull)modelWithDictionary:(NSDictionary * _Nonnull)dict;
+ (Base * _Nonnull)modelWithString:(NSString * _Nonnull)json;

- (instancetype _Nonnull)initWithString:(NSString * _Nonnull)json;
- (instancetype _Nonnull)initWithDictionary:(NSDictionary * _Nonnull)dict;
- (NSDictionary * _Nonnull)dictionaryRepresentation;

@end
