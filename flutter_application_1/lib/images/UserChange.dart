import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class imageUser extends StatefulWidget {
  imageUser(this.imageChange);

  final void Function(File imagesUserP) imageChange;
  @override
  _imagesP createState() => _imagesP();
}

class _imagesP extends State<imageUser> {
  File _imagesUser;

  void _imagesPicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage.path);

    setState(() {
      _imagesUser = pickedImageFile;

      return;
    });
    widget.imageChange(_imagesUser);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: InkWell(
            onTap: () {
              _imagesPicker();
              // if (_imagesUser == null) {
              //   Scaffold.of(context).showSnackBar(SnackBar(
              //       content: Text('please use an image'),
              //       backgroundColor: Theme.of(context).errorColor));
              // }
            },
            child: CircleAvatar(
              maxRadius: 50.h,
              backgroundColor: Colors.black,
              backgroundImage:
                  _imagesUser != null ? FileImage(_imagesUser) : null,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text('Change Picture'),
        SizedBox(
          height: 0.h,
        ),
      ],
    );
  }
}
