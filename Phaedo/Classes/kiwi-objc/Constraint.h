#import <Foundation/Foundation.h>

#import "Expression.h"

#ifdef __cplusplus
#import "../kiwi/kiwi.h"
#endif

NS_ASSUME_NONNULL_BEGIN
@interface Constraint : NSObject {
#ifdef __cplusplus
  kiwi::Constraint *impl;
#endif
}

typedef NS_ENUM(NSInteger, Relation) {
  EqualTo,
  LessThanOrEqualTo,
  GreaterThanOrEqualTo
};

typedef NS_ENUM(NSInteger, Strength) { Required, Strong, Medium, Weak };

#ifdef __cplusplus
+ (kiwi::RelationalOperator)convertRelation:(Relation)relation;
+ (Relation)convertOperator:(kiwi::RelationalOperator)op;
#endif

+ (double)convertStrength:(Strength)strength;

- (instancetype)initWithExpression:(Expression *)Expression
operator:(Relation)Relation;

- (instancetype)initWithExpression:(Expression *)Expression
operator:(Relation)Relation
                          strength:(Strength)strength;

- (instancetype)initWithOther:(Constraint *)Constraint
                     strength:(Strength)strength;

- (Relation)op;

- (double)strength;

#ifdef __cplusplus
- (kiwi::Constraint *)getImpl;
#endif

@end

NS_ASSUME_NONNULL_END
