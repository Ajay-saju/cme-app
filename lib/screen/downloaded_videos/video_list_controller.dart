import 'dart:io';
import 'dart:ui';
import 'dart:isolate';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';


class VideoListController extends GetxController {
  List<TaskInfo> tasks = [];
  List<ItemHolder> items = [];
  String localPath = '';
  bool permissionReady = false;
  var showContent = false;

  

  

  Future<void> prepareSaveDir() async {
    localPath = (await getSavedDir())!;
    final savedDir = Directory(localPath);
    if (!savedDir.existsSync()) {
      await savedDir.create();
    }
  }
  Future<String?> getSavedDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      try {
        // externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (err, st) {
        print('failed to get downloads path: $err, $st');

        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }
}

class TaskInfo {
  TaskInfo({this.name, this.link});

  final String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  // DownloadTaskStatus? status = DownloadTaskStatus.undefined;
}

class ItemHolder {
  ItemHolder({this.name, this.task});

  final String? name;
  final TaskInfo? task;
}
