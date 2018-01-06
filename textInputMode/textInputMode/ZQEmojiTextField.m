//
//  ZQEmojiTextField.m
//  textInputMode
//
//  Created by 琦张 on 2018/1/7.
//  Copyright © 2018年 ZQ. All rights reserved.
//

#import "ZQEmojiTextField.h"

@implementation ZQEmojiTextField

/**
 引用官方文档中的说明： You can redefine this property and use it to return a different text input mode in cases where you want a responder to use a specific keyboard. The user can still change the keyboard while the responder is active, but switching away to another responder and then back restores the keyboard you specified.
 */
- (UITextInputMode *)textInputMode
{
    static UITextInputMode *emojiMode = nil;
    if (emojiMode == nil) {
        for (UITextInputMode *mode in [UITextInputMode activeInputModes]) {
            if ([mode.primaryLanguage isEqualToString:@"emoji"]) {
                emojiMode = mode;
                break;
            }
        }
    }
    return emojiMode;
}

@end
