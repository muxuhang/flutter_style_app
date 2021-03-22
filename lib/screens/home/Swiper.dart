import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatelessWidget {
  HomeSwiper({Key key, this.banners}) : super(key: key);
  final banners;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: (width - 40) * 0.46,
      decoration: BoxDecoration(),
      child: Swiper(
        itemCount: 2,
        viewportFraction: 0.76,
        scale: 0.8,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              "https://n.sinaimg.cn/sinacn/w1680h1050/20180119/75e8-fyqtwzu9071408.jpg",
              fit: BoxFit.cover,
            ),
          );
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(5),
          builder: SwiperPagination.dots,
        ),
      ),
    );
  }
}
