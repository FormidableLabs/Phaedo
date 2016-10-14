#import "Constraint.h"
#import "../kiwi/kiwi.h"
#import "Expression.h"

@interface Constraint () {
 @private
  Relation _op;
  Strength _strength;
}
@end

@implementation Constraint

+ (kiwi::RelationalOperator)convertRelation:(Relation)relation {
  switch (relation) {
    case EqualTo:
      return kiwi::RelationalOperator::OP_EQ;
    case LessThanOrEqualTo:
      return kiwi::RelationalOperator::OP_LE;
    case GreaterThanOrEqualTo:
      return kiwi::RelationalOperator::OP_GE;
  }
}

+ (Relation)convertOperator:(kiwi::RelationalOperator)op {
  switch (op) {
    case kiwi::RelationalOperator::OP_EQ:
      return EqualTo;
    case kiwi::RelationalOperator::OP_LE:
      return LessThanOrEqualTo;
    case kiwi::RelationalOperator::OP_GE:
      return GreaterThanOrEqualTo;
  }
}

+ (double)convertStrength:(Strength)strength {
  switch (strength) {
    case Required:
      return kiwi::strength::required;
    case Strong:
      return kiwi::strength::strong;
    case Medium:
      return kiwi::strength::medium;
    case Weak:
      return kiwi::strength::weak;
  }
}

- (instancetype)initWithExpression:(Expression *)expression
operator:(Relation)relation {
  if (self = [super init]) {
    _op = relation;
    _strength = Required;
    impl = new kiwi::Constraint(*[expression getImpl],
                                [Constraint convertRelation:_op],
                                [Constraint convertStrength:_strength]);
  }
  return self;
}

- (instancetype)initWithExpression:(Expression *)expression
operator:(Relation)relation
                          strength:(Strength)strength {
  if (self = [super init]) {
    _op = relation;
    _strength = strength;
    impl = new kiwi::Constraint(*[expression getImpl],
                                [Constraint convertRelation:_op],
                                [Constraint convertStrength:_strength]);
  }
  return self;
}

- (instancetype)initWithOther:(Constraint *)constraint
                     strength:(Strength)strength {
  if (self = [super init]) {
    _strength = strength;
    impl = new kiwi::Constraint(*[constraint getImpl],
                                [Constraint convertStrength:_strength]);
  }
  return self;
}

- (kiwi::Constraint *)getImpl {
  return impl;
}

- (Relation)op {
  return _op;
}

- (double)strength {
  return _strength;
}

- (void)dealloc {
  delete impl;
}

@end
