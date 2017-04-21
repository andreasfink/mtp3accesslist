//
//  UMMTP3AccessList.m
//  mtp3accesslist
//
//  Created by Andreas Fink on 21.04.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "UMMTP3AccessList.h"
#import "UMMTP3AccessListEntry.h"

@implementation UMMTP3AccessList


- (void)configUpdate
{
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    for(NSString *line in _config)
    {
        UMMTP3AccessListEntry *entry = [[UMMTP3AccessListEntry alloc]initWithString:line variant:_variant];
        if(entry)
        {
            [entries addObject:entry];
        }
    }

    @synchronized (self)
    {
        _configEntries = entries;
    }
}

- (UMMTP3Filter_Result)filterPointcode:(UMMTP3PointCode *)xpc
{
    NSMutableArray *entries;
    @synchronized (self)
    {
        entries = [_configEntries copy];
    }

    for(UMMTP3AccessListEntry *entry in entries)
    {
        UMMTP3Filter_Result r = [entry filterPointcode:xpc];
        if(r != UMMTP3Filter_Result_undefined)
        {
            return r;
        }
    }
    return UMMTP3Filter_Result_undefined;
}

@end
