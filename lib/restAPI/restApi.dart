import 'dart:convert';

import 'package:crud_applacation_02/style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> CreateProductReqest(FormValue) async {
  var Url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var Body = json.encode(FormValue);
  var Header = {"Content-Type": "application/json"};
  var response = await http.post(Url, body: Body, headers: Header);
  var resultBody = json.decode(response.body);
  var resultCode = response.statusCode;
  if (resultCode == 200 && resultBody["status"] == "success") {
    SucessMassage('request sucess');
    return true;
  } else {
    ErrorMassage('request fail ! try again ');
    return false;
  }
}

Future<List> ReadProductReqest() async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var Header = {"Content-Type": "application/json"};
  var response = await http.get(URL, headers: Header);
  var ResultStatus = response.statusCode;
  var resultBody = json.decode(response.body);
  if (ResultStatus == 200 && resultBody["status"] == "success") {
     return resultBody["data"];
  } else {
    ErrorMassage('Request Fail ! Try again');
    return [];
  }
}

Future<bool> DeletProductRequest (id)async{

var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var Header = {"Content-Type": "application/json"};
  var response = await http.get(URL, headers: Header);
  var ResultStatus = response.statusCode;
  var resultBody = json.decode(response.body);
  if (ResultStatus == 200 && resultBody["status"] == "success") {
     return true;
  } else {
    ErrorMassage('Request Fail ! Try again');
    return false ;
  }
}


Future<bool> UpdateProductReqest(FormValue,id) async {
  var Url = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var Body = json.encode(FormValue);
  var Header = {"Content-Type": "application/json"};
  var response = await http.post(Url, body: Body, headers: Header);
  var resultBody = json.decode(response.body);
  var resultCode = response.statusCode;
  if (resultCode == 200 && resultBody["status"] == "success") {
    SucessMassage('request sucess');
    return true;
  } else {
    ErrorMassage('request fail ! try again ');
    return false;
  }
}