import 'package:flutter/material.dart';
import 'package:flutter_homework/lib/image_data.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments ?? {}; // 使用 Get.arguments 接收传参

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product['title'] ?? '商品详情',
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // 如果标题过长，则显示省略号
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
//GestureDetector 是一个监听用户手势的组件。它本身并不具备可视化效果，
//而是包裹在其他组件外部，监听用户在这些组件上的操作，然后触发相应的事件。
              onTap: () {
                if (product['id'] == null || product['imageUrl'] == null) {
                  print(
                      "Error: product['id'] or product['imageUrl'] is null"); //作用：确保 product['id'] 和 product['imageUrl'] 不为空
                  return;
                }

                int productId = int.parse(product['id']!);
                //将 product['id']（字符串形式）转换为整数。
                //确保productId可以用作productImages映射表中的键。

                if (!productImages.containsKey(productId) ||
                    productImages[productId]!.isEmpty) {
                  print("Error: No images found for product id: $productId");
                  return;
                }
//确保productImages（商品的图片数据映射表中包含productId 对应的图片列表，并且该列表非空。
                Get.toNamed(
                  "hero",
                  arguments: {
                    "imageUrl": productImages[productId]![0]
                        ['imageUrl'], // 传第一张图的 URL
                    "initialPage": 1, // 从第一张开始展示
                    "listDate": productImages[productId], // 商品的图片列表
                  },
                );
              },
              //配置点击事件
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Hero(
//Hero 小部件主要用于在导航过程中实现两个页面之间的元素（如图片、按钮等）的动画过渡。
                    tag: product['imageUrl']!, ////这里的tag值需要和目标跳转界面一致
//Hero 会在导航时将同一个 Hero 标识（tag）的小部件进行动画衔接。
// 这两个页面上的Hero小部件必须有相同的 tag，以便 Flutter 知道它们是同一个动画对象。
                    child: Image.asset(
                      // 商品图片
                      product['imageUrl']!,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(height: 16),
            // 商品标题
            Text(
              product['title']!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // 商品价格
            Text(
              '价格：¥${product['price']}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            // 商品销售数量
            Text(
              '总售：${product['quantity']}件',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            // 商品描述
            const Text(
              '详细的商品描述页面。用户可以点击商品图片查看多张图片详情，后续更多功能正在完善中...敬请期待',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
