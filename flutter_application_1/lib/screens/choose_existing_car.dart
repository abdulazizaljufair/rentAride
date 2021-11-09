import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/choose_Existing_cartwo.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_car_screen.dart';

class ChooseExistingCar extends StatefulWidget {
  @override
  State<ChooseExistingCar> createState() => _ChooseExistingCarState();
}

class _ChooseExistingCarState extends State<ChooseExistingCar> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'choose Existing car',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: car.isEmpty
                ? Center(
                    child: Text("No saved cars"),
                    widthFactor: 5,
                    heightFactor: 5,
                  )
                : ListView.separated(
                    itemCount: car.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150.h,
                                width: 150.w,
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
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    car[index]['License Number'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    car[index]['Model'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    car[index]['odometer'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    car[index]['year'],
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 3,
                      );
                    },
                  ),
          ),
          CustomButton(
            text: 'Next',
            textcolor: Colors.white,
            buttoncolor: Color(0xFF27292E),
            height: 50.h,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChooseExistingScreen()));
            },
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
