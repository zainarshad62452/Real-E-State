// // import 'dart:io';

// // import 'package:nearby_service/nearby_service.dart';
// // import 'package:path_provider/path_provider.dart';

// // class FilesSaver {
// //   FilesSaver._();

// //   static bool isImage(String? extension) {
// //     return _imageExtensions.contains(extension?.toLowerCase());
// //   }

// //   static const _imageExtensions = [
// //     'jpg',
// //     'jpeg',
// //     'png',
// //     'gif',
// //     'webp',
// //     'bmp',
// //   ];

// //   static Future<List<NearbyFileInfo>> savePack(ReceivedNearbyFilesPack pack) async {
// //     print('::: savePack');
// //     final files = <NearbyFileInfo>[];

// //     final directory = Platform.isAndroid
// //         ? Directory('/storage/emulated/0/Download/Ginnie')
// //         : Directory((await getApplicationDocumentsDirectory()).path + '/Ginnie');

// //     print('::: Directory Path: ${directory.path}');

// //     // Check if the directory exists and create if not
// //     if (!await directory.exists()) {
// //       print('::: Directory does not exist, creating...');
// //       try {
// //         await directory.create(recursive: true);
// //         print('::: Directory created');
// //       } catch (e) {
// //         print('::: Error creating directory: $e');
// //         return files; // Return empty list if directory creation fails
// //       }
// //     }

// //     for (final nearbyFile in pack.files) {
// //       final newFilePath = '${directory.path}/${DateTime.now().microsecondsSinceEpoch}.${nearbyFile.extension}';
// //       final newFile = File(newFilePath);

// //       try {
// //         final fileBytes = await File(nearbyFile.path).readAsBytes();
// //         await newFile.writeAsBytes(fileBytes);
// //         files.add(NearbyFileInfo(path: newFile.path));
// //         print('::: File saved: ${newFilePath}');
// //       } catch (e) {
// //         print('::: Error saving file: $e');
// //       }
// //     }
// //     return files;
// //   }

// // }

// import 'dart:io';

// import 'package:nearby_service/nearby_service.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';

// class FilesSaver {
//   FilesSaver._();
//   static bool isImage(String? extension) {
//     return _imageExtensions.contains(extension?.toLowerCase());
//   }

//   static bool _isImage(String filePath) {
//     var extension = path.extension(filePath).toLowerCase();
//     return _imageExtensions.contains(extension);
//   }

//   static bool isVideo(String filePath) {
//     var extension = path.extension(filePath).toLowerCase();
//     return _videoExtensions.contains(extension);
//   }

//   static bool isAudio(String filePath) {
//     var extension = path.extension(filePath).toLowerCase();
//     return _audioExtensions.contains(extension);
//   }

//   static const _imageExtensions = [
//     '.jpg',
//     '.jpeg',
//     '.png',
//     '.gif',
//     '.webp',
//     '.bmp'
//   ];
//   static const _videoExtensions = ['.mp4', '.avi', '.mov', '.mkv', '.wmv'];
//   static const _audioExtensions = ['.mp3', '.wav', '.ogg', '.aac'];

//   static const _imageFolder = 'images';
//   static const _documentFolder = 'documents';
//   static const _videoFolder = 'videos';
//   static const _audioFolder = 'audios';

//   static Future<List<NearbyFileInfo>> savePack(
//       ReceivedNearbyFilesPack pack) async {
//     print('::: savePack');
//     final files = <NearbyFileInfo>[];

//     final baseDirectory = Platform.isAndroid
//         ? Directory('/storage/emulated/0/Data Transfer')
//         : Directory(
//             (await getApplicationDocumentsDirectory()).path);

//     print('::: Base Directory Path: ${baseDirectory.path}');

//     // Check if the base directory exists and create if not
//     if (!await baseDirectory.exists()) {
//       print('::: Base Directory does not exist, creating...');
//       try {
//         await baseDirectory.create(recursive: true);
//         print('::: Base Directory created');
//       } catch (e) {
//         print('::: Error creating base directory: $e');
//         return files; // Return empty list if base directory creation fails
//       }
//     }

//     for (final nearbyFile in pack.files) {
//       Directory? targetDirectory;

//       // Determine the type of file and assign the target directory
//       if (_isImage(nearbyFile.path)) {
//         targetDirectory = Directory('${baseDirectory.path}/$_imageFolder');
//       } else if (isVideo(nearbyFile.path)) {
//         targetDirectory = Directory('${baseDirectory.path}/$_videoFolder');
//       } else if (isAudio(nearbyFile.path)) {
//         targetDirectory = Directory('${baseDirectory.path}/$_audioFolder');
//       } else {
//         targetDirectory = Directory('${baseDirectory.path}/$_documentFolder');
//       }

//       print('::: Target Directory Path: ${targetDirectory.path}');

//       // Check if the target directory exists and create if not
//       if (!await targetDirectory.exists()) {
//         print('::: Target Directory does not exist, creating...');
//         try {
//           await targetDirectory.create(recursive: true);
//           print('::: Target Directory created');
//         } catch (e) {
//           print('::: Error creating target directory: $e');
//           continue; // Skip saving this file if directory creation fails
//         }
//       }

//       // Construct the new file path
//       final newFilePath =
//           '${targetDirectory.path}/${DateTime.now().microsecondsSinceEpoch}${path.extension(nearbyFile.path)}';
//       final newFile = File(newFilePath);

//       try {
//         final fileBytes = await File(nearbyFile.path).readAsBytes();
//         await newFile.writeAsBytes(fileBytes);
//         files.add(NearbyFileInfo(path: newFile.path));
//         print('::: File saved: ${newFilePath}');
//       } catch (e) {
//         print('::: Error saving file: $e');
//       }
//     }

//     return files;
//   }
// }
