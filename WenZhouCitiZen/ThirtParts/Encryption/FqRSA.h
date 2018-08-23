

#import <Foundation/Foundation.h>

@interface FqRSA : NSObject
#define FqPubkey @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/pIM56ngESi7EOwQfX24PcQhWsHYsDJCblh2GF2wzt3Mta53EEpDnKWsotBhS4U4YRK1JqG7tHNyw6anXoFxp0o1yGbh2nRBgTmUB285JG0VFJxOBAUtWV5yNVLQyUnmTpJc2HBJr3L4kurYQsE9X4mQe2wZZUW34PJxttPtAMQIDAQAB"
// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;//公钥加密
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;

+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;//公钥解密
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;

@end
