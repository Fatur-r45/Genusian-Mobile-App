import 'dart:io';

import 'package:file_picker/file_picker.dart';

class ServiceFile {
  String fileName;
  String filePath;
  ServiceFile({required this.fileName, required this.filePath});
  // factory ServiceFile.add(String path) {
  //   return ServiceFile(image: path);
  // }
  static Future<ServiceFile?> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? "");
      File fileName = File(result.files.first.name);
      return ServiceFile(fileName: fileName.toString(), filePath: file.path);
    } else {
      return null;
    }
  }
}
