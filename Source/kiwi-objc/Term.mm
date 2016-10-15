#import "Term.h"
#import "../kiwi/kiwi.h"

@interface Term () {
 @private
  Variable *_variable;
}
@end

@implementation Term

- (instancetype)initWithVariable:(Variable *)variable {
  if (self = [super init]) {
    _variable = variable;
    impl = new kiwi::Term(*[_variable getImpl], 1.0);
  }
  return self;
}

- (instancetype)initWithVariable:(Variable *)variable
                     coefficient:(double)coefficient {
  if (self = [super init]) {
    _variable = variable;
    impl = new kiwi::Term(*[variable getImpl], coefficient);
  }
  return self;
}

- (double)value {
  return impl->value();
}

- (Variable *)variable {
  return _variable;
}

- (double)coefficient {
  return impl->coefficient();
}

- (kiwi::Term *)getImpl {
  return impl;
}

- (void)dealloc {
  delete impl;
}

@end
