import 'package:bmi_calc/components/IconContent.dart';
import 'package:bmi_calc/components/ReusableCardExtractorCopy.dart';
import 'package:bmi_calc/components/bottom_button.dart';
import 'package:bmi_calc/components/round_icon_button.dart';
import 'package:bmi_calc/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 160;
  int weight = 60;
  int age = 26;

  Color maleCardColor = kTealLight;
  Color femaleCardColor = kTealLight;

  /*// 1 = male, 2 = female
  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == tealLight) {
        maleCardColor = tealColor;
        femaleCardColor = tealLight;
      } else {
        maleCardColor = tealLight;
        femaleCardColor = tealLight;
      }
    }
    if (gender == 2) {
      if (femaleCardColor == tealLight) {
        femaleCardColor = tealColor;
        maleCardColor = tealLight;
      } else {
        femaleCardColor = tealLight;
        maleCardColor = tealLight;
      }
    }
  }*/

  /*void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == tealLight) {
        maleCardColor = tealColor;
        femaleCardColor = tealLight;
      } else {
        maleCardColor = tealLight;
        femaleCardColor = tealLight;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColor == tealLight) {
        femaleCardColor = tealColor;
        maleCardColor = tealLight;
      } else {
        femaleCardColor = tealLight;
        maleCardColor = tealLight;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 4,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  /*child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // updateColor(Gender.male);
                        selectedGender = Gender.male;
                      });
                      print('Male card selected');
                    },*/
                  child: ReusableCardExtractCopy(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    // colour: maleCardColor,
                    colour:
                        selectedGender == Gender.male ? kTealColor : kTealLight,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                // ),
                Expanded(
                  /*child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // updateColor(Gender.female);
                        selectedGender = Gender.female;
                      });
                      print('Female card selected');
                    },*/
                  child: ReusableCardExtractCopy(
                    // colour: femaleCardColor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kTealColor
                        : kTealLight,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCardExtractCopy(
              colour: kTealLight,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyleOwn,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyleOwn,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.grey,
                      activeTrackColor: Colors.white,
                      // thumbColor: Color(0xFFEB1555),
                      thumbColor: Colors.teal,
                      // overlayColor: Color(0xFFf1d4d4),
                      overlayColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 250.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCardExtractCopy(
                    colour: kTealLight,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyleOwn,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCardExtractCopy(
                    colour: kTealLight,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyleOwn,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {},
            buttonTitle: 'Calculate',
          ),
        ],
      ),
    );
  }
}
