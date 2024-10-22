import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import './weidgets.dart';
import './customInputFormatter.dart';
import './colors_utils.dart';
import './OTP.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({Key? key}) : super(key: key);


  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  TextEditingController _aadharNumberController = TextEditingController();
  get number => _aadharNumberController.text.replaceAll(new RegExp(r'[^0-9]'),'');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assits/registration_screen.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06,left:MediaQuery.of(context).size.width*0.08,right: MediaQuery.of(context).size.width*0.08,),
        child: Scaffold(

          backgroundColor: Colors.transparent,
          body: Stack(

            children: [Container(
              padding: EdgeInsets.only( top: MediaQuery.of(context).size.height*0.03,),
              child: Text(
                'Registration',
                style: TextStyle(shadows: <Shadow>[
                Shadow(
                offset: Offset(0, 4),
                blurRadius: 4.0,
                color: Colors.black54,
                  // color: Color.fromARGB(255, 0, 0, 0),
              ),

        ],color: Colors.white,
                  fontSize: 41,
                  fontFamily: 'Amiko',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
              Container(
                padding: EdgeInsets.only( top: MediaQuery.of(context).size.height*0.368,left: 14,),
                child: Material(
                    color: Colors.transparent,
                    elevation:14,
                    shadowColor: Colors.black,
                  child:
                    Text(
                      'Enter your Aadhar number',
                      style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        //fontFamily: 'Almarai',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.only( top: MediaQuery.of(context).size.height*0.4,),
                child: Material(
                  color: Colors.transparent,
                  elevation: 30,
                  shadowColor: Colors.black54,
                  child:Stack( children:
                    [TextField(maxLength: 18,
                        //maxLengthEnforcement: MaxLengthEnforcement.none,
                      controller: _aadharNumberController,

                      //obscureText: isPasswordType,
                      //enableSuggestions: true,
                      //autocorrect: !isPasswordType,
                      cursorColor: Colors.black12.withOpacity(0.4),
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black26,
                        ),
                        labelText: 'Aadhar number...',contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(color: Colors.black12),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none)),
                      ),
                        keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        new CustomInputFormatter()
                      ],
                    ),
                    ],),

                ),

              ),
              Container(
                width: MediaQuery.of(context).size.width,

                height: 55,
                margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5, left: 17,right: 17),
                decoration: BoxDecoration(gradient:  LinearGradient(colors: [
                  hexStringToColor('6B0AC5'),
                  hexStringToColor('FFFFFF')
                ],begin: Alignment.topCenter*0.6,end: Alignment.bottomCenter*4),
                    borderRadius: BorderRadius.circular(16)),
                child: ElevatedButton(
                  //icon: Icon(Icons.navigate_next),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) { return  otpScreen(Number:_aadharNumberController.text,NumberOnly:number,);}));;
                  },
                  //label:
                  child:
                  Text(
                     'Get OTP  ›' ,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 21
                    ),
                  ),
                  style:
                  ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states){
                        if(states.contains(MaterialState.pressed)) {
                          return  Colors.purple[900];
                        }
                        return Colors.transparent;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                      )
                  ),
                ),

              )

            ],
          ),
          ),
        )


      );

  }

}
