import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/components/components.dart';
import '../shared/constants/constants.dart';
import 'result_page.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  GenderType? selectedGender;
  int height = 180;
  int weight = 80;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardItem(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    top: 15.0,
                    bottom: 0.0,
                    left: 15.0,
                    right: 7.5,
                    cardChild: const CardContent(
                      gender: 'Male',
                      genderIcon: FontAwesomeIcons.male,
                    ),
                    colour: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: CardItem(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    top: 15.0,
                    bottom: 0.0,
                    left: 7.5,
                    right: 15.0,
                    cardChild: const CardContent(
                      gender: 'Female',
                      genderIcon: FontAwesomeIcons.female,
                    ),
                    colour: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardItem(
              top: 15.0,
              bottom: 0.0,
              left: 15.0,
              right: 15.0,
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'height'.toUpperCase(),
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      FloatingActionButton(
                        child: const Icon(
                          FontAwesomeIcons.minus,
                          color: Colors.white,
                        ),
                        heroTag: '5',
                        onPressed: () {
                          setState(() {
                            height--;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        height.toString(),
                        style: kBodyTextStyle,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        'cm'.toUpperCase(),
                        style: kLabelTextStyle,
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      FloatingActionButton(
                        child: const Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        ),
                        heroTag: '6',
                        onPressed: () {
                          setState(() {
                            height++;
                          });
                        },
                      ),

                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    max: 220.0,
                    min: 120.0,
                    activeColor: kBottomContainerColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardItem(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'weight'.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBodyTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              heroTag: '1',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            FloatingActionButton(
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              heroTag: '2',
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    top: 15.0,
                    bottom: 15.0,
                    left: 15.0,
                    right: 7.5,
                    colour: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: CardItem(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'age'.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBodyTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              heroTag: '3',
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            FloatingActionButton(
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              heroTag: '4',
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    top: 15.0,
                    bottom: 15.0,
                    left: 7.5,
                    right: 15.0,
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPress: () {
              BMIBrain calc = BMIBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                ),
              );
            },
            label: 'calculate'.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
