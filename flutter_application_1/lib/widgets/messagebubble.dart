import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class messageBubble extends StatelessWidget {
  messageBubble(this.message);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)),
            width: 140.w,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            )),
      ],
    );
  }
}
