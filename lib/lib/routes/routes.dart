import 'package:get/get.dart';
import '../../main_screen.dart';
import '../../register.dart';
import '../../shopping_grid.dart';
import '../../video_browser.dart';
import '../../pages/hero.dart';
import '../../product_detail.dart';
import '../../main.dart';

//Get路由配置
class AppRoutes {
  static final routes = [
    GetPage(name: "/", page: () => const LoginPage()),
    GetPage(name: "/mainScreen", page: () => const MainScreen()),
    GetPage(name: "/registerPage", page: () => const RegisterPage()),
    GetPage(name: "/shoppingGrid", page: () => const ShoppingPage()),
    GetPage(
      name: "/hero",
      page: () => HeroPage(arguments: Get.arguments),
    ),
    GetPage(
      name: "/productDetail",
      page: () => ProductDetailPage(
        product: {
          'id': Get.parameters['id'] ?? '',
          'title': Get.parameters['title'] ?? '',
          'imageUrl': Get.parameters['imageUrl'] ?? '',
          'price': Get.parameters['price'] ?? '',
          'quantity': Get.parameters['quantity'] ?? '',
        },
      ),
    ),
    GetPage(name: "/multipleVideos", page: () => const VideoBrowser()),
  ];
}



































// import 'package:flutter/material.dart';
// import '../../main.dart';
// import '../../main_screen.dart';
// import '../../register.dart';
// import '../../shopping_grid.dart';
// import '../../video_browser.dart';
// //以下底部导航栏的文件：
// // import '../../pages/PersonalCenter.dart';
// // import '../../pages/chat.dart';
// // import '../../pages/double11.dart';
// // import '../../pages/voide.dart';
// import '../../pages/hero.dart';
// import '../../product_detail.dart';

// //1.定义一个Map路由对象 配置路由
// Map routes = {
//   "/": (context) => const LoginPage(), //默认是LoginPage登录界面
//   "mainScreen": (context) => const MainScreen(), //导航到底部导航栏界面
//   "registerPage": (context) => const RegisterPage(), //导航到注册界面
//   'shoppingGrid': (context) => const ShoppingPage(), //导航到商品浏览主页面
//   'hero': (context, {arguments}) => HeroPage(arguments: arguments ?? {}),
//   //导航到动画样式界面，arguments 是一个 可选参数，用于从其他页面传递数据到hero
//   'multipleVideos': (context) => const VideoBrowser(),
//   'productDetail': (context, {arguments}) {
//     //导航到商品详情页面
//     final productArgs = (arguments as Map<String, dynamic>?) ?? {};
// //这行代码定义了一个局部变量productArgs，并将arguments转换为一个Map<String, dynamic> 类型。如果arguments是null，则productArgs会是一个空的 Map。
// //productArgs的作用是帮助解析并传递数据到ProductDetailPage
//     return ProductDetailPage(
//       //路由跳转到ProductDetailPage(商品详情页面)。
//       product: {
// //ProductDetailPage接收一个名为 product 的 Map<String, String>。
//         'id': productArgs['id'] as String? ?? '',
// //从productArgs获取id，将其转换为String 类型,如果id为null或类型不匹配，则返回默认值 ''。
//         'title': productArgs['title'] as String? ?? '',
//         'imageUrl': productArgs['imageUrl'] as String? ?? '',
//         'price': productArgs['price'] as String? ?? '',
//         'quantity': productArgs['quantity'] as String? ?? '',
//       },
//     );
//   },
// };

// //2.配置onGenerateRoute（固定写法）
// //onGenerateRoute用于在路由跳转时动态生成页面。
// //它的作用是接收路由跳转时的RouteSettings信息，匹配 routes 表，并返回一个包含相应页面的 Route。
// //当路由跳转的时候触发onGenerateRoute方法
// var onGenerateRoute = (RouteSettings settings) {
//   //RouteSettings settings是onGenerateRoute方法的一个参数。是Flutter用于描述路由跳转信息的一个类，
//   // print(settings);
//   // print(settings.name);
//   // print(settings.arguments);

//   final String? name = settings.name; //获取路由名称
//   final Function? pageContentBuilder = routes[name]; //根据路由名称找到页面生成函数
//   if (pageContentBuilder != null) {
//     //判断是否存在页面构建函数，如果 pageContentBuilder 不为空，则表示找到了对应的页面构建函数，程序将继续判断是否有传递参数。
//     if (settings.arguments != null) {
//       //如果 settings.arguments 不为空，说明有传递参数
//       final Route route = MaterialPageRoute(
//           //通过 MaterialPageRoute 创建一个 Route，并在 builder 中调用 pageContentBuilder，同时传递 arguments 参数。
//           builder: (context) => pageContentBuilder(context,
//               arguments: settings.arguments)); //同时传入context，也传入arguments
//       return route;
//     } else {
//       //如果没有参数传递，直接调用 pageContentBuilder，构建页面。
//       final Route route =
//           MaterialPageRoute(builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   }
//   return null;
// };
