//
//  NSURL+URLQueryBuilder.m
//  NSURLComponents
//
//  Created by Yaroslav Arsenkin on 26.10.15.
//  Copyright © 2015 Iaroslav Arsenkin. All rights reserved.
//  Website: http://arsenkin.com
//

#import "NSURL+URLQueryBuilder.h"

@implementation NSURL (URLQueryBuilder)

+ (NSURL *)gs_queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements {
    return [self gs_queryWithString:URL queryElements:queryElements resolveAgainstBaseURL:NO URLComponent:nil];
}

+ (NSURL *)gs_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements {
    return [self gs_queryWithURL:URL queryElements:queryElements resolveAgainstBaseURL:NO URLComponent:nil];
}

+ (NSURL *)gs_queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve {
    return [self gs_queryWithURL:[NSURL URLWithString:URL] queryElements:queryElements resolveAgainstBaseURL:resolve URLComponent:nil];
}

+ (NSURL *)gs_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve {
    return [self gs_queryWithURL:URL queryElements:queryElements resolveAgainstBaseURL:resolve URLComponent:nil];
}

#pragma mark W/ Pointer to URLComponent

+ (NSURL *)gs_queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [self gs_queryWithString:URL queryElements:queryElements resolveAgainstBaseURL:NO URLComponent:URLComponent];
}

+ (NSURL *)gs_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [self gs_queryWithURL:URL queryElements:queryElements resolveAgainstBaseURL:NO URLComponent:URLComponent];
}

+ (NSURL *)gs_queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [self gs_queryWithURL:[NSURL URLWithString:URL] queryElements:queryElements resolveAgainstBaseURL:resolve URLComponent:URLComponent];
}

#pragma mark Main Method

+ (NSURL *)gs_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    NSMutableArray<NSURLQueryItem *> *mQueryItems = [NSMutableArray array];
    for (NSString *key in queryElements) {
        NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:key value:queryElements[key]];
        [mQueryItems addObject:queryItem];
    }
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:resolve];
    components.queryItems = [mQueryItems copy];
    
    if (URLComponent) {
        *URLComponent = components;
    }
    return components.URL;
}

@end
