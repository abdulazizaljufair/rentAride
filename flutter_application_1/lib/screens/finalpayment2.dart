import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Choosepayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          ' Choose Existing Card',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'images/card.jpeg',
                      width: 100.w,
                      height: 90.h,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Text('6703 4444 4444 4449'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('abdulaziz'),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
