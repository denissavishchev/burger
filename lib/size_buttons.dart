import 'package:flutter/material.dart';
import 'constants.dart';

enum Buttons {
  S,
  M,
  L,
}

class SizeButtons extends StatefulWidget {
  SizeButtons({Key? key}) : super(key: key);

  @override
  State<SizeButtons> createState() => _SizeButtonsState();
}

class _SizeButtonsState extends State<SizeButtons> {
  dynamic selectedButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(text: 'S', onPress: (){
          setState(() {
            selectedButton = Buttons.S;
          });
        }, isPressed: selectedButton == Buttons.S ? false : true),
        Button(text: 'M', onPress: (){
          setState(() {
            selectedButton = Buttons.M;
          });
        }, isPressed: selectedButton == Buttons.M ? false : true),
        Button(text: 'L', onPress: (){
          setState(() {
            selectedButton = Buttons.L;
          });
        }, isPressed: selectedButton == Buttons.L ? false : true),
      ],
    );
  }
}

class Button extends StatelessWidget {
  
  final String text;
  final Function() onPress;
  final bool isPressed;
  
  const Button({
    Key? key, required this.text, required this.onPress, required this.isPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(width: 2, color: isPressed ? kWhite.withOpacity(0.1) : kWhite.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: kBlack.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: isPressed ? const Offset(5, 5) : const Offset(2, 2),
              )
            ],
            color: kDarkGreen
        ),
        child: Center(child: Text(text, style: const TextStyle(color: kWhite, fontSize: 36, fontFamily: 'Literata'),)),
      ),
    );
  }
}
