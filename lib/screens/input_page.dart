// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi/calculator_brain.dart';

enum GenderType {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType selectedGender = GenderType.none;
  int height = 179;
  int weight = 60;
  int age = 21;

  // to check gender and select the class was replaced by ternary operator
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  //
  // // 0-Female, 1-Male
  // void updateColor(GenderType selectedgGender){
  //   if(selectedgGender == GenderType.female){
  //     if(femaleCardColor == inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     }else{
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if(selectedgGender == GenderType.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('BMI Calculator'),
        ),
        elevation: 8,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // or use Expanded
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      child: ReusableCard(
                        // colour: Color(0xFF1D1E33),
                        colour: selectedGender == GenderType.male ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  // Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == GenderType.female ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    'HEIGHT',
                    style: kLabelTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          // '180',
                        height.toString(),
                        style: kNumberTextstyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextstyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 200.0,
                          // overwritten by activetrackcolor
                          // activeColor: Colors.white,
                          // inactiveColor Color(0xFF8D8E98),
                          onChanged:  (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   onPressed: () {
                            //     setState(() {
                            //       weight--;
                            //     });
                            //   },
                            // ),
                            // SizedBox(
                            //   width: 10.0,
                            // ),
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.plus,
                            //   onPressed: () {
                            //     setState(() {
                            //       weight++;
                            //     });
                            //   },
                            // ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                // Icons.minimize,
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // BottomButtom(
            //   buttonTitle: 'CALCULATE',
            //   onTap: () {
            //     Navigator.push(context,
            //       // MaterialPageRoute(builder: (context) {
            //       //   return ResultPage();
            //       // }));
            //       MaterialPageRoute(builder: (context) => ResultPage(),
            //       ),
            //     );
            //   },
            // ),
              GestureDetector(
                  onTap: () {
                    //Initializing
                    CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                    Navigator.push(context,
                      // MaterialPageRoute(builder: (context) {
                      //   return ResultPage();
                      // }));
                      MaterialPageRoute(builder: (context) => ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultTest: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                      ),
                    );
                  },
                  child: Container(
                    color: kBottomContainerColor,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.only(bottom: 5),
                    height: kBottomContainerHeight,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'CALCULATE',
                        style: kLargeTextstyle,
                      ),
                    ),
                  ),
            )
          ],
        ),
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData.light(
      //   ),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}

// class RoundIconButton extends StatelessWidget {
//   RoundIconButton({super.key,required this.icon, required this.onPressed});
//
//   final IconData icon;
//   final Function onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       onPressed: onPressed(),
//       // onPressed: () {},
//       elevation: 6.0,
//       constraints: BoxConstraints.tightFor(
//         width: 56.0,
//         height: 56.0,
//       ),
//       // shape: CircleBorder(),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       fillColor: Color(0xFF4C4F5E),
//       child: Icon(icon),
//     );
//   }
// }
