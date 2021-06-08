import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class PhotoViewPage extends StatefulWidget {
  String _networkURL;
  PhotoViewPage(
      this._networkURL
      );
  @override
  _PhotoViewPageState createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(this.widget._networkURL),
    );
  }
}
