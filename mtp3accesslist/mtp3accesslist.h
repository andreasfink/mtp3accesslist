//
//  mtp3accesslist.h
//  mtp3accesslist
//
//  Created by Andreas Fink on 21.04.17.
//  Copyright © 2017 Andreas Fink. All rights reserved.
//

#import <ulibmtp3/ulibmtp3.h>

FOUNDATION_EXPORT int plugin_init(void);
FOUNDATION_EXPORT int plugin_exit(void);
FOUNDATION_EXPORT NSString *plugin_name(void);
FOUNDATION_EXPORT UMPlugin *plugin_create(void);



