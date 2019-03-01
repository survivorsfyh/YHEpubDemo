//
//  ReadEpubVC.m
//  YHEpubDemo
//
//  Created by survivors on 2019/3/1.
//  Copyright © 2019年 survivorsfyh. All rights reserved.
//

#import "ReadEpubVC.h"

@interface ReadEpubVC ()

@end

@implementation ReadEpubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 张学良传     TestEpub
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"张学良传"withExtension:@"epub"];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        XDSBookModel *bookModel = [XDSBookModel getLocalModelWithURL:fileURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            XDSReadPageViewController *pageView = [[XDSReadPageViewController alloc] init];
            [[XDSReadManager sharedManager] setResourceURL:fileURL];//文件位置
            [[XDSReadManager sharedManager] setBookModel:bookModel];
            [[XDSReadManager sharedManager] setRmDelegate:pageView];
            [self presentViewController:pageView animated:YES completion:nil];
        });
    });
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
