#import <Foundation/Foundation.h>

#import "Term.h"

#ifdef __cplusplus
#import "kiwi/kiwi.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface Expression : NSObject {
#ifdef __cplusplus
    kiwi::Expression *impl;
#endif
}

- (nonnull instancetype)initWithConstant:(double)constant;

- (nonnull instancetype)initWithTerm:(Term * _Nonnull)term;

- (nonnull instancetype)initWithTerm:(Term * _Nonnull)term constant:(double)constant;

- (nonnull instancetype)initWithTerms:(NSArray<Term *> * _Nonnull)terms;

- (nonnull instancetype)initWithTerms:(NSArray<Term *> * _Nonnull)terms constant:(double)constant;

- (double)value;
- (NSArray<Term *> * _Nonnull)terms;
- (double)constant;

#ifdef __cplusplus
- (kiwi::Expression *)getImpl;
#endif

NS_ASSUME_NONNULL_END

@end
