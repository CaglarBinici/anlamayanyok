import 'dart:io';

import 'package:image_picker/image_picker.dart';


class MediaService {
  static MediaService instance = MediaService();
  final _picker = ImagePicker();
  PickedFile image;
  Future<File> getImageFromLibrary() async{
    image = await _picker.getImage(source: ImageSource.gallery,
    imageQuality: 20);
    return File(image.path);
  }
}
