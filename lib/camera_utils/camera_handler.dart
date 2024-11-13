import 'package:image_picker/image_picker.dart';
//调用相机接口
class CameraHandler {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> takePhoto() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      return photo; // 返回拍摄的照片
    } catch (e) {
      print("Error taking photo: $e");
      return null;
    }
  }
}
