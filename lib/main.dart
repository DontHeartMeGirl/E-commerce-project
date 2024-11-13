import 'package:flutter/material.dart';
import 'lib/routes/routes.dart'; // 引入 routes.dart 文件

// 全局变量，用于存储注册用户的账号、学号和密码
Map<String, String> registeredUser = {};
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去除右上角debug
      initialRoute: "/", // 设置初始路由
      onGenerateRoute: onGenerateRoute, // 使用 routes.dart 中的 onGenerateRoute
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //分别管理 姓名、学号和密码三个输入框的内容。
  final _nameController = TextEditingController(); //控制和获取输入框中的文本内容。
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //背景图片
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mountain.png'), //本地图片
              fit: BoxFit.cover) //图片效果：铺满
          ),
      child: Center(
        child: Column(
          //Flex布局
          mainAxisAlignment: MainAxisAlignment.center, //将组件放在屏幕正中心
          children: [
            //头像部分
            SizedBox(
              //
              height: 80,
              width: 80,
              child: Image.asset(
                'images/creabears.jpg',
                fit: BoxFit.cover,
              ),
            ),
            //姓名学号密码输入框
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10), //调整输入框与左右的边距
              child: TextField(
                controller: _nameController, //使用 TextField组件，由_nameController控制
                decoration: const InputDecoration(
                    labelText: "姓名",
                    labelStyle: TextStyle(color: Colors.black)), //文字颜色为白色
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40, vertical: 10), //调整输入框与左右的边距
              child: TextField(
                controller: _idController, //使用TextField组件，由_idController控制
                decoration: const InputDecoration(
                    labelText: '学号',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10), //调整输入框与左右的边距
              child: TextField(
                controller:
                    _passwordController, //使用TextField组件，由_passwordController控制
                obscureText: true, // 隐藏输入内容
                decoration: const InputDecoration(
                    labelText: '密码',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            //登录按钮
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, //在主轴方向将子组件均匀分布，在子组件之间留出空隙，第一个和最后一个组件则会贴近父容器的边缘
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _login(context); // 登录逻辑
                          },
                          icon: const Icon(Icons.login),
                          label: const Text("登录"),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, 'registerPage');
                            //命名跳转路由，跳转到注册界面
                          },
                          icon: const Icon(Icons.group_add),
                          label: const Text("注册"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton.icon(
                    onPressed: () {
                      _clearInputs();
                    },
                    icon: const Icon(Icons.clear), //清空按钮
                    label: const Text("取消"),
                    style: ElevatedButton.styleFrom(
                        //按钮尺寸
                        minimumSize: const Size(400, 45)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _login(BuildContext context) {
    //通用密码：q,q,1
    if (_nameController.text.isNotEmpty &&
        _idController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // 检查是否使用通用密码
      if (_nameController.text == "q" &&
          _idController.text == "q" &&
          _passwordController.text == "1") {
        // 通用密码验证成功
        Navigator.pushNamed(context, 'mainScreen');
        return; // 直接返回，不再执行后续验证
      }

      // 验证输入的信息是否与注册时的账号、学号和密码一致
      if (_nameController.text == registeredUser['name'] &&
          _idController.text == registeredUser['id'] &&
          _passwordController.text == registeredUser['password']) {
        Navigator.pushNamed(context, 'mainScreen');
      } else {
        // 如果信息不匹配，弹出提示框，显示错误提示
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('登录失败'),
              content: const Text('账号或密码不正确，请重新输入。'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('确定'),
                ),
              ],
            );
          },
        );
      }
    } else {
      //如果有空的输入，则弹出'请输入所有信息'
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('错误'),
            content: const Text('请输入所有信息'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('确定'),
              ),
            ],
          );
        },
      );
    }
  }

//取消按钮方法
  void _clearInputs() {
    _nameController.clear(); //清空姓名输入框
    _idController.clear(); //清空学号输入框
    _passwordController.clear(); //清空密码输入框
  }
}
