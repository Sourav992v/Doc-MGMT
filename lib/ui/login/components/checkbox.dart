import 'package:doctor_management/utils/constants.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {

  final bool value;
  final Function checked;
  const CheckBox({
    Key? key,
    required this.value,
    required this.checked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: value,
            onChanged:(bool? value) => checked(),
            activeColor: Colors.green,
            checkColor: Colors.white,
          ),
          FittedBox(
            child: RichText(
              text: const TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(text: ' Terms Of Use',
                        style: TextStyle(
                            color: kColorAccent, fontSize: 12),

                    ),
                    TextSpan(text: ' and',
                      style: TextStyle(
                          color: Colors.white, fontSize: 12),

                    ),
                    TextSpan(text: ' Privacy Policy',
                      style: TextStyle(
                          color: kColorAccent, fontSize: 12),

                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}