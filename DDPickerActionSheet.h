//
//  DDPickerActionSheet.h
//  diandian
//
//  Created by Penuel on 13-7-11.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol PickerActionDelegate <NSObject>

-(void)pickerView:(UIPickerView *)pickerView didSelectAtComponent:(NSInteger)component Row:(NSInteger)row;

@end

@interface DDPickerActionSheet : UIActionSheet<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) UIPickerView *picker;
//picker data //不论是NSArray还是plist可以封装到此dict中，然后会自动解析几行几列
@property (nonatomic,strong) NSDictionary *dataDictionary;

@property (nonatomic,weak) id<PickerActionDelegate> pickDelegate;

- (id)initWithFrame:(CGRect) frame Title:(NSString *)title delegate:(id /*<UIActionSheetDelegate>*/)delegate;

- (void)showInView:(UIView *)view;


@end
