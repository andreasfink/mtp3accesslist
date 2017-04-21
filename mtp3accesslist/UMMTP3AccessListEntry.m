//
//  UMMTP3AccessListEntry.m
//  mtp3accesslist
//
//  Created by Andreas Fink on 21.04.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import "UMMTP3AccessListEntry.h"

@implementation UMMTP3AccessListEntry

- (UMMTP3AccessListEntry *)initWithString:(NSString *)cfgLine variant:(UMMTP3Variant)variant
{
    self = [super init];
    if(self)
    {
        NSArray *a = [cfgLine componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if([a count]==2)
        {
            NSString *pcString = a[0];
            NSString *allowString = a[1];

            NSArray *b = [pcString componentsSeparatedByString:@"/"];
            if([b count]==2)
            {
                _pc = [[UMMTP3PointCode alloc]initWithString:b[0] variant:variant];
                _mask = [b[1] intValue];
                if(_mask > [_pc maxmask])
                {
                    @throw([NSException exceptionWithName:@"SYNTAX" reason:@"pointcode mask is too big" userInfo:NULL]);
                }
            }
            else
            {
                _pc = [[UMMTP3PointCode alloc]initWithString:pcString variant:variant];
                _mask = [_pc maxmask];
            }
            if([allowString caseInsensitiveCompare:@"allow"])
            {
                _result = UMMTP3Filter_Result_allow;
            }
            else if([allowString caseInsensitiveCompare:@"deny"])
            {
                _result = UMMTP3Filter_Result_deny;
            }
            else if([allowString caseInsensitiveCompare:@"undefined"])
            {
                _result = UMMTP3Filter_Result_undefined;
            }
            else
            {
                NSString *reason = [NSString stringWithFormat:@"dont understand rule action '%@'",allowString];
                @throw([NSException exceptionWithName:@"SYNTAX" reason:reason userInfo:NULL]);
            }
        }
        else
        {
            NSString *reason = [NSString stringWithFormat:@"can not parse line '%@' is too big",cfgLine];
            @throw([NSException exceptionWithName:@"SYNTAX" reason:reason userInfo:NULL]);
        }
    }
    return self;
}

- (NSString *)config
{
    NSString *rule;
    switch(_result)
    {
        case UMMTP3Filter_Result_allow:
            rule = @"allow";
            break;
        case UMMTP3Filter_Result_deny:
            rule = @"deny";
            break;
        case UMMTP3Filter_Result_undefined:
        default:
            rule = @"undefined";
            break;
    }
    return [NSString stringWithFormat:@"%@/%d %@",[_pc stringValue],_mask,  rule];
}

- (UMMTP3Filter_Result)filterPointcode:(UMMTP3PointCode *)xpc
{
    UMMTP3PointCode *ypc = [xpc maskedPointcode:_mask];
    if(ypc.pc != _pc.pc)
    {
        return UMMTP3Filter_Result_undefined;
    }
    return _result;
}


@end
