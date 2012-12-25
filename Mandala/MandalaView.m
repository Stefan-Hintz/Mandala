//
//  MandalaView.m
//  Mandala
//
//  Created by Stefan Hintz on 24.12.12.
//  Copyright (c) 2012 Stefan Hintz. All rights reserved.

#import "MandalaView.h"

@implementation MandalaView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
        [self update:nil];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	// Background
	NSBezierPath *bezierPath = [NSBezierPath bezierPathWithRect:dirtyRect];
	[[NSColor whiteColor] set];
	[bezierPath fill];
	
	// Lines
	NSPoint center = NSMakePoint(self.frame.size.width * 0.5, self.frame.size.height * 0.5);

	CGFloat delta = 2.0 * M_PI / self.count;
	CGFloat delta2 = 2.0 * M_PI / self.count2;

	CGFloat radius = MIN(self.frame.size.width, self.frame.size.height) * 0.5 * sin(delta2 * 0.5);
	
	bezierPath = [NSBezierPath bezierPath];

	for (NSInteger index = 0; index < self.count; index++)
	{
		CGFloat angle = delta * index;
		NSPoint point = center;
		
		[bezierPath moveToPoint:point];
		
		for (NSInteger index2 = 0; index2 < self.count2-1; index2++)
		{
			CGFloat angle2 = delta2 * index2;

			point = NSMakePoint(point.x + cos(angle + angle2) * radius, point.y + sin(angle + angle2) * radius);
			[bezierPath lineToPoint:point];
		}
		
		[bezierPath closePath];
	}
	[[NSColor blackColor] set];
	bezierPath.lineWidth = 3;
	[bezierPath stroke];
}

- (IBAction)update:(id)sender
{
	self.count = [[NSUserDefaults standardUserDefaults] integerForKey:@"count"];
	self.count2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"count2"];
	
	[self setNeedsDisplay:YES];
}


@end
