//
//  Special.m
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//

#import "Special.h"

// Original names
NSString * const kSpecialA = @"A";
NSString * const kSpecial_b______ = @"[B]""&^ ";
NSString * const kSpecialWith_some_spaces = @"with some spaces";
NSString * const kSpecial_mynew = @"_mynew";

@interface Special ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Special

+ (Special *)modelWithDictionary:(NSDictionary *)dict
{
  Special *instance = [[Special alloc] initWithDictionary:dict];
  return instance;
}

+ (Special *)modelWithString:(NSString *)json
{
  Special *instance = [[Special alloc] initWithString:json];
  return instance;
}

- (instancetype)initWithString:(NSString *)json
{
  self = [super init];

  NSError *jsonError = nil;
  NSData *objectData = [json dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                      options:NSJSONReadingMutableContainers
                                        error:&jsonError];
  if (!jsonError)
    self = [self initWithDictionary:dict];

  return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
  self = [super init];

  if (self && [dict isKindOfClass:[NSDictionary class]])
  {
    self.a = [self objectOrNilForKey:kSpecialA fromDictionary:dict];
    self._b______ = [self objectOrNilForKey:kSpecial_b______ fromDictionary:dict];
    self.with_some_spaces = [self objectOrNilForKey:kSpecialWith_some_spaces fromDictionary:dict];
    self._mynew = [self objectOrNilForKey:kSpecial_mynew fromDictionary:dict];
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];

  [mutableDict setValue:self.a forKey:kSpecialA];
  [mutableDict setValue:self._b______ forKey:kSpecial_b______];
  [mutableDict setValue:self.with_some_spaces forKey:kSpecialWith_some_spaces];
  [mutableDict setValue:self._mynew forKey:kSpecial_mynew];

  return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
  id object = [dict objectForKey:aKey];
  return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super init];

  self.a = [aDecoder decodeObjectForKey:kSpecialA];
  self._b______ = [aDecoder decodeObjectForKey:kSpecial_b______];
  self.with_some_spaces = [aDecoder decodeObjectForKey:kSpecialWith_some_spaces];
  self._mynew = [aDecoder decodeObjectForKey:kSpecial_mynew];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:_a forKey:kSpecialA];
  [aCoder encodeObject:__b______ forKey:kSpecial_b______];
  [aCoder encodeObject:_with_some_spaces forKey:kSpecialWith_some_spaces];
  [aCoder encodeObject:__mynew forKey:kSpecial_mynew];
}

- (id)copyWithZone:(NSZone *)zone
{
  Special *copy = [[Special alloc] init];
  if (copy)
  {
    copy.a = [self.a copyWithZone:zone];
    copy._b______ = [self._b______ copyWithZone:zone];
    copy.with_some_spaces = [self.with_some_spaces copyWithZone:zone];
    copy._mynew = [self._mynew copyWithZone:zone];
  }

  return copy;
}

@end
