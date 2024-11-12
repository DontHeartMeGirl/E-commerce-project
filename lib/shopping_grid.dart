import 'package:flutter/material.dart';
import '../../tools/KeepAliveWrapper.dart'; //引入缓存文件
import 'font.dart';

//商品数据
final List<Map<String, String>> productList = [
  {
    'id': '1',
    'imageUrl': 'images/香水.jpg',
    'title': '【盛夏】汗水 蝉鸣 午后 橘子汽水 原创清冷橘子味学生香水小样',
    'price': '6.98',
    'quantity': '2.32万+'
  },
  {
    'id': '2',
    'imageUrl': 'images/明信片.jpg',
    'title': '10张日式居酒屋卡片新款高级小众室内墙面装饰墙贴日式风景明信片',
    'price': '1.78',
    'quantity': '8988'
  },
  {
    'id': '3',
    'imageUrl': 'images/iphone.jpg',
    'title': 'Apple iPhone 16 Pro Max支持移动联通电信 5G双卡双待手机',
    'price': '9199',
    'quantity': '3223'
  },
  {
    'id': '4',
    'imageUrl': 'images/联想.jpg',
    'title': '联想拯救者2024 新品R7000 R7-8745H RTX4060 电竞游戏笔记本电脑',
    'price': '5499',
    'quantity': '2321'
  },
  {
    'id': '5',
    'imageUrl': 'images/玉桂狗.jpg',
    'title': 'MINISO名创优品玉桂狗幻彩变装熊猫系列公仔床上抱枕布娃娃玩具女',
    'price': '34.19',
    'quantity': '6721'
  },
  {
    'id': '6',
    'imageUrl': 'images/听泉.jpg',
    'title': '抽象搞怪新鲜哥周边听泉猫表情包亚克力弹簧摇摇乐桌面车载摆件',
    'price': '1.79',
    'quantity': '1.32万+'
  },
  {
    'id': '7',
    'imageUrl': 'images/mouse.jpg',
    'title': '罗技G304无线游戏鼠标电竞LOL宏编程吃鸡CF台式电脑笔记本办公',
    'price': '179',
    'quantity': '5.21万+'
  },
  {
    'id': '8',
    'imageUrl': 'images/顶真.jpg',
    'title': '丁真知识知识改变命运相框爆搞笑宿舍装饰画挂墙背景画摆台摆件',
    'price': '2.86',
    'quantity': '6.42万+'
  },
  {
    'imageUrl': 'images/贺卡.jpg',
    'title': '生日贺卡立体3d蛋糕手写字创意礼物送闺蜜高颜值ins风可折叠卡片',
    'price': '5.86',
    'quantity': '2.12万+'
  },
  {
    'imageUrl': 'images/富士山.jpg',
    'title': '超好看!!日式日本风景富士山下甜美色系装饰海报小清新风景',
    'price': '6.52',
    'quantity': '1.21万+'
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //去掉右上角的debug
      home: ShoppingPage(),
    );
  }
}

