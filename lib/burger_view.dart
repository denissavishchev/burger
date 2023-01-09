
import 'package:burger/constants.dart';
import 'package:burger/model.dart';
import 'package:flutter/material.dart';

class BurgerView extends StatelessWidget {
  const BurgerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<List<Burgers>>(
        future: BurgersApi.getBurgers(context),
        builder: (context, snapshot) {
          final burgers = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return buildBurgers(burgers!);
          }
        },
      ),
    );
  }
}

Widget buildBurgers(List<Burgers> burgers) => PageView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: burgers.length,
    itemBuilder: (context, index) {
      final burger = burgers[index];
      return Column(
        children: [
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: 350,
            height: 50,
            child: Row(
              children: [
                Text(burger.name, style: TextStyle(
                    fontSize: 36, fontFamily: 'Lemon', color: kWhite.withOpacity(0.7) ),),
                burger.hit == 'yes' ? Image.asset('assets/icons/hot.png') : Container()
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 100, 0),
            width: 400,
            height: 280,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kBlack.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 150,
                        offset: const Offset(30,0)
                      )
                    ]
                ),
                child: Image.asset('assets/images/${burger.image}', fit: BoxFit.contain,)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 400,
              height: 30,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/fire.png'),
                      Text(burger.kcal, style: TextStyle(color: kWhite.withOpacity(0.8),),),
                      Text(' kcal', style: TextStyle(color: kWhite.withOpacity(0.6)),)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset('assets/icons/clock.png'),
                      ),
                      Text(burger.kcal, style: TextStyle(color: kWhite.withOpacity(0.8),),),
                      Text(' min', style: TextStyle(color: kWhite.withOpacity(0.6)),)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset('assets/icons/scale.png'),
                      ),
                      Text(burger.kcal, style: TextStyle(color: kWhite.withOpacity(0.8),),),
                      Text(' g', style: TextStyle(color: kWhite.withOpacity(0.6)),)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
