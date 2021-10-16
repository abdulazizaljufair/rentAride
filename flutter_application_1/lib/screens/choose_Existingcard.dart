import 'package:flutter/material.dart';

class ChooseCard extends StatelessWidget {
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
                      width: 100,
                      height: 90,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text('6703 4444 4444 4449'),
                        SizedBox(
                          height: 10,
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
