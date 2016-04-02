//
//  ViewController.m
//  Demo2_JS_Music1
//
//  Created by  江苏 on 16/3/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()<AVAudioPlayerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *allTimeLabel;
@property (strong, nonatomic) IBOutlet UISlider *mySlider;
@property (strong, nonatomic) IBOutlet UIButton *myButton;
@property(nonatomic)int musicCount;
@property(nonatomic)int allMsusicCount;
@property(nonatomic,strong)AppDelegate* app;
@property(nonatomic,strong)NSTimer* timer;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegment;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.app=[UIApplication sharedApplication].delegate;
    self.musicCount=[self.musicNumber intValue];
    self.allMsusicCount=(int)self.mlTvc.musicFiles.count;
    [self playMusic];
    self.mySlider.minimumValue=0;
    self.mySlider.maximumValue=1;
    self.timer=[NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(shuaxin) userInfo:nil repeats:YES];
}
-(void)playMusic{
    if (self.musicCount==self.allMsusicCount) {
        self.musicCount=0;
    }else if (self.musicCount==-1){
        self.musicCount=self.allMsusicCount-1;
    }
    NSString* currentMusicPath=[self.app.player.url path];
    NSString* newPath=self.mlTvc.musicFiles[self.musicCount];
    if (![currentMusicPath isEqualToString:newPath]) {
        self.app.player=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:newPath] error:nil];
        }
    [self.myButton setTitle:@"暂停" forState:UIControlStateNormal];
    //放里面，原来页面会被销毁，然后就找不到了，所以放外面，每次进入界面重新设置代理
    self.app.player.delegate=self;
    [self.app.player play];
    self.title=[[newPath lastPathComponent]componentsSeparatedByString:@"."][0];
    self.currentTimeLabel.text=[NSString stringWithFormat:@"%02d:%02d", (int)self.app.player.currentTime/60,(int)self.app.player.currentTime%60];
    self.allTimeLabel.text=[NSString stringWithFormat:@"%02d:%02d", (int)self.app.player.duration/60,(int)self.app.player.duration%60];
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    switch (self.mySegment.selectedSegmentIndex) {
        case 0:{
            [self playMusic];
            break;
        }
        case 1:
        {
            self.musicCount++;
            [self playMusic];
        }
        case 2:
        {
            self.musicCount=arc4random()%self.allMsusicCount;
            [self playMusic];
        }
            break;
    }
}
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags NS_DEPRECATED_IOS(6_0, 8_0){
    [self.app.player pause];
}
- (IBAction)valuechanged:(id)sender {
    self.app.player.currentTime=self.mySlider.value*self.app.player.duration;
}
-(void)shuaxin{
    self.currentTimeLabel.text=[NSString stringWithFormat:@"%02d:%02d", (int)self.app.player.currentTime/60,(int)self.app.player.currentTime%60];
    self.mySlider.value=self.app.player.currentTime/self.app.player.duration;
}
- (IBAction)start:(UIButton *)sender {
    if (self.app.player.isPlaying) {
        [self.app.player pause];
        [self.myButton setTitle:@"播放" forState:UIControlStateNormal];
    }else{
        [self.app.player play];
        [self.myButton setTitle:@"暂停" forState:UIControlStateNormal];
    }
}
- (IBAction)goQuickly:(id)sender {
    if (self.mySegment.selectedSegmentIndex==2) {
        self.musicCount=arc4random()%self.allMsusicCount;
    }else{
       self.musicCount--;
    }
    [self playMusic];
}
- (IBAction)goback:(id)sender {
    if (self.mySegment.selectedSegmentIndex==2) {
        self.musicCount=arc4random()%self.allMsusicCount;
    }else{
        self.musicCount++;
    }
    [self playMusic];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.timer invalidate];
}
-(void)dealloc{
    NSLog(@"页面销毁了");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
