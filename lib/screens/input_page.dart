import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
//  Color maleCardColour = inactiveCardColor;
//  Color femaleCardColour = inactiveCardColor;
//
//  void updateColour(gender g) {
//    if (g == gender.male) {
//      if (maleCardColour == inactiveCardColor) {
//        maleCardColour = activeCardColor;
//        femaleCardColour = inactiveCardColor;
//      } else
//        maleCardColour = inactiveCardColor;
//    } else if (g == gender.female) {
//      if (femaleCardColour == inactiveCardColor) {
//        femaleCardColour = activeCardColor;
//        maleCardColour = inactiveCardColor;
//      } else
//        femaleCardColour = inactiveCardColor;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = gender.male;
                    });
                  },
                  colour: selectedGender == gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild:
                      IconContent(gender: 'MALE', ic: FontAwesomeIcons.mars),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = gender.female;
                    });
                  },
                  colour: selectedGender == gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild:
                      IconContent(gender: 'FEMALE', ic: FontAwesomeIcons.venus),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEC1455),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EC1455),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        //activeColor: Colors.white,
                        //inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberTextStyle),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              }),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(age.toString(), style: kNumberTextStyle),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              }),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(calc.calculateBMI(), calc.getResult(),
                    calc.getInterpretation());
              }));
            },
            text: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  BottomButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0x298D8E98),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
