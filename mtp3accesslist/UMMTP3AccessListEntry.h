//
//  UMMTP3AccessListEntry.h
//  mtp3accesslist
//
//  Created by Andreas Fink on 21.04.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulibmtp3/ulibmtp3.h>

@interface UMMTP3AccessListEntry : UMObject
{
    UMMTP3PointCode *_pc;
    int             _mask;
    UMMTP3Filter_Result _result;
}

@property(readwrite,strong) UMMTP3PointCode *pc;
@property(readwrite,assign) int mask;
@property(readwrite,assign) UMMTP3Filter_Result result;

- (UMMTP3AccessListEntry *)initWithString:(NSString *)cfgLine variant:(UMMTP3Variant)variant;
- (UMMTP3Filter_Result)filterPointcode:(UMMTP3PointCode *)xpc;

@end
