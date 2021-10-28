import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/Global.dart';
import 'package:my_app/models/artistList.dart';
// import '../main.dart';

class Http {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Http([context = '']) {
    _options = Options(extra: {"context": context});
  }

  late BuildContext context;
  // ignore: unused_field
  late Options _options;
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'http://127.0.0.1:3000',
    headers: {
      HttpHeaders.acceptHeader: "application/json",
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json"
    },
  ));
// Access-Control-Allow-Headers:true
  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY 10.1.10.250:8888";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // 登录接口，登录成功后返回用户信息
  // Future<User> login(String login, String pwd) async {
  //   String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
  //   var r = await dio.get(
  //     "/users/$login",
  //     options: Options(
  //       headers: {HttpHeaders.authorizationHeader: basic},
  //       extra: {"noCache": true},
  //     ),
  //   );
  //   //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
  //   dio.options.headers[HttpHeaders.authorizationHeader] = basic;
  //   //清空所有缓存
  //   Global.netCache.cache.clear();
  //   //更新profile中的token信息
  //   Global.profile.token = basic;
  //   return User.fromJson(r.data);
  // }

  //获取图片列表
  // Future<List<Images>> getImages(page) async {
  //   print("/photos?page=" + (page + 1).toString());
  //   var r = await dio.get<List>(
  //     "/photos?page=" + page.toString(),
  //     options: Options(
  //       extra: {"noCache": true},
  //       headers: {
  //         "Authorization":
  //             "Client-ID fagvYnDvPqWfZGISz-uRuehEEaCB6WiyxL9lau_Wmi0"
  //       },
  //     ),
  //   );
  //   return r.data.map((e) => Images.fromJson(e)).toList();
  // }

  //获取随机图片
  // Future<Images> getImageRandom() async {
  //   var r = await dio.get(
  //     "/photos/random",
  //     options: Options(
  //       extra: {"noCache": true},
  //       headers: {
  //         "Authorization":
  //             "Client-ID fagvYnDvPqWfZGISz-uRuehEEaCB6WiyxL9lau_Wmi0"
  //       },
  //     ),
  //   );
  //   return Images.fromJson(r.data);
  // }

  // 获取歌手分类
  Future getArtistList({
    type = -1,
    area = -1,
    limit = 30,
    offset = 0,
    initial = 'a',
  }) async {
    var r = await dio.get(
      "/artist/list",
    );
    return ArtistList.fromJson(r.data);
  }
}
