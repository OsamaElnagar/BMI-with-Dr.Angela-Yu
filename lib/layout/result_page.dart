import 'package:angela_bmi_app/layout/input_page.dart';
import 'package:angela_bmi_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import '../shared/constants/constants.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmiResult;
  final String interpretation;

  const ResultPage({
    Key? key,
    required this.resultText,
    required this.bmiResult,
    required this.interpretation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(
                15.0,
              ),
              alignment: Alignment.bottomLeft,
              child: Text(
                'your result'.toUpperCase(),
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardItem(
              bottom: 15,
              top: 15.0,
              left: 15.0,
              right: 15.0,
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kLabelTextStyle,
                  ),
                  Text(
                    bmiResult.toUpperCase(),
                    style: kBodyTextStyle,
                  ),
                  Text(
                    interpretation.toUpperCase(),
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InputPage(),
                ),
              );
            },
            label: 're_calculate'.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
