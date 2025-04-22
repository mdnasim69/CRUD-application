import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

InputDecoration TextFieldDecoration(label) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        5,
      ),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        5,
      ),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2.5,
      ),
    ),
    labelText: label,
    fillColor: Colors.white,
    filled: true,
  );
}

const ReadColor = Color.fromRGBO(231, 28, 36, 1);
const GreenColor = Color.fromRGBO(33, 191, 115, 1);
const DarkBlueColor = Color.fromRGBO(44, 62, 80, 1);

SvgPicture background(context) {
  return SvgPicture.asset(
    'assets/back.svg',
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );
}

DecoratedBox DropdownQuantity(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
    child: child,
  );
}

ButtonStyle StyleButton (){
  return ElevatedButton.styleFrom(
backgroundColor:GreenColor,
foregroundColor:Colors.white,
shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),),
side:const BorderSide(color: Colors.white,width: 1.5)
  );
}

void ErrorMassage (msg){
Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:ReadColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

void SucessMassage (msg){
  Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:GreenColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
}