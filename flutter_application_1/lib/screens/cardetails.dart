import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';

class CarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/car.jpeg',
            width: MediaQuery.of(context).size.width,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Ford',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Aziz saleh',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xFF27292E))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Car Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(""" 

 """),
                    ],
                  ),
                ),
                DropdownButton(
                  hint: Text('Choose Insurance Type'),
                  isExpanded: true,
                  iconSize: 30,
                  items: [
                    'Standard',
                    'premium',
                  ].map(
                    (value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  buttoncolor: Color(0xFF27292E),
                  textcolor: Colors.white,
                  text: 'Reserve',
                  height: 55,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
