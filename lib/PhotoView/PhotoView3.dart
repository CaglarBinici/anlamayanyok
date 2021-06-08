import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class PhotoView3 extends StatefulWidget {
  String imageURL;
  PhotoView3(
      this.imageURL
      );
  @override
  _PhotoView3State createState() => _PhotoView3State();
}

class _PhotoView3State extends State<PhotoView3> {
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(this.widget.imageURL),
    );
  }
}
