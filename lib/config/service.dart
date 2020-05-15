import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
// import 'dart:convert';
   
class Api {
  static Dio _dio;
  
  static void init() {
     _dio = Dio()
      ..options.baseUrl = "https://www.fastmock.site/mock/8254ec5157fb023f05c12a0cf3e2012d/api/"
      ..options.connectTimeout = 5000 //5s
      ..options.receiveTimeout = 5000
      ..options.validateStatus = (int status) {
        return status > 0;
      }
      ..options.headers = {
        HttpHeaders.userAgentHeader: 'dio',
        'contentType': Headers.formUrlEncodedContentType,
        'x-access-token': 'zhang'
      };

    _dio.interceptors
    ..add(InterceptorsWrapper(
      onRequest:(RequestOptions options) async {
      // 在请求被发送之前做一些事情
      print(options.headers);
      _dio.interceptors.requestLock.lock();
      _dio.interceptors.requestLock.unlock();
      return options; //continue
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse:(Response response) async {
      // 在返回响应数据之前做一些预处理
      return response; // continue
      },
      onError: (DioError e) async {
        // 当请求失败时做一些预处理
      return e;//continue
      }
    ))
    ..add(LogInterceptor(responseBody: false)); //O
  }


  static final _fetchTypes = <String, Function>{
    'post': _dio.post,
    'put': _dio.put,
    'patch': _dio.patch,
    'delete': _dio.delete,
    'head': _dio.head,
  };

  static Future<dynamic> get(url, {Map<String, dynamic> data}) async {
    return await _fetch('get', url, data);
  }

  static Future<dynamic> post(url, {Map<String, dynamic> data}) async {
    return await _fetch('post', url, data);
  }


 
  static Future<dynamic> _fetch(method, url, data) async {
    Api.init();
    try {
      final Response response = method == "get"
        ? await _dio.get(url, queryParameters: data)
        : await _fetchTypes[method](url, data: data);
        if(response.statusCode == 200){
          return response.data; 
        }else{
          return {};
        }
    } catch (e) {
      print('错误');
      print(e);
      final error = (e is DioError
          && e.response != null
          && e.response.statusCode == 403)
        ? e.response.data
        : {"message": "服务器网络繁忙，请稍后再试", "status_code": 1001};

      // showTip(error['message']);

      throw error;
    }
  }


}