import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class imagesP extends StatefulWidget {
  @override
  _imagesP createState() => _imagesP();
}

class _imagesP extends State<imagesP> {
  File _imagesS;

  void _imagesPicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage.path);

    setState(() {
      _imagesS = pickedImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: InkWell(
            onTap: () {
              _imagesPicker();
            },
            child: Container(
              height: 110.h,
              width: 110.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF27292E),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                backgroundImage: _imagesS != null ? FileImage(_imagesS) : null,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text('Upload Profile picture'),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
