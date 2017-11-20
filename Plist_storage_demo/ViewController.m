//
//  ViewController.m
//  Plist_storage_demo
//
//  Created by Derek on 12/11/17.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    

    
}

- (IBAction)saveDataClickFunction:(UIButton *)sender {
    
    //1、模拟数据
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (int i=1; i<10; i++) {
        [mutableArray addObject:[NSString stringWithFormat:@"test-%d",i]];
    }
    //2、获取Documents路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //3、拼接文件名称
    NSString *fileName = [documentsPath stringByAppendingPathComponent:@"save_data.plist"];
    //4、写入存储数据
    [mutableArray writeToFile:fileName atomically:YES];
    
    NSLog(@"文件存储路径———— ： %@",documentsPath);
    NSLog(@"数据保存成功！");
    
}
- (IBAction)getDataClickFunction:(UIButton *)sender {
    
    //1、获取Documents路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //2、拼接文件名称
    NSString *fileName = [path stringByAppendingPathComponent:@"save_data.plist"];
    //3、读取数据
    NSArray *dataArray =[NSArray arrayWithContentsOfFile:fileName];
    
    
    
    for (NSString *string in dataArray) {
        NSLog(@"———— ： %@",string);
    }
    
    NSLog(@"数据读取成功！");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
