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

#pragma mark -
#pragma mark Building regular request path

+ (NSURL *)gs_pathWithBaseURL:(NSString *)baseURL objects:(NSArray<NSString *> *)objects {
    NSURL *URL = [NSURL URLWithString:baseURL];
    for (NSString *object in objects) {
        NSString *pathObject = [object stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
        URL = [URL URLByAppendingPathComponent:pathObject];
    }
    
    return URL;
}

#pragma mark -
#pragma mark Building GET request path

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
    NSCharacterSet *allowedCharacters = [NSCharacterSet URLQueryAllowedCharacterSet];
    for (NSString *key in queryElements) {
        NSString* queryKey = [key stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
        NSString *value = [queryElements[key] stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
        
        NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:queryKey value:value];
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
