import 'package:flutter/material.dart';

class AddCarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF27292E),
        title: Text('Existing Cars'),
      ),
      body: ListView.separated(
        itemCount: 2,
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
                        'Model 2021',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '4484844843',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '10000 KM',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'SV30-0169266',
                        style: TextStyle(color: Colors.black),
                      ),
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
