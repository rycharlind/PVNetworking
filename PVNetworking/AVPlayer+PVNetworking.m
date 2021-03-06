//
//  AVPlayer+PVNetworking.m
//
//  Copyright (c) 2013 Inndevers. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AVPlayer+PVNetworking.h"
#import "PVCache.h"

@implementation AVPlayer (PVNetworking)

- (void) setVideoWithObject:(PFObject *)object forFieldName:(NSString*)fieldName {
    
    // Create the PFFile object
    PFFile *video = [object objectForKey:fieldName];
    
    // Create new thread for download video data from Parse asynchronously
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
       
        NSData *data = [video getData]; // Download video data
        NSURL *url = [PVCache cacheData:data withName:object.objectId]; // Cache the video down to temp directory
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url]; 
        
        // Dispatch to main queue to update UI
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self replaceCurrentItemWithPlayerItem:item];
            
        });
        
    });

}

@end
