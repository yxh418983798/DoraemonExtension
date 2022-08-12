//
//  DoraemonNSLogManager+Extension.m
//  DoraemonExtension
//
//  Created by alfie on 2022/8/12.
//

#import "DoraemonNSLogManager+Extension.h"
#import <objc/runtime.h>


@implementation DoraemonNSLogManager (Extension)
static void *AFDoraemonNSLogQueueKey = &AFDoraemonNSLogQueueKey;

/// 交换方法
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method original = class_getInstanceMethod(DoraemonNSLogManager.class, @selector(addNSLog:));
        Method swizzled = class_getInstanceMethod(DoraemonNSLogManager.class, @selector(af_addNSLog:));
        method_exchangeImplementations(original, swizzled);
    });
}

/// 串行队列
- (dispatch_queue_t)serialQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.doraemonExtension.nslog", DISPATCH_QUEUE_SERIAL);
        dispatch_queue_set_specific(queue, AFDoraemonNSLogQueueKey, &AFDoraemonNSLogQueueKey, NULL);
    });
    return queue;
}

/// 执行方法添加到串行队列下
- (void)af_addNSLog:(NSString *)log {
    if (dispatch_get_specific(AFDoraemonNSLogQueueKey)) {
        [self af_addNSLog:log];
    } else {
        dispatch_async(self.serialQueue, ^{
            [self af_addNSLog:log];
        });
    }
}



@end
