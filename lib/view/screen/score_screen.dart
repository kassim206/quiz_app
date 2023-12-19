import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants.dart';
import 'package:quiz_app/core/global_variables/global_variables.dart';
import 'package:quiz_app/core/pallete.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallete.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Container(
                width: deviceWidth * 0.75,
                height: deviceHeight * 0.45,
                decoration: BoxDecoration(
                    color: pallete.textColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Image.asset(Constants.congrats),
                      Padding(
                        padding: const EdgeInsets.only(left: 68),
                        child: Row(
                          children: [
                            Text(
                              "50%",
                              style: TextStyle(
                                  color: pallete.tryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: deviceWidth * 0.02,
                            ),
                            Text(
                              "Score",
                              style: TextStyle(
                                  color: pallete.tryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Quiz completed successfully..!",
                        style:
                            TextStyle(color: pallete.blackColor, fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'You attempt ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: '10 Questions ',
                              style: TextStyle(color: pallete.pinkColor),
                            ),
                            TextSpan(
                              text: 'and',
                              style: TextStyle(color: pallete.blackColor),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'from that ',
                              style: TextStyle(color: pallete.blackColor),
                            ),
                            TextSpan(
                              text: '5 answers',
                              style: TextStyle(color: pallete.greenColor),
                            ),
                            TextSpan(
                              text: ' is correct.',
                              style: TextStyle(color: pallete.blackColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.1,
          ),
          Container(
            width: deviceWidth * 0.35,
            height: deviceHeight * 0.08,
            decoration: BoxDecoration(
                color: pallete.tryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              'Try again..!',
              style: TextStyle(color: pallete.textColor),
            )),
          )
        ],
      ),
    );
  }
}
