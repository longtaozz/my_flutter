import 'package:dio/dio.dart';
import 'package:flutter_demo/data/BaseData.dart';

/**
 * 请求类
 * @author lt
 * @time 2019/1/15 9:38
 *
 **/
class HttpSet {
  static Dio _dio;
  static HttpSet httpSet;

  static Map<String, dynamic> headers; //请求头

  //初始化请求对象
  static HttpSet init() {
    if (_dio == null) {
      _dio = new Dio();
      _dio.options.baseUrl = DataBase.ProjectIP + DataBase.Project;
      _dio.options.connectTimeout = 5000; //响应超时时间
      _dio.options.receiveTimeout =
          5000; //响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，[Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      httpSet = new HttpSet();
    }
    return httpSet;
  }

  Get(url) async {
    Response response;
    _dio.options.method = "GET";
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      return 1;
    }
    if (headers == null) {}
    return response.data;
  }

  Post(url, parameters) async {
    Response response;
    _dio.options.method = "POST";
    try {
      response = await _dio.post(url, data: parameters);
    } on DioError catch (e) {
      return 1;
    }
    if (headers == null) {}
    return response.data;
  }
}

getData() async {
  HttpSet h = HttpSet.init();
  print("000");
  var cc = await h.Get("www.baidu.com");
  print(cc);
}

void main(){
  getData();
}