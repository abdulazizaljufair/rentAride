import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

DateTime min = DateTime.now();
DateTime max = DateTime.now();
selectDate(BuildContext context, CupertinoDatePickerMode mode, min, max,
    {TextEditingController controller, String pickedDate}) {
  showModalBottomSheet<DateTime>(
    context: context,
    builder: (context) {
      return Container(
        height: 300,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text('Done'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                child: CupertinoDatePicker(
                  minimumDate: min,
                  maximumDate: max,
                  mode: mode,
                  onDateTimeChanged: (DateTime dateTime) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(dateTime);
                    String formattedTime = DateFormat('hh:mm').format(dateTime);

                    if (mode == CupertinoDatePickerMode.date) {
                      if (controller != null) controller.text = formattedDate;
                      if (pickedDate != null) pickedDate = formattedDate;
                    } else {
                      if (controller != null) controller.text = formattedTime;
                      if (pickedDate != null) pickedDate = formattedTime;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<List<XFile>> pickImage() async {
  final ImagePicker _picker = ImagePicker();

  final List<XFile> image = await _picker.pickMultiImage();
  return image;
}

showMyDialog({
  String primarytitle,
  String button1title,
  String button2title,
  BuildContext context,
  Function onPressedButton1,
  Function onPressedButton2,
}) {
  showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
              content: Text(primarytitle),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                    child: Text(button1title), onPressed: onPressedButton1),
                CupertinoDialogAction(
                    child: Text(button2title), onPressed: onPressedButton2)
              ]));
}
