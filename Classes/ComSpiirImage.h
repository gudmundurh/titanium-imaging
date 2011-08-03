//
//  ComSpiirImageProxy.h
//  imaging
//
//  Created by Gudmundur Hreidarsson on 06/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TiUtils.h"
#import "TiBlob.h"

@interface ComSpiirImage : TiBlob {
@private
    CGFloat compressionQuality;
}
- (id)initWithBlob:(TiBlob*)blob;
@end
