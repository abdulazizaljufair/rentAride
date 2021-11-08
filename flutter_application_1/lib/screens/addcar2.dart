import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_car_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCarScreen extends StatefulWidget {
  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  @override
  List car = [];

  void initState() {
    super.initState();
    FetchDatabaseList();
  }

  FetchDatabaseList() async {
    dynamic res = await AddCar().getUserCarList();

    if (res == null) {
      print('Unable to retrive');
    } else {
      setState(() {
        car = res;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF27292E),
        title: Text('Existing Cars'),
      ),
      body: ListView.separated(
        itemCount: car.length,
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
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car[index]['Car Type'],
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        car[index]['Chasis Number'],
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        car[index]['License Number'],
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        car[index]['Model'],
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        car[index]['Odometer'],
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        car[index]['year'],
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
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
