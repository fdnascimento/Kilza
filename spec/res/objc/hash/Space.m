//
//  Space.m
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//  Generated by Kilza https://github.com/Jaspion/Kilza
//

#import "Space.h"

// Original names
NSString *const kSpace_1one = @"1one";

@interface Space ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Space

+ (Space *)modelWithDictionary:(NSDictionary *)dict {
    if (!dict) return nil;
    Space *instance = [[Space alloc] initWithDictionary:dict];
    return instance;
}

+ (Space *)modelWithString:(NSString *)json {
    if (!json) return nil;
    Space *instance = [[Space alloc] initWithString:json];
    return instance;
}

- (instancetype)initWithString:(NSString *)json {
    self = [super init];

    if (![[json stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] hasPrefix:@"{"])
        json = [NSString stringWithFormat:@"{ \"%@\" : %@ }", kSpace_1one, json];

    NSError *jsonError = nil;
    NSData *objectData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    if (!jsonError)
        self = [self initWithDictionary:dict];

    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];

    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self._1one = [self objectOrNilForKey:kSpace_1one fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];

    [mutableDict setValue:self._1one forKey:kSpace_1one];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self._1one = [aDecoder decodeObjectForKey:kSpace_1one];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:__1one forKey:kSpace_1one];
}

- (id)copyWithZone:(NSZone *)zone {
    Space *copy = [[Space alloc] init];
    if (copy) {
        copy._1one = [self._1one copyWithZone:zone];
    }

    return copy;
}

@end
