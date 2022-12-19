import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  var fileImage = ''.obs;
  // var isCancelled = false.obs;

  imageFromGallery() async {
    final fImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    fileImage.value = fImage!.path;
    print("from_gallery:${fImage.path}");
    print('Workinggggggg');
    update();
  }

  imageFromCamara() async {
    final XFile? fImage = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    fileImage.value = fImage!.path;
    print("from_camera:${fImage.path}");
    // update();
  }
}
