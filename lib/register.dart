import 'package:flutter/material.dart';
import 'package:flutter_homework/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();//创建TextEditingController 实例
  final _idController = TextEditingController();//创建TextEditingController 实例
  final _passwordController = TextEditingController();//创建TextEditingController 实例

  void _register(BuildContext context) {
    // 检查所有输入框是否填写
    if (_nameController.text.isNotEmpty &&
        _idController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // 将用户注册信息存储在全局变量中
      registeredUser = {
        'name': _nameController.text,
        'id': _idController.text,
        'password': _passwordController.text,
      };
      // 显示注册成功并返回登录页面
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('注册成功'),
            content: const Text('您可以使用注册的账号进行登录。'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 关闭提示框
                  Navigator.of(context).pop(); // 返回到登录页面
                },
                child: const Text('确定'),
              ),
            ],
          );
        },
      );
    } else {
      // 显示错误提示框
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('错误'),
            content: const Text('请填写所有信息。'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 关闭提示框
                },
                child: const Text('确定'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("注册"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "姓名"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _idController,
                decoration: const InputDecoration(labelText: "学号"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "密码"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _register(context);
              },
              child: const Text("注册"),
            ),
          ],
        ),
      ),
    );
  }
}
