//
//  ComSpiirImageProxy.m
//  imaging
//
//  Created by Gudmundur Hreidarsson on 06/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  0

#import "ComSpiirImage.h"
#import "UIImage+Resize.h"
#import <Foundation/Foundation.h>

@implementation ComSpiirImage

- (id)initWithBlob:(TiBlob*)blob
{
    self = [super initWithImage:[blob image]];
    if (self) {
        compressionQuality = 1.0;
    }
    return self;
}

- (id)initWithImage:(UIImage*)image
{
    self = [super initWithImage:image];
    if (self) {
        compressionQuality = 1.0;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)setCompressionQuality:(id)args 
{
    compressionQuality = [TiUtils floatValue:args];
}

-(NSData*)data
{
    return UIImageJPEGRepresentation([super image], compressionQuality);
}

- (id)scaleImageDown:(id)args
{
	[super ensureImageLoaded];
    UIImage *image = super.image;
	if (image!=nil)
	{
		ENSURE_ARG_COUNT(args,2);
		
        CGSize scaledSize = CGSizeMake([TiUtils intValue:[args objectAtIndex:0]], [TiUtils intValue:[args objectAtIndex:1]]);              
        CGSize imageSize = [image size];

        // Don't scale up
        if (imageSize.width <= scaledSize.width && imageSize.height <= scaledSize.height)
            return [[[ComSpiirImage alloc] initWithImage:image] autorelease];
       
        // Retain correct proportions
		if (imageSize.width < imageSize.height)
			scaledSize.width = scaledSize.height * imageSize.width/imageSize.height;
		else
			scaledSize.height = scaledSize.width * imageSize.height/imageSize.width;	
        
		return [[[ComSpiirImage alloc] initWithImage:[UIImageResize resizedImage:scaledSize interpolationQuality:kCGInterpolationHigh image:image hires:NO]] autorelease];
	}
	return nil;
}

@end
