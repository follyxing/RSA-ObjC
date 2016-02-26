# RSA-ObjC
RSA encryption and decryption [RSA 加密解密]

#使用前
###首先，建议大家看完这段文字。可能节省你很多时间！

## 如果你已经生成了公钥私钥
首先看一下你的公钥格式（私钥同理）

Style1:

```
-----BEGIN PUBLIC KEY-----
...
-----END PUBLIC KEY-----
```

Style2:

```
-----BEGIN RSA PUBLIC KEY-----
...
-----END RSA PUBLIC KEY-----
```

你手中可能是这两种格式中的一种，如果你的公私钥格式和```Style1```一样。那可以不用看剩余的文字，可以直接使用本框架了。

如果你手中的公私钥格式和```Style2```一样。那就需要你手动使用openssl改变格式。可以看一下这篇文章[Stackoverflow](http://stackoverflow.com/questions/18039401/how-can-i-transform-between-the-two-styles-of-public-key-format-one-begin-rsa)

## 如果你还没有生成公私钥
	使用项目中 gen_rsakey.sh 脚本，生成公钥私钥文件。一共会生成四个文件，两个公钥，两个私钥。
	
	其中
	
	public_key_pkcs#8.pem
	
	private_key_pkcs#8.pem
	
	
	这两个文件是我们需要的版本。可以直接用编辑器打开，复制文件里面的公私钥直接使用在我们的项目中。
	
	还有两个文件
	
	public_key.pem
	
	private_key.pem
	
	这两个文件是另一个版本，我们项目中并不需要。但是在别的语言中RSA框架中可能使用的是这个版本。
# 使用

```
#import "RSA.h"


 NSString* publicKey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCytbb08iu+YqrqlDIlAG0QOBdY\nJfWVja/79CQrxi14j42ofrPhkBtrISC0/jLPYAr0cggOH2Ejk6ho8FLyVebWJV8f\nUItdYIGw+d5D/3b6g83aaeKRnGugAZuUzn0o7AW6niTitBwDrBnssp2pjvlT8soF\nAy/HuabWnXs8tVTvAwIDAQAB\n-----END PUBLIC KEY-----";
    NSString*privateKey = @"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALK1tvTyK75iquqU\nMiUAbRA4F1gl9ZWNr/v0JCvGLXiPjah+s+GQG2shILT+Ms9gCvRyCA4fYSOTqGjw\nUvJV5tYlXx9Qi11ggbD53kP/dvqDzdpp4pGca6ABm5TOfSjsBbqeJOK0HAOsGeyy\nnamO+VPyygUDL8e5ptadezy1VO8DAgMBAAECgYBZFAC1Sb0KMi5VrTbtgK/cZMkm\nFA281RpCcWhSNX9W199ZfIZ3SZiRJrsh3I9BFPOA8xIW0Adgb2qDnD8MMktT3pk4\nIiXKnhkFLPAEDAoMz+iXmC49Zjavv11rFQ5aWY+UwfkXmOhZiOdSk6X5vUJBO0uT\nw2SsQwG/2xjksr71oQJBAOwVeWV8pu9+lM6QsAIGKkqYRkg3sTdB0uQbgt3Qk+7S\n1+oHmVGPpeVtiPQ4Jw/WCREsuoMSh660fC67uKm8/TMCQQDByS0U+fCFD6eFWD5v\n0t/lqNgTvDbqhtyfomwm6IF19lBFdkZ2PgMQlv/nrPodDekHTWlahLZe9J5+wqbt\n1ybxAkEA2q9Noz+jVueXKf0GvOk/FZgWSmEkTD4x/tCpGZVS4v/1tzhQwidhEbO0\nEB1PubCW94zKPA3XF3LiMVv8Q2bn1wJAFgvtNRW6Z2kAhgskD1TOZDJxYs1m8gel\n0gOIimSpVeJP/5cVLR6g+qIzOwhS7DtI56vG8KVomiT6YzGCDE0OAQJAfC9aaBrd\n5GErEGGoJTWnTkxqWXRgKAhlrrlugPx9J77IwEhcVl1/FvHiVykM9p6tnLC4gR88\nhJBHDXw+R6o9tg==\n-----END PRIVATE KEY-----";
    
    NSString* content = @"hello world!";
    NSString *encWithPubKey = [RSA encryptString:content publicKey:publicKey];
    NSLog(@"encryptString:\n%@",encWithPubKey);
    NSString *decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privateKey];
    NSLog(@"decryptString:\n%@",decWithPrivKey);
```