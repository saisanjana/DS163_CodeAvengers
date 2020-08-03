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
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: widget.online ? size.height * 0.4 : size.height * 0.6,
      width: size.width,
      //color: Colors.green,
      child: _picTaken == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (ctx) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FlatButton.icon(
                                  icon: Icon(
                                    Icons.camera,
                                    size: size.height * 0.1,
                                  ),
                                  onPressed: getImageCamera,
                                  label: Text("Camara"),
                                ),
                                FlatButton.icon(
                                  icon: Icon(Icons.photo_album,
                                      size: size.height * 0.1),
                                  onPressed: getImageGallery,
                                  label: Text("Gallery"),
                                ),
                              ],
                            ),),
                    child: Image.asset("assets/images/alert_icon.png"),
                  ),
                ),
                /*Center(child: IconButton(icon: Icon(Icons.camera,size: size.height*0.1,), onPressed: getImageCamera,)),
           
          Center(child: IconButton(icon: Icon(Icons.photo_album,size: size.height*0.1), onPressed: getImageGallery,))*/
              ],
            )
          : Image.file(_image, fit: BoxFit.fill),
    );
  }
}
