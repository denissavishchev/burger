import 'package:flutter/material.dart';
import 'constants.dart';

class BuyButton extends StatefulWidget {

  const BuyButton({
    Key? key,
  }) : super(key: key);

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {

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
        padding: const EdgeInsets.all(0),
        width: 150,
        height: 64,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            border: Border.all(width: 3, color: kWhite.withOpacity(0.2)),
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
        child: const Center(child: Text('Buy', style: TextStyle(color: kWhite, fontSize: 32),)),
      ),
    );
  }
}