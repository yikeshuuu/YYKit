//
//  YYTextCopyPasteExample.m
//  YYKitExample
//
//  Created by ibireme on 15/9/12.
//  Copyright (c) 2015 ibireme. All rights reserved.
//

#import "YYTextCopyPasteExample.h"
#import "YYKit.h"

static CGFloat YYDemoTopLayoutInset(UIViewController *vc) {
    if (@available(iOS 11.0, *)) return vc.view.safeAreaInsets.top;
    CGFloat inset = 0;
    if (!vc.navigationController.navigationBarHidden) inset += vc.navigationController.navigationBar.height;
    inset += [UIApplication sharedApplication].statusBarFrame.size.height;
    return inset;
}

@interface YYTextCopyPasteExample ()<YYTextViewDelegate>
@property (nonatomic, assign) YYTextView *textView;
@end

@implementation YYTextCopyPasteExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *text = @"You can copy image from browser or photo album and paste it to here. It support animated GIF and APNG. \n\nYou can also copy attributed string from other YYTextView.";
    
    YYTextSimpleMarkdownParser *parser = [YYTextSimpleMarkdownParser new];
    [parser setColorWithDarkTheme];
    
    YYTextView *textView = [YYTextView new];
    textView.text = text;
    textView.font = [UIFont systemFontOfSize:17];
    textView.size = self.view.size;
    textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    textView.delegate = self;
    textView.allowsPasteImage = YES; /// Pasts image
    textView.allowsPasteAttributedString = YES; /// Paste attributed string
    if (kiOS7Later) {
        textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    }
    textView.contentInset = UIEdgeInsetsMake(YYDemoTopLayoutInset(self), 0, 0, 0);
    textView.scrollIndicatorInsets = textView.contentInset;
    [self.view addSubview:textView];
    self.textView = textView;
    
    textView.selectedRange = NSMakeRange(text.length, 0);
    [textView becomeFirstResponder];
}

- (void)edit:(UIBarButtonItem *)item {
    if (_textView.isFirstResponder) {
        [_textView resignFirstResponder];
    } else {
        [_textView becomeFirstResponder];
    }
}

- (void)textViewDidBeginEditing:(YYTextView *)textView {
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(edit:)];
    self.navigationItem.rightBarButtonItem = buttonItem;
}

- (void)textViewDidEndEditing:(YYTextView *)textView {
    self.navigationItem.rightBarButtonItem = nil;
}

@end
