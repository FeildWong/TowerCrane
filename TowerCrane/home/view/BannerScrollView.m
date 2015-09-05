//
//  BannerScrollView.m
//  eLife
//
//  Created by WangPF on 15/3/16.
//  Copyright (c) 2015年 刘鹤. All rights reserved.
//

#import "BannerScrollView.h"
#import "UIImageView+WebCache.h"


@implementation BannerScrollView

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//        self.numberOfPages = 1;
//        [self initViews:frame];
//        self.clipsToBounds = YES;
//        //设置NSTimer
//        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
//    }
//    return self;
//}

- (void)awakeFromNib
{
    if (self) {
        self.frame = CGRectMake(0, 0, APP_SCREEN_WIDTH, 140);
        // Initialization code
        self.numberOfPages = 1;
        [self initViews:self.frame];
        self.clipsToBounds = YES;
        //设置NSTimer
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
    }
}
- (void)initViews:(CGRect)frame{
    
    
    _scrollImageView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollImageView.backgroundColor = [UIColor grayColor];
    _scrollImageView.pagingEnabled = YES;
    _scrollImageView.directionalLockEnabled = YES;
    _scrollImageView.bounces = NO;
    //    _scrollImageView.contentSize = CGSizeMake(_scrollImageView.frame.size.width * _numberOfPages, _scrollImageView.frame.size.height);
    _scrollImageView.showsHorizontalScrollIndicator = NO;
    _scrollImageView.showsVerticalScrollIndicator = NO;
    _scrollImageView.delegate = self;
    _scrollImageView.backgroundColor = [UIColor clearColor];
    _currentPage = 0;
    [self addSubview:_scrollImageView];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20)];
    _pageControl.backgroundColor = [UIColor grayColor];
    _pageControl.numberOfPages = _numberOfPages;
    _pageControl.currentPage = 0;
    _pageControl.backgroundColor = [UIColor clearColor];//RGBA(0, 0, 0, 0.1);
    [self addSubview:_pageControl];
    
}

#pragma mark -
#pragma mark Setter

- (void)setNumberOfPages:(NSInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < _numberOfPages; i++) {
        [views addObject:[NSNull null]];
    }
    self.imageViews = views;
    
    _scrollImageView.contentSize = CGSizeMake(self.frame.size.width * (numberOfPages + 2), self.frame.size.height);
    _pageControl.numberOfPages = numberOfPages;
    
}

- (void)setImageUrlArr:(NSArray *)imageUrlArr{
    
    _imageUrlArr = imageUrlArr;
    self.numberOfPages = _imageUrlArr.count;
    
    if (imageUrlArr.count == 1) {
        
        UISwipeGestureRecognizer *swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:nil];
        [_scrollImageView addGestureRecognizer:swipGesture];
        
        _scrollImageView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        
        _scrollImageView.userInteractionEnabled = YES;
    }
    
    for (int i = 0; i < _numberOfPages + 2; i ++) {
        NSString *imageURL = @"";
        if (i != _imageUrlArr.count +1 && i != 0) {
            
            imageURL = _imageUrlArr[i - 1];
            NSLog(@"%@",imageURL);
        }
        if (i == 0) {
            imageURL = _imageUrlArr[_imageUrlArr.count - 1];
            NSLog(@"%@",imageURL);
        }else if(i == imageUrlArr.count +1)
        {
            imageURL = _imageUrlArr[0];
            NSLog(@"%@",imageURL);
        }
        
        //创建内容对象
        UIImageView *tempView = [[UIImageView alloc] init];
        tempView.frame = CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height);
        tempView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewTapAction:)];
        tempView.contentMode = UIViewContentModeScaleToFill;
        [tempView addGestureRecognizer:tapGesture];
        
        
        [tempView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"backBtn.png"]];
        tempView.backgroundColor = [UIColor grayColor];
        
        //添加视图
        [_scrollImageView addSubview:tempView];
    }
    [_scrollImageView setContentOffset:CGPointMake(0, 0)];
    [_scrollImageView scrollRectToVisible:CGRectMake(self.frame.size.width,0,self.frame.size.width,self.frame.size.height) animated:NO];
    
}

