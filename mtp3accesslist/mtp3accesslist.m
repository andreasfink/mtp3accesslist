//
//  mtp3accesslist.m
//  mtp3accesslist
//
//  Created by Andreas Fink on 21.04.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "mtp3accesslist.h"
#import "UMMTP3AccessList.h"
#import "version.h"

int         plugin_init(void)
{
    return 0;
}

int         plugin_exit(void)
{
    return 0;
}

NSString *  plugin_name(void)
{
    return @"mtp3accesslist";
}

UMPlugin *  plugin_create(void)
{
    return [[UMMTP3AccessList alloc]init];
}

NSDictionary *plugin_info(void)
{
    return @{
             @"type" : @"mtp3-pointcode-filter",
             @"version": @(VERSION),
             @"name" : plugin_name(),
             @"build" : @(BUILD),
             @"builddate" : @(BUILDDATE),
             @"compiledate" : @(COMPILEDATE)
            };
}


