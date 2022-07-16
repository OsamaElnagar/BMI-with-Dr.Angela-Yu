import 'dart:math';

import 'package:flutter/material.dart';
import '../../layout/result_page.dart';
import '../constants/constants.dart';

class CardItem extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final double left;
  final double right;
  final double top;
  final double bottom;

  final Function()? onPress;

  const CardItem({
    Key? key,
    required this.colour,
    this.cardChild,
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin:
            EdgeInsets.only(bottom: bottom, right: right, left: left, top: top),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({Key? key, required this.genderIcon, required this.gender})
      : super(key: key);
  final IconData genderIcon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 90.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  final Function() onPress;
  final String label;

  const BottomButton({
    Key? key,
    required this.onPress,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(label, style: kBottomTextStyle),
        ),
        height: 60.0,
        width: double.infinity,
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 3.0),
      ),
    );
  }
}

class BMIBrain {
  final int height;
  final int weight;
  double _bmi = 0;

  BMIBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if(_bmi >=25)
    {
      return 'Overweight';
    }else if (_bmi >18.5)
    {
      return 'normal';
    } else
    {
      return 'Underweight';
    }
  }

  String getInterpretation()
  {
    if(_bmi >=25)
    {
      return 'You have a higher than a normal body weight, Try to exercise  more.';
    }else if (_bmi >18.5)
    {
      return 'You have a normal body weight, Good job!';
    } else
    {
      return 'You have a lower than normal body weight, You can eat a bit more.';
    }
  }

}
