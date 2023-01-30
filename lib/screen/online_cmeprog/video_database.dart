// import 'dart:async';

// import 'package:sqflite/sqflite.dart';

// class VideoStoringDataBase {
//   static final VideoStoringDataBase instance = VideoStoringDataBase._init();
//   static Database? _database; // creting the database
//   VideoStoringDataBase._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _inItDB('video.db'); //initialize the database
//     return _database!;
//   }

//   Future<Database> _inItDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = dbPath + filePath;
    
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   FutureOr<void> _createDB(Database db, int version) async {
//     await db.execute(
//       "CREATE TABLE videos(id INTEGER PRIMARY KEY, data BLOB)",
//     );
//   }
//   // Future close() async {
//   //   final db = await instance.database();
//   //   db.close();
//   // }
// Future insertData(Database db)async{
//    await db.insert(
//     'videos',
//     {
//       'id': 1,
//       'data': videoData,
//     },
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }

// }
// class VideoDatabaseMOdel {
//   final int id; 
//    var description;
   
//   VideoDatabaseMOdel({required this.id, required this.description});
  
//   VideoDatabaseMOdel.fromMap(Map<String, dynamic> item): 
//     id=item["id"], description= item["description"];
  
//   Map<String, Object> toMap(){
//     return {'id':id,'description': description};
//   }

// }

import 'dart:io';
import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';

// ...

void saveVideoToDatabase(String savePath) async {
  final database = await openDatabase(
    'videos.db',
    version: 1,
    onCreate: (Database db, int version) {
      db.execute(
        "CREATE TABLE videos(id INTEGER PRIMARY KEY, data BLOB)",
      );
    },
  );

  final video = File("$savePath/video.mp4");
  final videoData = await video.readAsBytes();

  await database.insert(
    'videos',
    {
      'id': 1,
      'data': videoData,
    },
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// import 'dart:io';


// ...

void downloadVideo(String url, String savePath) async {
  Dio dio = Dio();
  var dir = Directory(savePath);
  if (!await dir.exists()) {
    dir.create();
  }
  await dio.download(url, "$savePath/video.mp4",
      onReceiveProgress: (received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  });
}