- (void)contentViewTapAction:(UITapGestureRecognizer *)tap
{
//    if ([Tool isNetWorkReachable] == FALSE) {
//        
//        UIApplication *application = [UIApplication sharedApplication];
//        
//        
//        [SGInfoAlert showInfo:kNetWorkError
//                      bgColor:[[UIColor orangeColor] CGColor]
//                       inView:application.keyWindow
//                     vertical:0.7];
//        
//        return;
//        
//    }else if (self.TapActionBlock) {
//        
        self.TapActionBlock(self.pageControl.currentPage);
//    }
}

#pragma mark -
#pragma mark Buz

- (void)createAllEmptyPagesForScrollView: (int) pages {
    if (pages < 0) {
        return;
    }
    
    for (int page = 0; page < pages; page++) {
        CGRect frame = _scrollImageView.frame;
        
        
        UIActivityIndicatorView *actIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [actIndicator setCenter:CGPointMake(frame.size.width * page + 140, 131)];
        [_scrollImageView addSubview:actIndicator];
        [actIndicator startAnimating];
    }
    
}

- (void)loadScrollViewWithPage:(int)page {
    
    if (page < 0) {
        return;
    }
    if (page >= _numberOfPages) {
        
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        __block UIImageView *tempView = [_imageViews objectAtIndex:page];
        if ((NSNull *)tempView == [NSNull null]) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                tempView = [[UIImageView alloc] init];
                tempView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
                tempView.contentMode = UIViewContentModeScaleAspectFill;
                tempView.clipsToBounds = YES;
                [tempView sd_setImageWithURL:[NSURL URLWithString:_imageUrlArr[page]] placeholderImage:nil];
                [_imageViews replaceObjectAtIndex:page withObject:tempView];
            });
        }
        
        if (tempView) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (nil == tempView.superview) {
                    CGRect frame = _scrollImageView.frame;
                    frame.origin.x = frame.size.width * page;
                    frame.origin.y = 0;
                    tempView.frame = CGRectMake(self.frame.size.width*page, 0, self.frame.size.width, self.frame.size.height);
                    [tempView sd_setImageWithURL:[NSURL URLWithString:_imageUrlArr[page]] placeholderImage:nil];
                    [_scrollImageView addSubview:tempView];
                }
            });
        }
    });
}


#pragma mark -
#pragma mark UIScrollView delegate

// scrollview 委托函数
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (_imageUrlArr.count == 1) {
        return;
    }
    CGFloat pagewidth = APP_SCREEN_WIDTH;
    int page = floor((_scrollImageView.contentOffset.x - pagewidth/([_imageUrlArr count]+2))/pagewidth)+1;
    page --;  // 默认从第二页开始
    _pageControl.currentPage = page;
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (_pageControl.numberOfPages == 1) {
        return;
    }
    _pageControlUsed = NO;
}


// scrollview 委托函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = APP_SCREEN_WIDTH;
    int currentPage = floor((_scrollImageView.contentOffset.x - pagewidth/ ([_imageUrlArr count]+2)) / pagewidth) + 1;
    if (currentPage==0)
    {
        [_scrollImageView scrollRectToVisible:CGRectMake(self.frame.size.width * [_imageUrlArr count],0,self.frame.size.width,self.frame.size.height) animated:NO]; // 序号0 最后1页
    }
    else if (currentPage==([_imageUrlArr count]+1))
    {
        [_scrollImageView scrollRectToVisible:CGRectMake(self.frame.size.width,0,self.frame.size.width,self.frame.size.height) animated:NO]; // 最后+1,循环第1页
    }
}
//// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl

// pagecontrol 选择器的方法
- (void)turnPage
{
    NSInteger page = _pageControl.currentPage;
    [_scrollImageView scrollRectToVisible:CGRectMake(APP_SCREEN_WIDTH * (page + 1),0,APP_SCREEN_WIDTH,APP_SCREEN_WIDTH) animated:NO];
    
}
// 定时器 绑定的方法
- (void)runTimePage
{
    NSInteger page = _pageControl.currentPage;
    page++;
    page = page > _imageUrlArr.count-1 ? 0 : page ;
    _pageControl.currentPage = page;
    [self turnPage];
}




@end
