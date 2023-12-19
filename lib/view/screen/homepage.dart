import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/global_variables/global_variables.dart';
import 'package:quiz_app/core/pallete.dart';
import 'package:quiz_app/view/screen/score_screen.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz'));

    if (response.statusCode == 200) {
      // Successfully fetched data
      final Map<String, dynamic> data = json.decode(response.body);
      print('Parsed data: $data');
    } else {
      // Handle errors
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  }

  double progressValue = 0.0;
  Color indicatorColor = pallete.barColor;
  Color redColor = Colors.red;
  int totalTime = 30;
  int warningTime = 22;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    int elapsedSeconds = 0;

    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        progressValue = elapsedSeconds / totalTime;

        if (elapsedSeconds >= warningTime) {
          indicatorColor = pallete.tryColor;
        }

        elapsedSeconds += 1;

        if (elapsedSeconds > totalTime) {
          timer.cancel();
        }
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallete.primaryColor,
body:  Column(
  children: [
    SizedBox(height: deviceHeight*0.06,),
    Center(
      child: Container(
        width: deviceWidth*0.8,

        child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(10),
          value: progressValue,
          backgroundColor:  pallete.indicatorColor,
          valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
          minHeight: 25,
        ),
      ),
    ),
    SizedBox(height: deviceHeight*0.049,),
    Container(
      width: deviceWidth*0.85,
        child: Text("Which plant in our system is know as the Red Plant?",
          style: TextStyle(color: pallete.textColor,fontWeight:
          FontWeight.bold,fontSize: deviceWidth*0.054),)),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:double.infinity,
        height: deviceHeight*0.5,
        color: pallete.primaryColor,
        child:  ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding:
              const EdgeInsets.all(8.0),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: deviceHeight*0.081,
                    decoration: BoxDecoration(
                      color:pallete.primaryColor,
                        border: Border.all(width:1,color: pallete.textColor),
                        // color: offerData [index].active
                        //     ? Colors.yellow
                        //     : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )),
      ),
    ),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreScreen(),));
      },
      child: Text(
        "Next",
        style: TextStyle(color: pallete.primaryColor),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: pallete.textColor,fixedSize: Size.fromWidth(deviceWidth*0.45),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          side: BorderSide(width: deviceWidth * 0.9)),
    ),
  ],
),
    );
  }
}
