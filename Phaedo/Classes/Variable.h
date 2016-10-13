#import <Foundation/Foundation.h>

#ifdef __cplusplus
#import "kiwi/kiwi.h"
#endif

NS_ASSUME_NONNULL_BEGIN
@interface Variable : NSObject {
    #ifdef __cplusplus
    kiwi::Variable *impl;
    #endif
}

- (nonnull instancetype)initWithName:(NSString * _Nonnull)name;

- (double)value;
- (NSString * _Nonnull)name;

#ifdef __cplusplus
- (kiwi::Variable *)getImpl;
#endif

NS_ASSUME_NONNULL_END

@end
