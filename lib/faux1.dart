import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        appBar: AppBar(
          title: Text("Welcome Queen!"),
          titleTextStyle: TextStyle(
            color: Colors.lightGreen,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: const Color.fromARGB(255, 19, 79, 21),
          centerTitle: true,
        ),

        body: Container(
          color: const Color.fromARGB(255, 248, 237, 199),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Image.asset('assets/august24(6).jpg', width: 100, height: 100),
              SizedBox(height: 30),
              
              Text(
                "What are we doing today?",
                style: TextStyle(
                  color: const Color.fromARGB(255, 122, 176, 61),
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 50),

              Text(
                "Get to know me",
                style: TextStyle(
                  color: const Color.fromARGB(255, 122, 176, 61),
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 50),

              Text(
                "Socials",
                style: TextStyle(
                  color: const Color.fromARGB(255, 122, 176, 61),
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 50),

            ],
          ),
        ),
      ),
    ),
  );
}
