import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CashBackScreen extends StatelessWidget {
  const CashBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/R.png',
                      height: 15,
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                    // Spacer(),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Cashback",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffDC3638),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Center(
                        child: Text(
                          'Referred - 6 People',
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: const [
                        Text(
                          'Earnd CASHBACK',
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.white,
                          indent: 70,
                          endIndent: 70,
                        ),
                        Text(
                          '120 Rs',
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
