#import "Expression.h"
#import "Term.h"
#import "kiwi/kiwi.h"

@interface Expression () {
@private
  NSArray<Term *> *_terms;
}
@end

@implementation Expression

- (instancetype)initWithConstant:(double)constant
{
  if (self = [super init]) {
    impl = new kiwi::Expression(constant);
  }
  return self;
}

- (instancetype)initWithTerm:(Term *)term
{
  if (self = [super init]) {
    _terms = @[term];

    impl = new kiwi::Expression(*[term getImpl]);
  }
  return self;
}

- (instancetype)initWithTerm:(Term *)term constant:(double)constant
{
  if (self = [super init]) {
    _terms = @[term];

    impl = new kiwi::Expression(*[term getImpl], constant);
  }
  return self;
}

- (instancetype)initWithTerms:(NSArray<Term *> *)terms
{
  if (self = [super init]) {
    _terms = terms;

    std::vector<kiwi::Term> termImpls;
    for (const Term *term in terms) {
      termImpls.push_back(*[term getImpl]);
    }
    impl = new kiwi::Expression(termImpls);
  }
  return self;
}

- (instancetype)initWithTerms:(NSArray<Term *> *)terms constant:(double)constant
{
  if (self = [super init]) {
    _terms = terms;

    std::vector<kiwi::Term> termImpls;
    for (const Term *term in terms) {
      termImpls.push_back(*[term getImpl]);
    }
    impl = new kiwi::Expression(termImpls, constant);
  }
  return self;
}

- (double)value
{
  return impl->value();
}

- (NSArray<Term *> *)terms {
  return _terms;
}

- (double)constant {
  return impl->constant();
}

- (kiwi::Expression *)getImpl
{
  return impl;
}

- (void)dealloc
{
  delete impl;
}

@end
