import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Document {
  String path;
  String name;
  int pages;

  static Future<File> pick() async {
    final document = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["pdf", "docx", "ai", "psd", "png", "jpeg"],
        onFileLoading: (status) {
          return AnimatedContainer(
              duration: Duration(seconds: 5),
              child: CircularProgressIndicator());
        });

    if (document == null) {
      return null;
    }
    return File(document.paths.first);
  }

  static int countPages(File doc) {}
}
