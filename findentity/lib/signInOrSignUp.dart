import 'package:flutter/material.dart';
import './weidgets.dart';
import './register.dart';
import './signIn.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class SigInOrSignUp extends StatefulWidget {
  const SigInOrSignUp({Key? key}) : super(key: key);

  @override
  State<SigInOrSignUp> createState() {
    return SigInOrSignUpState();
  }
}

class SigInOrSignUpState extends State<SigInOrSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //child: SvgPicture.asset(
      //'assits/bio_verification.svg',
      //fit: BoxFit.cover,
      //),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assits/bio_verification.jpg'),
          fit: BoxFit.cover,
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: textBoxes(),
      ),
    );
  }

  Widget textBoxes() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 157, top: MediaQuery.of(context).size.height * 0.055,),
          child: Text(
            'Findentity',
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Alatsi',
              //fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11, left: 138,),
          //alignment: Alignment.topCenter,
          child: Text(
            'We are here for you',
            style: TextStyle(
              letterSpacing: 0.5,
              color: Colors.black26,
              fontSize: 16,
              fontFamily: 'Alatsi',
              //fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          left: 120.0,
          top: 42.0,
          child: Stack(
            children: [
              Image.asset(
                'assits/logo_vector.jpg',
                height: 38,
                width: 38,
              )
            ],
          ),
        ),
        signInSignUp(context,true,0.823,(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => registrationScreen()));
        }),
        signInSignUp(context,false,0.91,(){}),
      ],
    );
  }
}
