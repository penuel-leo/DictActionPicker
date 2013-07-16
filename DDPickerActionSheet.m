//
//  DDPickerActionSheet.m
//  diandian
//
//  Created by Penuel on 13-7-11.
//
//

#import "DDPickerActionSheet.h"

@implementation DDPickerActionSheet{
    NSInteger pickerSelectedComponent;
    NSInteger pickerSelectedRow;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect) frame Title:(NSString *)title delegate:(id /*<UIActionSheetDelegate>*/)delegate{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate=delegate;
        self.title=title;
        UIView *titleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
        titleView.backgroundColor=[UIColor clearColor];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(70, 0, titleView.frame.size.width-140, titleView.frame.size.height)];
        label.text=title;
        label.textAlignment=NSTextAlignmentCenter;
        label.backgroundColor=[UIColor clearColor];
        [titleView addSubview:label];
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.userInteractionEnabled=YES;
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        cancelButton.frame=CGRectMake(0, 0, 70, 30);
        [titleView addSubview:cancelButton];
        UIButton *okButton=[[UIButton alloc]initWithFrame:CGRectMake(titleView.frame.size.width-70, 0, 70, 30)];
        [okButton setTitle:@"确定" forState:UIControlStateNormal];
        okButton.userInteractionEnabled=YES;
        [okButton addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
//        okButton.backgroundColor=[UIColor blueColor];
        [titleView addSubview:okButton];
        [self addSubview:titleView];
        
        self.picker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, titleView.frame.size.height, self.frame.size.width, self.frame.size.height-titleView.frame.size.height)];
        self.picker.dataSource=self;
        self.picker.delegate=self;
        self.picker.showsSelectionIndicator=YES;
        [self addSubview:self.picker];
    }
    return self;

}

- (void)showInView:(UIView *)view{
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    [self setAlpha:1.0f];
    [self.layer addAnimation:animation forKey:@"DDPickerActionSheet"];
    
    self.frame = CGRectMake(0, view.frame.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    
    [view addSubview:self];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSArray * keys=[self.dataDictionary allKeys];
    return [keys count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray * keys=[self.dataDictionary allKeys];
    NSArray * value=[self.dataDictionary objectForKey:[keys objectAtIndex:component]];
    return [value count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray * keys=[self.dataDictionary allKeys];
    NSArray * value=[self.dataDictionary objectForKey:[keys objectAtIndex:component]];
    return [value objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    pickerSelectedComponent=component;
    pickerSelectedRow=row;
    [self.pickDelegate pickerView:pickerView didSelectAtComponent:component Row:row];
}

- (void)cancel{
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    [self setAlpha:0.0f];
    [self.layer addAnimation:animation forKey:@"DDPickerActionSheet"];
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.3];
    if(self.delegate) {
        [self.delegate actionSheet:self clickedButtonAtIndex:0];
    }
}

- (void)sure {
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    [self setAlpha:0.0f];
    [self.layer addAnimation:animation forKey:@"DDPickerActionSheet"];
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.3];
    if(self.delegate) {
        [self.delegate actionSheet:self clickedButtonAtIndex:1];
    }
    [self.pickDelegate pickerView:self.picker didSelectAtComponent:pickerSelectedComponent Row:pickerSelectedRow];
    
}



@end