//有状态的组件
class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage>
    with SingleTickerProviderStateMixin {
  //同步与设备的刷新率
  late TabController _tabController;
  @override
  void initState() {
    super.initState(); //// 初始化 TabController
    _tabController = TabController(length: 9, vsync: this);//顶部九个标签
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //去掉'返回'按钮
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), //Appbar的背景颜色
        elevation: 0, //控制阴影高度
        title: Padding(
          padding: const EdgeInsets.fromLTRB(2, 5, 2, 5), //与Appbar的边距
          //搜索图标与搜索框外部容器
          child: Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 12, 0), //内部边距
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 235, 235), //外部容器颜色
                borderRadius: BorderRadius.circular(10), //外部容器圆角
              ),
              child: Row(
                children: [
                  //搜索图标
                  const Icon(
                    Icons.search,
                  ),
                  const SizedBox(
                    //搜索图标与文字之间的空白距离
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(fontSize: 18), //搜索框默认文字大小
                      //搜索框
                      decoration: const InputDecoration(
                        hintText: "搜索商品", //搜索框内的默认文字
                        border: InputBorder
                            .none, //border: InputBorder.none：移除输入框的默认边框。
                        isDense: true, //减少输入框的内边距，使其更加紧凑。
                      ),
                      onChanged: (value) {
                        // 当用户输入时，可以在这里处理搜索逻辑
                        print("用户输入的搜索内容: $value");
                      },
                    ),
                  ),
                  IconButton(
                    //相机图标按钮
                    padding: EdgeInsets.zero, // 删除内部间距
                    iconSize: 20, //图标大小
                    icon: const Icon(Icons.camera_alt_outlined),
                    onPressed: () {},
                  ),
                ],
              )),
        ),
        bottom: TabBar(
            controller: _tabController, //同步显示
            isScrollable: true, //允许导航条滚动
            labelStyle: const TextStyle(fontSize: 18),
            indicatorSize: TabBarIndicatorSize.tab, //调整底部指示器的宽度
            indicatorColor: Colors.red, //底部指示器颜色
            labelColor: Colors.red, //选中的颜色
            unselectedLabelColor:
                const Color.fromARGB(255, 163, 163, 163), //lable未选中颜色
            unselectedLabelStyle: const TextStyle(fontSize: 15), //未选中的字样大小
            padding: EdgeInsets.zero, // 移除TabBar的默认padding
            tabs: const [
              //显示的标签内容
              Tab(
                text: "推荐", //标签内容
              ),
              Tab(
                text: "11.11",
              ),
              Tab(
                text: "电脑",
              ),
              Tab(
                text: "食品",
              ),
              Tab(
                text: "手机",
              ),
              Tab(
                text: "百货",
              ),
              Tab(
                text: "医药",
              ),
              Tab(
                text: "水果",
              ),
              Tab(
                text: "女装",
              ),
            ]),
      ),
      body: Container(
        color: const Color.fromARGB(255, 236, 232, 232), //设置body背景颜色
        child: TabBarView(
          controller: _tabController, //同步显示
          children: [
            KeepAliveWrapper(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 每行展示2个商品
                    childAspectRatio: 0.75, // 宽高比，控制商品卡片的高度
                    crossAxisSpacing: 10, // 水平间距
                    mainAxisSpacing: 10, // 垂直间距
                  ),
                  itemCount: productList.length, // 商品的数量
                  itemBuilder: (context, index) {
                    final product = productList[index]; // 获取商品数据
                    return ProductCard(
                      product: product, //直接将整个product对象传递给ProductCard
                      imageUrl: product['imageUrl']!,
                      title: product['title']!,
                      price: product['price']!,
                      quantity: product['quantity']!,
                      showMiaoshaIcon:
                          index == 0 || index == 3, // 仅第一个和第四个 Card 显示秒杀图标
                      showbaiyibutieIcon: index == 2,
                    );
                  },
                ),
              ),
            ),
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("11.11内容"),
                  ),
                ],
              ),
            ),
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("电脑内容"),
                  ),
                ],
              ),
            ),
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("食品内容"),
                  ),
                ],
              ),
            ),
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("手机内容"),
                  ),
                ],
              ),
            ),
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("百货内容"),
                  ),
                ],
              ),
            ),
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("医药内容"),
                  ),
                ],
              ),
            ),
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("水果内容"),
                  ),
                ],
              ),
            ),
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("女装内容"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//卡片内的内容
class ProductCard extends StatelessWidget {
  final Map<String, String> product; //创建Map类型的product，接收完整的商品数据
  final String imageUrl;
  final String title;
  final String price;
  final String quantity;
  final bool showMiaoshaIcon; // 控制是否显示秒杀图标
  final bool showbaiyibutieIcon; // 控制是否显示百亿补贴图标
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    this.showMiaoshaIcon = false, // 默认不显示秒杀图标
    this.showbaiyibutieIcon = false,
    required this.product, // 默认不显示秒杀图标
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//添加点击事件,点击卡片后跳转到商品详情界面
      onTap: () {
        // 跳转到商品详情页面，传值给'productDetail'
        Navigator.pushNamed(
          context,
          'productDetail',
          arguments: {
            'id': product['id'], // 传递 id
            'imageUrl': product['imageUrl'],
            'title': product['title'],
            'price': product['price'],
            'quantity': product['quantity'],
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.all(0.2), //卡片外边距
        elevation: 20, //卡片阴影
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), //照片圆角
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //卡片内左对齐
          children: [
            //卡片内插入照片
            Expanded(
              child: AspectRatio(
                aspectRatio: 1, //宽高比：1
                child: Image.asset(
                  //本地照片
                  imageUrl,
                  fit: BoxFit.cover, //照片铺满
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 1), //文字的边距
                child: Row(
                  children: [
                    if (showbaiyibutieIcon)
                      const Icon(
                        MyFont.baiyibutie, // 自定义图标
                        size: 10,
                        color: Colors.red, // 图标颜色
                      ),
                    // const SizedBox(width: 18), // 图标和文字间的空隙
                    if (showbaiyibutieIcon) // 仅在显示图标时显示空隙
                      const SizedBox(width: 36), // 图标和文字间的空隙
                    if (showMiaoshaIcon) // 仅在 showMiaoshaIcon 为 true 时显示图标
                      const Icon(
                        MyFont.miaosha, // 自定义图标
                        size: 12,
                        color: Colors.red, // 图标颜色
                      ),
                    if (showMiaoshaIcon) // 仅在显示图标时显示空隙
                      const SizedBox(width: 13), // 图标和文字间的空隙
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14, //title文字大小
                        ),
                        maxLines: 1, // 限制为单行显示
                        overflow: TextOverflow.clip, // 超出部分不显示
                      ),
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                child: Row(
                  children: [
                    Text(
                      '\¥$price', // 显示带货币符号的价格
                      style: const TextStyle(
                          fontSize: 15, color: Colors.red), //价格文字显示为红色
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "总售$quantity件",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 124, 119, 119)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
