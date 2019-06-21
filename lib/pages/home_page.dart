import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//滚动最大距离
const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrl = [
    'http://img.zcool.cn/community/01ce8b582439aea84a0e282ba855d9.jpg',
    'http://img.zcool.cn/community/01ce8b582439aea84a0e282ba855d9.jpg',
    'http://img.zcool.cn/community/01ce8b582439aea84a0e282ba855d9.jpg'
  ];

  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Stack布局分层
        body: Stack(
      children: <Widget>[
        //移除顶部padding
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            //列表监听
            child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    //滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
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
                        // banner指示器
                        pagination: SwiperPagination(),
                      ),
                    ),
                    // 页面跳转
                    Container(
                      height: 100,
                      color: Colors.red,
                      child: FlatButton(
                        onPressed: () =>
                            {Navigator.of(context).pushNamed('/searchpage')},
                        child: Text("跳转搜索页"),
                      ),
                    ),
                    Container(
                      height: 800,
                      child: Text('哈哈'),
                    ),
                  ],
                ))),
        // 改变透明度
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ),
            ),
          ),
        )
      ],
    ));
  }

  void _onScroll(offset) {
//    print(off
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(alpha);
  }
}
