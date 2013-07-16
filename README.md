用法：
1：工程中引入这两个类<br/>

2：在要使用的类中ipmort 头文件<br/>

3：在触发的弹出事件里添加如下：eg<br/>
    NSDictionary *tpDict=@{@"1":@[@"午餐",@"晚餐"],@"2":timeStrArr,@"3":@[@"1",@"2",@"3",@"4",@"5"]};<br/>
    DDPickerActionSheet *timeActionSheet=[[DDPickerActionSheet alloc]initWithFrame:CGRectMake(0, deviceWidth-200, deviceWidth, 200) Title:@"请选择" delegate:self];<br/>
    timeActionSheet.dataDictionary=tpDict;<br/>
    timeActionSheet.picker.tag=2;<br/>
    timeActionSheet.pickDelegate=self;<br/>
    [timeActionSheet showInView:self.view];<br/>
    <br/>
    
4：回调需要实现协议UIActionSheetDelegate(系统的),PickerActionDelegate（自定义的）<br/>

ActionSheetDelegate触发的是：(就actionsheet上添加的按钮用)<br/>
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;<br/>
PickerActionDelegate触发的是：(picker选择时用)<br/>
-(void)pickerView:(UIPickerView *)pickerView didSelectAtComponent:(NSInteger)component Row:(NSInteger) row;<br/>
