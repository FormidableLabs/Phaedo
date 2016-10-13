#import <Foundation/Foundation.h>

#import "Variable.h"

#ifdef __cplusplus
#import "kiwi/kiwi.h"
#endif

NS_ASSUME_NONNULL_BEGIN
@interface Term : NSObject {
    #ifdef __cplusplus
    kiwi::Term *impl;
    #endif
}

- (instancetype)initWithVariable:(Variable *)variable;

- (instancetype)initWithVariable:(Variable *)variable
                     coefficient:(double)coefficient;

- (double)value;
- (Variable *)variable;
- (double)coefficient;

#ifdef __cplusplus
- (kiwi::Term *)getImpl;
#endif

@end

NS_ASSUME_NONNULL_END
