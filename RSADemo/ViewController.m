//
//  ViewController.m
//  RSADemo
//
//  Created by 邢程 on 16/2/26.
//  Copyright © 2016年 XingCheng. All rights reserved.
//

#import "ViewController.h"
#import "RSA.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注意：这里的公私钥需要PKCS#8格式 如果不是PKCS#8需要使用openssl进行格式转换。"-----BEGIN PUBLIC KEY-----"和"-----BEGIN PRIVATE KEY-----"这样的是PKCS#8。
    
    NSString* publicKey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCytbb08iu+YqrqlDIlAG0QOBdY\nJfWVja/79CQrxi14j42ofrPhkBtrISC0/jLPYAr0cggOH2Ejk6ho8FLyVebWJV8f\nUItdYIGw+d5D/3b6g83aaeKRnGugAZuUzn0o7AW6niTitBwDrBnssp2pjvlT8soF\nAy/HuabWnXs8tVTvAwIDAQAB\n-----END PUBLIC KEY-----";
    NSString*privateKey = @"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALK1tvTyK75iquqU\nMiUAbRA4F1gl9ZWNr/v0JCvGLXiPjah+s+GQG2shILT+Ms9gCvRyCA4fYSOTqGjw\nUvJV5tYlXx9Qi11ggbD53kP/dvqDzdpp4pGca6ABm5TOfSjsBbqeJOK0HAOsGeyy\nnamO+VPyygUDL8e5ptadezy1VO8DAgMBAAECgYBZFAC1Sb0KMi5VrTbtgK/cZMkm\nFA281RpCcWhSNX9W199ZfIZ3SZiRJrsh3I9BFPOA8xIW0Adgb2qDnD8MMktT3pk4\nIiXKnhkFLPAEDAoMz+iXmC49Zjavv11rFQ5aWY+UwfkXmOhZiOdSk6X5vUJBO0uT\nw2SsQwG/2xjksr71oQJBAOwVeWV8pu9+lM6QsAIGKkqYRkg3sTdB0uQbgt3Qk+7S\n1+oHmVGPpeVtiPQ4Jw/WCREsuoMSh660fC67uKm8/TMCQQDByS0U+fCFD6eFWD5v\n0t/lqNgTvDbqhtyfomwm6IF19lBFdkZ2PgMQlv/nrPodDekHTWlahLZe9J5+wqbt\n1ybxAkEA2q9Noz+jVueXKf0GvOk/FZgWSmEkTD4x/tCpGZVS4v/1tzhQwidhEbO0\nEB1PubCW94zKPA3XF3LiMVv8Q2bn1wJAFgvtNRW6Z2kAhgskD1TOZDJxYs1m8gel\n0gOIimSpVeJP/5cVLR6g+qIzOwhS7DtI56vG8KVomiT6YzGCDE0OAQJAfC9aaBrd\n5GErEGGoJTWnTkxqWXRgKAhlrrlugPx9J77IwEhcVl1/FvHiVykM9p6tnLC4gR88\nhJBHDXw+R6o9tg==\n-----END PRIVATE KEY-----";
    
    NSString* content = @"hello world!";
    NSString *encWithPubKey = [RSA encryptString:content publicKey:publicKey];
    NSLog(@"encryptString:\n%@",encWithPubKey);
    NSString *decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privateKey];
    NSLog(@"decryptString:\n%@",decWithPrivKey);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
