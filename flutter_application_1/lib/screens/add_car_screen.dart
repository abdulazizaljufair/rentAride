import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class AddCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Add Car',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 85,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFF27292E),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Upload Car photo')
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyTextformField(
                hintText: 'Car Type',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextformField(
                hintText: 'Model',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextformField(
                hintText: 'License Number',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              MyTextformField(
                hintText: 'Odometer',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              MyTextformField(
                hintText: 'Year',
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(
                height: 20,
              ),
              MyTextformField(
                hintText: 'Chasis Number',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 35,
              ),
              CustomButton(
                buttoncolor: Color(0xFF27292E),
                textcolor: Colors.white,
                text: 'Save',
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
