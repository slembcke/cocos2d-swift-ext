/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 * Copyright (c) 2013-2014 Cocos2D Authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "CCStaticNode.h"
#import "CCRenderer_Private.h"

@implementation CCStaticNode
{
	CCRenderer *_cachedRenderer;
}

-(void)visit:(CCRenderer *)mainRenderer parentTransform:(const GLKMatrix4 *)parentTransform
{
	// Generate the renderer if it doesn't exist and render all children into it.
	if(!_cachedRenderer){
		_cachedRenderer = [[CCRenderer alloc] init];
		
		[CCRenderer bindRenderer:_cachedRenderer];
		[super visit:_cachedRenderer parentTransform:parentTransform];
		[CCRenderer bindRenderer:mainRenderer];
		
		[_cachedRenderer prepare];
	}
	
	// Copy the ivar into a local variable to make the block thread safe.
	CCRenderer *cachedRenderer = _cachedRenderer;
	[mainRenderer enqueueBlock:^{
		[cachedRenderer invalidateState];
		[cachedRenderer execute];
	} globalSortOrder:0 debugLabel:@"CCStaticNode" threadSafe:YES];
}

-(void)markAsDirty
{
	// Throw away the cached renderer so it will be regererated.
	_cachedRenderer = nil;
}

@end




