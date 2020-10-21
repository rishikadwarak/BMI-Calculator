import 'package:flutter/material.dart';
import '../constants.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  ResultsPage(this.bmiResult, this.resultText, this.resultInterpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                        color: Color(0xFF20D977),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0),
                  ),
//                  Text(
//                    'Normal BMI range:',
//                    style: kLabelTextStyle.copyWith(fontSize: 22.0),
//                  ),
//                  Text('18.5 - 25 kg/m2', style: TextStyle(fontSize: 22.0)),
                  Text(
                    resultInterpretation,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
//                  FlatButton(
//                    onPressed: () {},
//                    child: Text(
//                      'SAVE RESULT',
//                      style:
//                          TextStyle(fontSize: 20.0, color: Color(0xFF8D8E98)),
//                    ),
//                    color: Color(0xFF121528),
//                    padding:
//                        EdgeInsets.symmetric(vertical: 22.5, horizontal: 70.0),
//                  )
                ],
              ),
              margin: EdgeInsets.all(10.0),
              //padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
              decoration: BoxDecoration(
                color: Color(0xFF1C2033),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'RE-CALCULATE YOUR BMI',
          ),
//          Container(
//            alignment: Alignment.center,
//            //margin: EdgeInsets.only(top: 10.0),
//            padding: EdgeInsets.only(bottom: 20.0),
//            height: kBottomContainerHeight,
//            width: double.infinity,
//            color: kBottomContainerColor,
//            child: Text(
//              'RE-CALCULATE YOUR BMI',
//              style: TextStyle(
//                fontSize: 20.0,
//                fontWeight: FontWeight.w600,
//              ),
//            ),
          //),
        ],
      ),
    );
  }
}
