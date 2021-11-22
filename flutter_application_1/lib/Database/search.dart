import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/modules/users.dart';

class searchService{
  searchByName(String seacrhfield){
    return FirebaseFirestore.instance.collection('List Cars').where('Car Type',isEqualTo:seacrhfield.toUpperCase()).get();
  }
}