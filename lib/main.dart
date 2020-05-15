import 'package:flutter/material.dart';
// import './app.dart';
import 'loadingPage.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(
  MyApp()
);

final ThemeData myDefaultTheme = new ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Color(0xff393a3f),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'wechart',
        theme: myDefaultTheme,
        routes: <String, WidgetBuilder>{
          // "app": (BuildContext context) => new App(),
          "/friends": (_) => new WebviewScaffold(
            url: "https://weixin.qq.com",
            appBar: new AppBar(
              title: Text('微信朋友圈'),
            ),
            withZoom: true,  // 是否缩放
            withLocalStorage: true, // 是否开启本地存储
          ),
          // "search": (BuildContext context) => new Search(),
        },
        home: new LoadingPage()
      ),
    );
  }
}