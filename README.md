# flutter_homework - 电商平台
这是一个flutter仿拼多多电商平台的作业项目，用户可以浏览滑动商品列表，点击商品卡片后即可查看对应商品的详情界面，点击图片后可查看商品详细信息

# 实现功能：  
·用户的注册与登录，用户需要注册后才可进入登录界面     
·在登录界面添加了取消按钮，点击后即可清除输入框内容     
·在商品浏览界面添加了底部导航栏并在组件添加了双十一的Icon，增加购物节氛围   
·在商品浏览界面顶部添加了搜索框，搜索框做了返回值处理，后续可添加搜索功能根据用户输入的内容进行搜索  
·添加了相机图标按钮，点击后可调用设备前后置相机进行拍摄，并且做了图片返回图片返回功能，方便日后增加上传服务器功能  
·在商品浏览界面顶部添加了顶部导航栏，用户点击任意Tab后，即可跳转对应页面并且文字变为红色    
·商品浏览界面可滑动并添加了缓存功能，记忆用户当前浏览的位置，当用户返回当前界面时,可返回上次浏览到的位置    
·使用了多图轮播插件和手势检测器，当点击商品图片后，可通过滑动查看多张商品照片并实现双击照片进行放大缩小，并且添加了底部显示：当前商品页数/总页数    
·在个人界面添加了多个功能按钮，并在底部加入了"退出登录"按钮返回登录界面，点击左上角侧边栏按钮即可拉出侧边栏，显示更多信息    
# 后续改进计划
· 连接数据库，将商品信息储存到数据库中，统一修改  
· 改进商品详情界面，增加"添加至购物车"按钮并使用AnimatedPositioned组件实现组件位移效果，当用户点击添加购物车按钮后，按钮实现位移效果，移动到右小角，实现类似"添加到购物车效果"效果  
· 在视频界面使用PageView组件，实现类似抖音视频滑动效果，实现增加商品视频广告功能  
# 截图：
<div align="center">
  <img src=https://github.com/DontHeartMeGirl/images_for_README/blob/main/images/%E7%99%BB%E5%BD%95%E7%95%8C%E9%9D%A2.png alt="登录界面图片" width="300">
</div>
<div align="center">
  <img src=https://github.com/DontHeartMeGirl/images_for_README/blob/main/images/%E6%B3%A8%E5%86%8C%E6%88%90%E5%8A%9F%E7%95%8C%E9%9D%A2.png alt="注册界面图片" width="300">
</div>
<div align="center">
  <img src=https://github.com/DontHeartMeGirl/images_for_README/blob/main/images/%E5%95%86%E5%93%81%E6%8E%92%E5%88%97%E7%95%8C%E9%9D%A2.png alt="商品排列界面图片" width="300">
</div>
<div align="center">
  <img src=https://github.com/DontHeartMeGirl/images_for_README/blob/main/images/%E5%95%86%E5%93%81%E8%AF%A6%E6%83%85%E7%95%8C%E9%9D%A2.png alt="商品详情界面图片" width="300">
</div>
<div align="center">
  <img src=https://github.com/DontHeartMeGirl/images_for_README/blob/main/images/%E8%AF%A6%E6%83%85%E5%9B%BE%E7%89%87.png alt="详情图片" width="300">
</div>
<div align="center">
  <img src=https://github.com/DontHeartMeGirl/images_for_README/blob/main/images/%E5%8F%8C%E5%87%BB%E6%94%BE%E5%A4%A7%E7%95%8C%E9%9D%A2.png alt="双击放大图片" width="300">
</div>
<div align="center">
  <img src=https://github.com/DontHeartMeGirl/images_for_README/blob/main/images/%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83%E7%95%8C%E9%9D%A2.png alt="个人中心界面图片" width="300">
</div>
<div align="center">
  <img src=https://github.com/DontHeartMeGirl/images_for_README/blob/main/images/%E6%91%84%E5%83%8F%E5%A4%B4%E8%B0%83%E7%94%A8.png alt="摄像头调用" width="300">
</div>
