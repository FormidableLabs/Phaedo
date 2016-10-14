#ifndef Solver_h
#define Solver_h

#import <Foundation/Foundation.h>

#import "Constraint.h"

#ifdef __cplusplus
#import "../kiwi/kiwi.h"
#endif

NS_ASSUME_NONNULL_BEGIN
@interface Solver : NSObject {
#ifdef __cplusplus
  kiwi::Solver *impl;
#endif
}

- (instancetype)init;

- (void)addConstraint:(Constraint *)constraint;

- (void)addEditVariable:(Variable *)variable strength:(Strength)strength;

- (void)dump;

- (void)removeConstraint:(Constraint *)constraint;

- (void)removeEditVariable:(Variable *)variable strength:(Strength)strength;

- (void)reset;

- (void)suggestValue:(Variable *)variable value:(double)value;

- (void)updateVariables;

- (BOOL)hasConstraint:(Constraint *)constraint;

- (BOOL)hasEditVariable:(Variable *)variable;

@end
NS_ASSUME_NONNULL_END

#endif /* Solver_h */
