import 'package:dio/dio.dart';

final String url = 'http://127.0.0.1:3000';
void netWork({
  method = 'get',
  api = '/',
  callBack,
  data,
}) async {
  print('$method $api');
  Dio dio = Dio();
  dio.options.baseUrl = url;
  dio.options.connectTimeout = 5000; //5s
  dio.options.receiveTimeout = 3000;
  String apiUrl = '$url$api';
  try {
    void response = await dio.request(
      apiUrl,
      data: data,
      options: Options(
        method: method,
      ),
    );
    callBack(response);
  } catch (e) {
    print('$e ');
  }
}
