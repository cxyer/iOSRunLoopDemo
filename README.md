# RunLoop
1. NSRunLoop和CFRunLoopRef：CFRunLoopRef更加底层，NSRunLoop是对CFRunLoopRef的封装
2. 与线程的关系：每条线程都有唯一的与之对应的RunLoop；主线程的RunLoop自动创建，子线程的RunLoop需要手动创建，```[[NSRunLoop currentRunLoop] run]```；主要用来负责响应需要处理的各种事件和消息
3. 获取RunLoop对象
    ```
    [NSRunLoop currentRunLoop];
    [NSRunLoop mainRunLoop];

    CFRunLoopGetCurrent();
    CFRunLoopGetMain();
    ```
4. RunLoop类
    1. CFRunLoopRef
    2. CFRunLoopModeRef
        ```
        {
            kCFRunLoopDefaultMode
            kCFRunLoopCommonModes
        }
        ```
    3. CFRunLoopSourseRef
        1. sourse0：自己实现的方法
        2. sourse1：系统提供的方法
    4. CFRunLoopObserverRef
        ```
        {
            kCFRunLoopEntry
            kCFRunLoopBeforeTimers
            kCFRunLoopBeforeSources
            kCFRunLoopBeforeWaiting
            kCFRunLoopAfterWaiting
            kCFRunLoopExit
            kCFRunLoopAllActivities
        }
        ```
    5. CFRunLoopTimerRef
5. 过程
    1. kCFRunLoopEntry即将进入
    2. kCFRunLoopBeforeTimers即将处理timers
    3. kCFRunLoopBeforeSources即将处理sources
    4. 处理source0
    5. 处理source1
    6. kCFRunLoopBeforeWaiting即将休眠
    7. 休眠 (定时器、显式唤醒、事件都会唤醒)
    8. kCFRunLoopAfterWaiting即将唤醒
    9. 收到消息，跳到2
    10. kCFRunLoopExit
