import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrl = [
    'http://img.zcool.cn/community/01ce8b582439aea84a0e282ba855d9.jpg',
    'http://img.zcool.cn/community/01f2ac576df0980000018c1b1cb5e1.jpg',
    'http://img.zcool.cn/community/01f0305541db6800000115417f56ae.jpg@1280w_1l_2o_100sh.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 160,
              // 轮播插件
              child: Swiper(
                itemCount: _imageUrl.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    _imageUrl[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: SwiperPagination(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
