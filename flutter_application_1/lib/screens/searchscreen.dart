import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cardetails.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_application_1/widgets/time_date.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Browse',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextformField(
                  hintText: 'Search',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade50,
                    size: 15,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('From'),
                SizedBox(
                  height: 10.h,
                ),
                TimeDate(),
                Divider(
                  color: Colors.grey,
                ),
                Text('Until'),
                TimeDate(),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 8,
              padding: EdgeInsets.symmetric(horizontal: 15),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CarDetails()));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 120.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/car.jpeg')),
                          ),
                        ),
                        Text(
                          'KIA',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '150 RIYALS per day',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
