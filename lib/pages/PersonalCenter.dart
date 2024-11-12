import 'package:flutter/material.dart';

class PersonalCenter extends StatelessWidget {
  const PersonalCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // 会自动显示左上角的汉堡菜单图标
        title: const Text("个人中心"),
        backgroundColor: Colors.white, // 设置AppBar背景色
      ),
      // 添加侧边栏 Drawer
      drawer: const Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  //弹性布局
                  flex: 1,
                  child: UserAccountsDrawerHeader(
                    //便捷调整头部组件
                    accountName: Text("陈文浩"),
                    accountEmail: Text("账号:cwh594"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/creabears.jpg"),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/japan1.jpg"))),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: CircleAvatar(
                //配置圆形图标
                child: Icon(Icons.library_books), //图标
              ),
              title: Text("我的评论"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                //配置圆形图标
                child: Icon(Icons.access_time), //图标
              ),
              title: Text("浏览记录"),
            ),
            Divider(),
          ],
        ),
      ),
      body: Column(
        children: [
          // 用户头像和用户名部分
          Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.all(20),
            child: const Row(
              children: [
                CircleAvatar(
                  //确保图片为圆形
                  radius: 30, // 头像大小
                  backgroundImage: AssetImage('images/creabears.jpg'), // 用户头像
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, //沿水平方向（横轴方向）将子元素靠左对齐
                  children: [
                    Text(
                      "用户名：陈文浩",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "普通会员",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1), // 分割线

          // 列表项分
          Expanded(
            //确保 ListView能够占据屏幕上剩余空间，确保它正常滚动显示列表项。
            child: ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.list_alt,
                      color: Colors.red,
                    ), //图标
                  ),
                  title: Text(
                    "全部订单",
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    //配置圆形图标
                    child: Icon(
                      Icons.payment,
                      color: Colors.green,
                    ), //图标
                  ),
                  title: Text(
                    "待付款",
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.local_shipping,
                      color: Colors.orange,
                    ), //图标
                  ),
                  title: Text(
                    "待收货",
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ), //图标
                  ),
                  title: Text(
                    "我的收藏",
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    //配置圆形图标
                    child: Icon(
                      Icons.support_agent,
                      color: Colors.blue,
                    ), //图标
                  ),
                  title: Text(
                    "在线客服",
                  ),
                ),
              ],
            ),
          ),

          // 退出登录按钮
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // 返回到登录界面
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // 按钮背景颜色
                minimumSize: const Size(double.infinity, 50), // 设置按钮大小
              ),
              child: const Text(
                "退出登录",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
