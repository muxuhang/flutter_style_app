import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:my_app/common/Global.dart';
// import '../index.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp; // 缓存创建时间

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  //将请求uri作为缓存的key
  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  Future<void> onRequest(
    RequestOptions options,
    // ignore: non_constant_identifier_names
    RequestInterceptorHandler,
  ) async {
    if (!Global.profile.cache.enable) RequestInterceptorHandler.next(options);
    // refresh标记是否是"下拉刷新"
    bool refresh = options.extra["refresh"] == true;
    //如果是下拉刷新，先删除相关缓存
    if (refresh) {
      if (options.extra["list"] == true) {
        //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
        cache.removeWhere((key, v) => key.contains(options.path));
      } else {
        // 如果不是列表，则只删除uri相同的缓存
        delete(options.uri.toString());
      }
      RequestInterceptorHandler.next(options);
    }
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            Global.profile.cache.maxAge) {
          // return cache[key].response;
        } else {
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
        }
      }
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future<void> onError(DioError err, ErrorInterceptorHandler) async {
    // 错误状态不缓存
  }

  @override
  // ignore: non_constant_identifier_names
  Future<void> onResponse(Response response, ResponseInterceptorHandler) async {
    // 如果启用缓存，将返回结果保存到缓存
    if (Global.profile.cache.enable) {
      _saveCache(response);
    }
  }

  _saveCache(Response object) {
    RequestOptions options = object.requestOptions;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == Global.profile.cache.maxCount) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(object);
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}
