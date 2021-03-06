import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_address.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Exaddress extends StatefulWidget {
  @override
  State<Exaddress> createState() => _ExaddressState();
}

class _ExaddressState extends State<Exaddress> {
  @override
  List addressL2 = [];

  void initState() {
    super.initState();
    FetchDatabaseList();
  }

  FetchDatabaseList() async {
    dynamic res = await ManageAdress().getUserAddressList();

    if (res == null) {
      print('Unable to retrive');
    } else {
      setState(() {
        addressL2 = res;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF27292E),
        title: Text('Existing addreses'),
      ),
      body: addressL2.isEmpty
          ? Center(
              child: Text("No saved addresses"),
              widthFactor: 5,
              heightFactor: 5,
            )
          : ListView.separated(
              itemCount: addressL2.length,
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
                                image: AssetImage('images/location .jpeg')),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              addressL2[index]['City Name'],
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              //
                              addressL2[index]['Country Name'],
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              addressL2[index]['Street Name'],
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              addressL2[index]['Zip Code'],
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
