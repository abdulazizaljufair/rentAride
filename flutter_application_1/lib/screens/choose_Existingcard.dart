import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_car_screen.dart';
import 'add_card_screen.dart';

class ChooseCard extends StatefulWidget {
  @override
  State<ChooseCard> createState() => _ChooseCardState();
}

class _ChooseCardState extends State<ChooseCard> {
  List cardL2 = [];

  void initState() {
    super.initState();
    FetchDatabaseList();
  }

  FetchDatabaseList() async {
    dynamic res = await AddCard().getUserCardList();

    if (res == null) {
      print('Unable to retrive');
    } else {
      setState(() {
        cardL2 = res;
      });
    }
  }

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
                        cardL2[0]['Card Number'],
                        SizedBox(
                          height: 10,
                        ),
                        cardL2[1]['Holder Name'],
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
