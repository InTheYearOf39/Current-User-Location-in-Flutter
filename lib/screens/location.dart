// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var locationMessage = "";

  void getCurrentLocation() async{
   var position = await Geolocator
       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   var lastPosition = await Geolocator.getLastKnownPosition();
   print(lastPosition);
   var lat = position.latitude;
   var long = position.longitude;
   print("$lat , $long");


   setState(() {
     locationMessage = "Latitude: $lat, Longitude: $long";
   });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child:
            Text("Location Services")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                Icons.location_pin,
                size: 46.0,
                color: Colors.blue,
            ),
            SizedBox(height: 10,),
            Text(
                "Get user Location",
                style: TextStyle(
                    fontSize: 26.0,fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20.0,),
            Text("Position: $locationMessage"),
            TextButton(
                onPressed: (){
                  getCurrentLocation();
                },
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child:
                Text(
                  "Get Your Current Location",
                   style: TextStyle(
                     color: Colors.white,
                   ),),
            )
          ],
        ),
      ),
    );
  }
}
