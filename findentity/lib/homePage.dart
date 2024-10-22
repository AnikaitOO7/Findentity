import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './weidgets.dart';
import './customInputFormatter.dart';
import './colors_utils.dart';
import './OTP.dart';



class homeScreen extends StatefulWidget {
   homeScreen({Key? key,required this.numberOnly}) : super(key: key);
   String numberOnly;




  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String name = '';
  Future<String?> fetchRecord() async {
    try {
      var record =
      await FirebaseFirestore.instance.collection('aadhar_details').get();
      for (var doc in record.docs) {
        if (widget.numberOnly == doc.id) {
          print(doc.id);
          return doc.data()['first_name'].toString();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  fetchNumber()async {
    final String first_name =
        await fetchRecord() ?? 'Could not fetch';
    setState(() {
      name = first_name;
    });
  }
  @override
  Widget build(BuildContext context) {
    fetchNumber();
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          Container(decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assits/bio_verification.jpg'),
              fit: BoxFit.cover,
            ),
          ),),


        ],
      ),
    );
  }
}

