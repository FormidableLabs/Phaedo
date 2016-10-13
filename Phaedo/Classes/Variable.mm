#import "Variable.h"
#import "kiwi/kiwi.h"

@implementation Variable

- (instancetype)initWithName:(NSString *)name
{

    self = [super init];
    if (self) {
        impl = new kiwi::Variable([name UTF8String]);
    }
    return self;
}

- (double)value
{
    return impl->value();
}

- (NSString *)name
{
  return [NSString stringWithUTF8String:impl->name().c_str()];
}

- (kiwi::Variable *)getImpl
{
    return impl;
}

- (void)dealloc
{
    delete impl;
}

@end
