import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var time = 'Loading';


void SetupWorld() async{
  WorldTime instance = WorldTime(location: 'Berlin',flag: 'german.png',url: 'Europe/Berlin');
  await instance.getTime();
  print(instance.time);
  setState(() {
    time = instance.time;
  });

}
  @override
  void initState() {
    super.initState();
    SetupWorld();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),


      ),
    );
  }
}