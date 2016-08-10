//
//  Null.h
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//  Generated by Kilza https://github.com/Jaspion/Kilza
//

#import <Foundation/Foundation.h>


@interface Null : NSObject <NSCoding, NSCopying>


+ (Null * _Nonnull)modelWithDictionary:(NSDictionary * _Nonnull)dict;
+ (Null * _Nonnull)modelWithString:(NSString * _Nonnull)json;

- (instancetype _Nonnull)initWithString:(NSString * _Nonnull)json;
- (instancetype _Nonnull)initWithDictionary:(NSDictionary * _Nonnull)dict;
- (NSDictionary * _Nonnull)dictionaryRepresentation;

@end
