
class ListBean {
  String title;
  String detail;
  Map args;// 正向传参
  Map callBackArgs;// 反向传参
  ListBean({this.title,this.detail,this.args,this.callBackArgs});
}