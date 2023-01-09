import 'package:flutter/material.dart';
import 'constants.dart';

class CustomButton extends StatefulWidget {

  final String icon;

  const CustomButton({
    Key? key, required this.icon,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  bool isPressed = true;

  void _isPressed(){
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
          _isPressed();
      },
      onTapUp: (_){
        _isPressed();
      },
      onTapCancel: (){
        _isPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        width: 56,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(width: 2, color: kWhite.withOpacity(0.1)),
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
        child: Image.asset('assets/icons/${widget.icon}.png'),
      ),
    );
  }
}