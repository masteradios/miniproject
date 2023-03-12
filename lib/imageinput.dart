import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageInput extends StatefulWidget {
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
File _storedimage;

Future<void> _takepicture()async
{
  final picker=ImagePicker();
  final _imagefile=await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600);
  setState(() {
    _storedimage=File(_imagefile.path);
  });
  final appDir=await syspath.getApplicationSupportDirectory();
  final fileName=await path.basename(_imagefile.path);
  final savedImage=await _imagefile.saveTo('${appDir}/$fileName');

}



  @override
  Widget build(BuildContext context) {
    return Container(child: Scaffold
      (
      body: Center(
        child:_storedimage==null?
        IconButton
          (
          onPressed: ()
          {
            _takepicture();
          },
          icon: Icon(Icons.album),
        ):Container
          (
          child: Image.file(_storedimage,fit: BoxFit.fill,),
        )
      ),

    ),
    );
  }
}
