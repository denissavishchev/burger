import 'package:burger/add_remove.dart';
import 'package:burger/buy_button.dart';
import 'package:burger/constants.dart';
import 'package:burger/size_buttons.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';
import 'burger_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                kLightGreen,
                kGreen,
                kGreen,
                kDarkGreen,
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.0, 0.4, 0.1, 0.9
            ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column( 
                children: [
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                                color: kDarkGreen,
                                boxShadow: [
                                  BoxShadow(
                                    color: kBlack,
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(3, 3),
                                  )
                                ]
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(3),
                              clipBehavior: Clip.hardEdge,
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Image.asset('assets/images/avatar.png', fit: BoxFit.fill,),
                            ),
                          ],
                        ),
                        const CustomButton(icon: 'burger',)
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: kDarkGreen,
                              borderRadius: const BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                  color: kBlack.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset:const Offset(5, 5),
                                )
                              ]
                            ),
                            child: TextField(
                              cursorColor: kBlack,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: const Icon(Icons.search, color: kWhite, size: 30,),
                              hintText: 'Search',
                              hintStyle: TextStyle(fontSize: 22, color: kWhite.withOpacity(0.2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(18),
                                  ),
                                  borderSide: BorderSide(color: kBlack.withOpacity(0.4), width: 3)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(18),
                                ),
                                  borderSide: BorderSide(color: kWhite.withOpacity(0.1), width: 2)
                              ),
                            ),),
                          )),
                      const SizedBox(width: 20,),
                      const CustomButton(icon: 'settings'),
                    ],
                  ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                          height: size.height * 0.55,
                          child: const BurgerView()),
                      Positioned(
                        top: 70,
                        right: 5,
                        child: Container(
                          width: 80,
                          height: 250,
                          color: Colors.transparent,
                          child: SizeButtons(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.07,
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                          child: Text('description of this super duper burger ' * 100,
                            style: const TextStyle(color: kWhite),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        QuantityButtons(),
                        BuyButton()
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}


