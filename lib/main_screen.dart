import 'package:flutter/material.dart';
import 'shopping_grid.dart'; // 引入商品陈列页面
import './pages/voide.dart';
import './pages/double11.dart';
import './pages/chat.dart';
import './pages/PersonalCenter.dart';
import './video_browser.dart';
import 'font.dart';
//运行逻辑：
//当用户点击底部对应按钮时，触发onTap方法，index值为1（若点击的是多多视频），赋值给_selectedIndex，
//setState重新运行build，重新构建页面，执行body:  _pages[_selectedIndex],时，
//_selectedIndex，所以返回页面_pages[1],也就是Voide()
//页面切换显示，全靠改变_selectedIndex的值来实现

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; //初始化_selectedIndex为0

  final List<Widget> _pages = [
    //定义一个列表，用于储存各个文件的页面
    const ShoppingPage(), // 首页（商品展示页）
    const VideoBrowser(), //对应_pages 0
    const Double11(), //对应_pages 1
    const Chat(), //对应_pages 2
    const PersonalCenter(), //对应_pages 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 使标签一直显示
        //BottomNavigationBard底部导航
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red, //被选择的Item颜色为红色
        unselectedItemColor: Colors.grey, //未选择的Item颜色为红色
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video),
            label: '多多视频',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 50,
              MyFont.shuangshiyi,
              color: Colors.red,
            ),
            label: '', //空字符
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '聊天',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '个人中心',
          ),
        ],
      ),
    );
  }
}
