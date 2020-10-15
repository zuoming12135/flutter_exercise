import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // child: Image(image: NetworkImage('https://review.chinabrands.cn/chinabrands_cn/seo/image/20190218/%E8%B0%B7%E6%AD%8C%20-%20%E5%9B%BE%E7%89%87%E6%90%9C%E7%B4%A2%E5%BC%95%E6%93%8E.jpg')),
        // child: Image.network('https://review.chinabrands.cn/chinabrands_cn/seo/image/20190218/%E8%B0%B7%E6%AD%8C%20-%20%E5%9B%BE%E7%89%87%E6%90%9C%E7%B4%A2%E5%BC%95%E6%93%8E.jpg'),
        child:
        Image.asset('assets/dog-1.jpg',fit: BoxFit.contain,),

      ),
    );
  }
}
