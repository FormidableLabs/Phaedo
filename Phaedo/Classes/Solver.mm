#import "Solver.h"
#import "Constraint.h"
#import "Variable.h"
#import "kiwi/kiwi.h"

@implementation Solver

- (void)addConstraint:(Constraint *)constraint
{
    impl->addConstraint(*[constraint getImpl]);
}

- (void)addEditVariable:(Variable *)variable strength:(Strength)strength
{
    impl->addEditVariable(*[variable getImpl], [Constraint convertStrength:strength]);
}

- (void)dump
{
    impl->dump();
}

- (void)removeConstraint:(Constraint *)constraint
{
    impl->removeConstraint(*[constraint getImpl]);
}

- (void)removeEditVariable:(Variable *)variable strength:(Strength)strength
{
    impl->removeEditVariable(*[variable getImpl]);
}

- (void)reset
{
    impl->reset();
}

- (void)suggestValue:(Variable *)variable value:(double)value
{
    impl->suggestValue(*[variable getImpl], value);
}

- (void)updateVariables
{
    impl->updateVariables();
}

- (BOOL)hasConstraint:(Constraint *)constraint
{
    return impl->hasConstraint(*[constraint getImpl]);
}

- (BOOL)hasEditVariable:(Variable *)variable
{
    return impl->hasEditVariable(*[variable getImpl]);
}

- (instancetype)init
{

    if (self = [super init]) {
        impl = new kiwi::Solver();
    }
    return self;
}

- (void)dealloc
{
    delete impl;
}

@end
