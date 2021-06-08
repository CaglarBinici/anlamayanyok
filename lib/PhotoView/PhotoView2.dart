import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class PhotoView2x extends StatefulWidget {
  String photoURL;
  PhotoView2x(
      this.photoURL,
      );
  @override
  _PhotoView2xState createState() => _PhotoView2xState();
}

class _PhotoView2xState extends State<PhotoView2x> {
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(this.widget.photoURL),
    );
  }
}
