//
//  ViewController.m
//  维度
//
//  Created by 与你共度 on 2019/6/9.
//  Copyright © 2019 与你共度. All rights reserved.
//

#import "ViewController.h"
#import "JWLikeAnimtionView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIButton * DingWei;
@property (nonatomic,strong) UILabel * WeiZhi;
@property (nonatomic,strong) UIButton * Tuijian;
@property (nonatomic,strong) UIButton * Fujin;
@property (nonatomic,strong) UITableView * TuijianTbv;


@end

@implementation ViewController

//定位
-(UIButton *)DingWei{
    if (!_DingWei) {
        
        _DingWei = [[UIButton alloc]initWithFrame:CGRectMake(20, 57, 30, 30)];
        [_DingWei setImage:[UIImage imageNamed:@"dingwei"] forState:UIControlStateNormal];
        [_DingWei addTarget:self action:@selector(DingWei) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _DingWei;
}
-(UILabel *)WeiZhi{
    if (!_WeiZhi) {
        _WeiZhi = [[UILabel alloc]initWithFrame:CGRectMake(50, 60, 100, 30)];
        _WeiZhi.text = @"北京";
        
    }
    return _WeiZhi;
}
//推荐影院
-(UIButton *)Tuijian{
    if (!_Tuijian) {
        _Tuijian = [[UIButton alloc]initWithFrame:CGRectMake(80, 100, 100, 30)];
        _Tuijian.backgroundColor = [UIColor redColor];
//        _Tuijian.titleLabel.text = @"推荐影院";
        [_Tuijian setTitle:@"推荐影院" forState:UIControlStateNormal];
        _Tuijian.layer.masksToBounds = YES;
        _Tuijian.layer.cornerRadius = 5;

    }
    return _Tuijian;
}
-(UITableView *)TuijianTbv{
    if (!_TuijianTbv) {
        _TuijianTbv  = [[UITableView alloc]initWithFrame:CGRectMake(30, 140, self.view.frame.size.width-60, self.view.frame.size.height-140) style:UITableViewStylePlain];
        _TuijianTbv.separatorStyle=UITableViewCellSeparatorStyleNone;//在syle为UITableViewStylePlain有效，隐藏了分隔线，但在UITableViewStyle为UITableViewStyleGrouped时不起作用.
        
        
        
        _TuijianTbv.delegate = self;
        _TuijianTbv.dataSource = self;
    }
    return _TuijianTbv;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        UIView *CellView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-80, 100)];
        CellView.layer.masksToBounds = YES;
        CellView.layer.cornerRadius = 5;
        CellView.layer.borderWidth = 1;
        
        CellView.layer.borderColor = [[UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1] CGColor];
        
        
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        view1.backgroundColor = [UIColor blackColor];
        view1.layer.masksToBounds = YES;
        view1.layer.cornerRadius = 5;
        
        UILabel *Label1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, cell.frame.size.width-100, 25)];
        Label1.text = @"CGV影城";
        
        UILabel *Label2 = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, cell.frame.size.width-100, 20)];
        Label2.font = [UIFont systemFontOfSize:15];
        Label2.lineBreakMode = NSLineBreakByTruncatingTail;
        Label2.numberOfLines = 2;
        Label2.text = @"海淀区清河中街68号华锐五彩城t购物中心东区7层";
        
        UILabel *Label3 = [[UILabel alloc]initWithFrame:CGRectMake(100,70, 80, 30)];
        Label3.font = [UIFont systemFontOfSize:15];
        Label3.text = @"3.2km";
        
        JWLikeAnimtionView * likeView= [[JWLikeAnimtionView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 70, 40, 38)];
//        likeView.center = self.view.center;
        likeView.animationDurtion = 0.4;
        likeView.shapeFillColor = UIColorFromRGB(0xFC3962);
        likeView.likeBlock = ^(BOOL isLike) {
            NSLog(@"%@",isLike ? @"点赞":@"取消赞");
        
        };
        
        [CellView addSubview:view1];
        [CellView addSubview:Label1];
        [CellView addSubview:Label2];
        [CellView addSubview:Label3];
        [CellView addSubview:likeView];
        [cell addSubview:CellView];
        
    }
    return cell;
}

//重写 cell 点击事件 去除表格点击灰色效果
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
    //当离开某行时，让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//附近影院
-(UIButton *)Fujin{
    if (!_Fujin) {
        _Fujin = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+30, 100, 100, 30)];
        _Fujin.backgroundColor = [UIColor redColor];
//        _Fujin.titleLabel.text = @"附近影院";
        [_Fujin setTitle:@"附近影院" forState:UIControlStateNormal];
        _Fujin.layer.masksToBounds = YES;
        _Fujin.layer.cornerRadius = 5;
    }
    return _Fujin;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    [self.view addSubview:self.DingWei];
    [self.view addSubview:self.WeiZhi];
    [self.view addSubview:self.Tuijian];
    [self.view addSubview:self.Fujin];
    [self.view addSubview:self.TuijianTbv];
    
    
    
}

//定位点击

@end
