import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findentity/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './homePage.dart';
//import './weidgets.dart';
import './customInputFormatter.dart';
import './register.dart';
import './aadhar.dart';

class otpScreen extends StatefulWidget {
  otpScreen({Key? key, required this.Number, required this.NumberOnly})
      : super(key: key);
  String Number, NumberOnly;

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  String phoneNumber = '';
  String verificationID = "";
  final TextEditingController _pinPutController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;




  Future<String?> fetchRecord() async {
    try {
      var record =
          await FirebaseFirestore.instance.collection('aadhar_details').get();
      for (var doc in record.docs) {
        if (widget.NumberOnly == doc.id) {
          print(doc.id);
          return doc.data()['mobile'].toString();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  fetchNumber()async {
    final String mobile =
        await fetchRecord() ?? 'Could not fetch';
    setState(() {
      phoneNumber = mobile;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRecord();
    //_verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    fetchNumber();
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assits/registration_screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.06,
            left: MediaQuery.of(context).size.width * 0.08,
            right: MediaQuery.of(context).size.width * 0.08,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.13,
                      left: MediaQuery.of(context).size.width * 0.24),
                  child: Text(
                    'OTP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 4),
                          blurRadius: 4.0,
                          color: Colors.black54,
                          // color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 56,
                      fontFamily: 'Amiko',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.26,
                    left: 18,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 14,
                    shadowColor: Colors.black,
                    child: Text(
                      'Enter OTP sent on +91 $phoneNumber',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        //fontFamily: 'Almarai',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                Padding(

                  padding: EdgeInsets.all(30.0),
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,

                    controller: _pinPutController,

                    pinAnimationType: PinAnimationType.fade,

                        onSubmitted: (pin) async {
                          if(otpVisibility){
                            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode:pin );

                            await auth.signInWithCredential(credential).then((value){
                              print("You are logged in successfullyverificationID");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) { return  homeScreen(numberOnly:widget.NumberOnly);}));;
                              Fluttertoast.showToast(
                                  msg: "You are logged in successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            });

                          }else{
                            _verifyPhone();

                          }




                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
  _verifyPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value){
          print("You are logged in successfully hello");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;

        verificationID = verificationId;

        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }
}


