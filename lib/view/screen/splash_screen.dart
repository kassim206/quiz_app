import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants.dart';
import 'package:quiz_app/core/global_variables/global_variables.dart';
import 'package:quiz_app/core/pallete.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';

class SplashScreen extends StatelessWidget {
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz'));

    if (response.statusCode == 200) {
      // Successfully fetched data
      print('Response data: ${response.body}');
    } else {
      // Handle errors
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallete.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Image.asset(
                Constants.quiztime,
                height: deviceHeight * 0.4,
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.1,
          ),
          ElevatedButton(
            onPressed: () {
              fetchData();
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: pallete.bottonColor,
    fixedSize: Size.fromWidth(deviceWidth*0.4),


                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                side: BorderSide(width: deviceWidth * 0.9)),
            child: Text(
              "Start Quiz",
              style: TextStyle(color: pallete.textColor),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.11,
          ),
          Image.asset(Constants.artifitia)
        ],
      ),
    );
  }
}
