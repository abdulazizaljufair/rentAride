import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';

class Recievedoffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text('Recieved Offers'),
      ),
      body: ListView.separated(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/car.jpeg')),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KIA',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '20/3/2021',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'from:10:30 PM',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Insurance type: standard',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: CustomButton(
                              text: 'Accept',
                              buttoncolor: Colors.green,
                              textcolor: Colors.white,
                              height: 30,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: CustomButton(
                              text: 'Reject',
                              buttoncolor: Colors.red,
                              textcolor: Colors.white,
                              height: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ));
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 3,
          );
        },
      ),
    );
  }
}
