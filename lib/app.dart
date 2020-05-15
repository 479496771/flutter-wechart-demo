import 'package:flutter/material.dart';



class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  var currentIndex = 0;

  @override
    void initState(){
      super.initState();
    }

  @override
  Widget build(BuildContext context) {

    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(
        title: Text(
          '微信',
          style: TextStyle(
            color: currentIndex == 0 ? Color(0xFF46c01b) : Color(0xff999999),
          ),
        ),
        icon: currentIndex == 0 ? Image.asset('images/weixin_pressed.png',width: 32.0,height: 28.0,) : Image.asset('images/weixin_normal.png',width: 32.0,height: 28.0,),
      ),
      BottomNavigationBarItem(
        title: Text(
          '通讯录',
          style: TextStyle(
            color: currentIndex == 1 ? Color(0xFF46c01b) : Color(0xff999999),
          ),
        ),
        icon: currentIndex == 1 ? Image.asset('images/profile_pressed.png',width: 32.0,height: 28.0,) : Image.asset('images/profile_normal.png',width: 32.0,height: 28.0,),
      ),
      BottomNavigationBarItem(
        title: Text(
          '发现',
          style: TextStyle(
            color: currentIndex == 2 ? Color(0xFF46c01b) : Color(0xff999999),
          ),
        ),
        icon: currentIndex == 2 ? Image.asset('images/find_pressed.png',width: 32.0,height: 28.0,) : Image.asset('images/find_normal.png',width: 32.0,height: 28.0,),
      ),
      BottomNavigationBarItem(
        title: Text(
          '我',
          style: TextStyle(
            color: currentIndex == 3 ? Color(0xFF46c01b) : Color(0xff999999),
          ),
        ),
        icon: currentIndex == 3 ? Image.asset('images/weixin_pressed.png',width: 32.0,height: 28.0,) : Image.asset('images/weixin_normal.png',width: 32.0,height: 28.0,),
      ),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });          
        },
        items: bottomTabs,
      ),
    );
  }
}
