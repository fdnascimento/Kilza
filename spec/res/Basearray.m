//
//  Basearray.m
//
//  Created on 2016-04-07
//  Copyright (c) 2016. All rights reserved.
//

#import "Basearray.h"

// Original names
NSString * const kBasearrayBasearrayobject = @"BaseArrayObject";

@interface Basearray ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Basearray

+ (Basearray *)modelWithDictionary:(NSDictionary *)dict
{
  Basearray *instance = [[Basearray alloc] initWithDictionary:dict];
  return instance;
}

+ (Basearray *)modelWithString:(NSString *)json
{
  Basearray *instance = [[Basearray alloc] initWithString:json];
  return instance;
}

- (instancetype)initWithString:(NSString *)json
{
  self = [super init];

  if (![[json stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] hasPrefix:@"{"])
    json = [NSString stringWithFormat:@"{ \"%@\" : %@ }", kBasearrayBasearrayobject, json];

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
    self.basearrayobject = [self objectOrNilForKey:kBasearrayBasearrayobject fromDictionary:dict];
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];

  [mutableDict setValue:self.basearrayobject forKey:kBasearrayBasearrayobject];

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

  self.basearrayobject = [aDecoder decodeObjectForKey:kBasearrayBasearrayobject];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:_basearrayobject forKey:kBasearrayBasearrayobject];
}

- (id)copyWithZone:(NSZone *)zone
{
  Basearray *copy = [[Basearray alloc] init];
  if (copy)
  {
    copy.basearrayobject = [self.basearrayobject copyWithZone:zone];
  }

  return copy;
}

@end