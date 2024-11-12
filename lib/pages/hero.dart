import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart'; //用于实现图片的手势操作，比如缩放、拖拽、旋转等功能。

class HeroPage extends StatefulWidget {
  final Map arguments; //定义Map类型，接受来自商品详情界面的传值
  const HeroPage({super.key, required this.arguments});
  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  List listData = []; //数据列表
  int initialPage = 0; //初始展示的图片索引
  late int currentPage; //当前界面,初始值为1，用于当用户点击图片时，底部显示当前页面与总页面数
  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //初始化
    listData =
        widget.arguments["listDate"] ?? []; // 确保listData不为空，当istData为空时，返回空列表
    initialPage =
        (int.tryParse(widget.arguments['initialPage']?.toString() ?? '1') ??
                1) -
            1;
//arguments的['initialPage']赋值给initialPage ，而arguments的['initialPage']来自于图片的id
    currentPage =
        int.tryParse(widget.arguments['initialPage']?.toString() ?? '1') ?? 1;

// widget.arguments['initialPage']是product_detail赋值过来的，也就是image_data.dart的id
    if (listData.isEmpty || initialPage < 0 || initialPage >= listData.length) {
//检查 listData 是否为空。如果 listData 是空列表，直接返回上一个页面。
      print("Error: Invalid listData or initialPage");
      Navigator.pop(context);
    }

    if (widget.arguments['imageUrl'] == null ||
        widget.arguments['imageUrl'].isEmpty) {
//检查mageUrl是否为空或无效
      print("Error: imageUrl is null or empty");
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
//单次点击事件监听
          Navigator.pop(context); //返回上一级路由
        },
        child: Hero(
            tag: widget.arguments['imageUrl'], //这里的tag值需要和起始跳转界面一致
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: const Color.fromARGB(151, 0, 0, 0),
                  body: Center(
                      child: PhotoViewGallery.builder(
//PhotoViewGallery用于实现图片多图预览的手势操作，比如缩放、拖拽、旋转等功能。
                    //加载图片
                    // imageProvider: AssetImage(widget.arguments['imageUrl']),
                    itemCount: listData.length, //图片的总数
                    pageController: PageController(
//当用户从一个商品卡片点击进入详情页时，默认会跳转到用户点击的那张图片，
                        initialPage: initialPage), //设置加载时默认显示哪一页。
                    onPageChanged: (index) {
                      print(index);
                      setState(() {
                        currentPage = index + 1;
//index是image_data.dart中 listData 的索引值
//当界面改变时,index传值给currentPage,由于index由0开始的，所以要加1
                      });
                    },
                    //imageUrls是'../lib/image_data.dart'里的列表
                    builder: (BuildContext context, int index) {
// builder 是一个回调函数，用来根据 index 动态生成每一张图片。
                      return PhotoViewGalleryPageOptions(
                          imageProvider:
                              AssetImage(listData[index]["imageUrl"]));
//imageProvider：提供图片资源 通过imageUrls[index]动态加载对应图片。
//imageUrls是'image_data.dart'里的列表
                    },
                  )),
                ),
                Positioned(
                    //底部显示:当前文字页数/总页数
                    left: 0,
                    right: 0,
                    bottom: 20, //水平方向平铺，底部距离20
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${currentPage}/${listData.length}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16, //文字大小
                            decoration: TextDecoration.none //取消下划线
                            ),
                      ),
                    ))
              ],
            )));
  }
}

