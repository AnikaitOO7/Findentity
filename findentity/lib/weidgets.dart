import 'package:flutter/material.dart';
import './colors_utils.dart';

Container signInSignUp(
BuildContext context, bool isSignIn,double num, Function onTap,
){
  return Container(
    width: MediaQuery.of(context).size.width,

    height: 55,
    margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * num, left: 17,right: 17),
    decoration: BoxDecoration(gradient: isSignIn ? LinearGradient(colors: [
      hexStringToColor('6B0AC5'),
      hexStringToColor('FFFFFF')
    ],begin: Alignment.topCenter*0.6,end: Alignment.bottomCenter*4) : LinearGradient(colors: [
      hexStringToColor('000000'),
      hexStringToColor('FFFFFF')
    ],begin: Alignment.topRight*0.1,end: Alignment.bottomLeft*2.5),
        borderRadius: BorderRadius.circular(16)),
    child: ElevatedButton(
      //icon: Icon(Icons.navigate_next),
      onPressed: (){
        onTap();
      },
      //label:
      child:
      Text(
        isSignIn ? 'Sign up  ›' : 'Sign in  ›',
        style: const TextStyle(
          color: Colors.white, fontSize: 21
        ),
      ),
      style:
      ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)) {
            return isSignIn ? Colors.purple[900]: Colors.black45;
      }
          return Colors.transparent;
      }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
        )
      ),
    ),
  );
}

