import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageGetter extends StatefulWidget {
  final Function setImage;
  final bool online;
  ImageGetter(this.setImage, this.online);

  @override
  _ImageGetterState createState() => _ImageGetterState();
}

class _ImageGetterState extends State<ImageGetter> {
  var cam = true;

  var _picTaken = false;

  File _image;

  final picker = ImagePicker();

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
      _picTaken = true;
    });
    if (widget.online == false) {
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final imageName = path.basename(_image.path);
      final savedImage = await _image.copy('${appDir.path}/$imageName');

      widget.setImage(savedImage);
    } else {
      widget.setImage(_image);
    }
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      _picTaken = true;
    });
    if (widget.online == false) {
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final imageName = path.basename(_image.path);
      final savedImage = await _image.copy('${appDir.path}/$imageName');

      widget.setImage(savedImage);
    } else {
      widget.setImage(_image);
    }
  }

  void _openModal(ctx) async {
    
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            onTap: () => {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      getImageCamera();
                      Navigator.of(context).pop(bctx);
                    },
                    icon: Icon(Icons.camera),
                    label: Text('Camera')),
                FlatButton.icon(
                    onPressed: () async {
                      getImageGallery();
                      Navigator.of(context).pop(bctx);
                    },
                    icon: Icon(Icons.photo_album),
                    label: Text('Gallery'))
              ],
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: widget.online ? size.height * 0.4 : size.height * 0.6,
      width: size.width,
      child: _picTaken == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: ()=>_openModal(context),
                    child: Image.asset('assets/images/report_logo.png',
                        height: size.height * 0.2))
              ],
            )
          : Image.file(_image, fit: BoxFit.fill),
    );
  }
}
