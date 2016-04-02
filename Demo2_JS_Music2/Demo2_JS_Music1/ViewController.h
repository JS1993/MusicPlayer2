//
//  ViewController.h
//  Demo2_JS_Music1
//
//  Created by  江苏 on 16/3/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MusicListTableViewController.h"
@interface ViewController : UIViewController
@property(nonatomic,strong)NSString* path;
@property(nonatomic,strong)NSNumber* musicNumber;
@property(nonatomic,strong)MusicListTableViewController* mlTvc;
@end

