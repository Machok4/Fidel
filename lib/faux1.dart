import 'package:flutter/material.dart';
import 'package:mels_faux_app_1/configs/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text("welcome Queen!"),
          titleTextStyle: TextStyle(
            color: secondaryColor1,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: secondaryColor,
          centerTitle: true,
        ),

        body: Container(
          color: const Color.fromARGB(255, 239, 209, 203),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/august24(6)cropped.jpg',
                    height: 150,
                    width: 150,
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  "Goals Set",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 122, 176, 61),
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 5),

                Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: secondaryColor2,
                    border: Border.all(color: secondaryColor2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Click here!",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // TextField(
                // decoration: InputDecoration(
                // hintText: "Type here",
                //border: OutlineInputBorder(),
                //),
                //),
                Text(
                  "Goals Achieved",
                  style: TextStyle(
                    color: secondaryColor4,
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 5),

                Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: secondaryColor2,
                    border: Border.all(color: secondaryColor2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Click here!",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // TextField(
                // decoration: InputDecoration(border: OutlineInputBorder()),
                //),
                //SizedBox(height: 30),
                Text(
                  "Past but Due",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 122, 176, 61),
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 5),

                Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: secondaryColor2,
                    border: Border.all(color: secondaryColor2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Click here!",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                //TextField(
                //decoration: InputDecoration(border: OutlineInputBorder()),
                //)//,
              ],
            ), //Column
          ),
        ),
      ),
    ),
  );
}
