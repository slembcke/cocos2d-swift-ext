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

#import "TestBase.h"
#import "CCStaticNode.h"

@interface CCStaticNodeTest : TestBase @end
@implementation CCStaticNodeTest

-(void)setupStaticNodeTest
{
	CCNode *staticNode = [CCStaticNode node];
	[self.contentNode addChild:staticNode];
	
	CGSize size = [CCDirector sharedDirector].viewSize;
	
	for(int i=0; i<100000; i++){
		CCColor *color = [CCColor colorWithRed:CCRANDOM_0_1() green:CCRANDOM_0_1() blue:CCRANDOM_0_1() alpha:0.5 + 0.5*CCRANDOM_0_1()];
		
		CCNodeColor *node = [CCNodeColor nodeWithColor:color width:10 height:10];
		node.anchorPoint = ccp(0.5, 0.5);
		node.position = ccp(2*size.width*CCRANDOM_0_1(), 2*size.height*CCRANDOM_0_1());
		node.rotation = 90*CCRANDOM_0_1();
		
		[staticNode addChild:node];
	}
}

@end
