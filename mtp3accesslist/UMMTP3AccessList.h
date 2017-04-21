//
//  UMMTP3AccessList.h
//  mtp3accesslist
//
//  Created by Andreas Fink on 21.04.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulibmtp3/ulibmtp3.h>

@interface UMMTP3AccessList : UMMTP3PointcodeFilter
{
    NSArray *_configEntries;
}

- (UMMTP3Filter_Result)filterPointcode:(UMMTP3PointCode *)pc;

@end
