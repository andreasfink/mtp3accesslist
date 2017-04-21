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
    return @"mtp3-accesslist";
}

UMPlugin *  plugin_create(void)
{
    return [[UMMTP3AccessList alloc]init];
}

NSString *plugin_version(void)
{
    return @(VERSION);
}

NSString *plugin_build(void)
{
    return @(BUILD);
}

NSString *plugin_builddate(void)
{
    return @(BUILDDATE);
}

NSString *plugin_compiledate(void)
{
    return @(COMPILEDATE);
}
