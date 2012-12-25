//
//  MandalaView.h
//  Mandala
//
//  Created by Stefan Hintz on 24.12.12.
//  Copyright (c) 2012 Stefan Hintz. All rights reserved.

@interface MandalaView : NSView

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger count2;

- (IBAction)update:(id)sender;

@end
