import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class messageBubble extends StatelessWidget {
  messageBubble(this.message, this.isMe);

  final String message;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: isMe
                  ? Colors.grey[300]
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
              ),
            ),
            width: 140,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              message,
              style: TextStyle(
                color: isMe
                    ? Colors.black
                    : Theme.of(context).colorScheme.secondary,
              ),
            )),
      ],
    );
  }
}
