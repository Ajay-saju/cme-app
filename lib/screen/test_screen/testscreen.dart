import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/cashback_screen/cashback_screen.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/quiz/question.dart';
import 'package:hslr/screen/ref&earn_screen/ref&earn_screen.dart';
import 'package:hslr/screen/test_screen/testscreen_controller.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    // bool isClicked = false;
    final testScreenController = Get.put(TestScreenController());
    return GetBuilder<TestScreenController>(builder: ((_) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                color: Colors.black,
              ),
              InkWell(
                onTap: () {
                  Get.off(Dashboard());
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
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "PG NEET / CET",
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
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        testScreenController.dropOne =
                            !testScreenController.dropOne;
                        testScreenController.update();
                      },
                      child: Container(
                        height: 40,
                        width: context.width > 410
                            ? context.width * 0.45
                            : context.width * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xffDC3638),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // Initial Value
                              value: testScreenController.cetItem,
                              hint: Text(
                                "PG NEET/ CET",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.width > 410 ? 15 : 13),
                              ),

                              // Down Arrow Icon
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Image.asset(
                                  'assets/gg.png',
                                  height: 10,
                                ),
                              ),

                              // Array list of items
                              items: testScreenController.cetItems
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(
                                              0xff2D2D2D)) //Color(0xff4169e1)),#
                                      ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                testScreenController.cetItem = newValue;
                                testScreenController.update();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        testScreenController.dropTwo =
                            !testScreenController.dropTwo;
                        testScreenController.update();
                      },
                      child: Container(
                        height: 40,
                        width: context.width > 410
                            ? context.width * 0.45
                            : context.width * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xffDC3638),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // Initial Value
                              value: testScreenController.topic,
                              hint: Text(
                                "Select Topic",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Nunito",
                                    fontSize: context.width > 410 ? 15 : 13),
                              ),

                              // Down Arrow Icon
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Image.asset(
                                  'assets/gg.png',
                                  height: 10,
                                ),
                              ),

                              // Array list of items
                              items: testScreenController.topicItmes
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(
                                              0xff2D2D2D)) //Color(0xff4169e1)),#
                                      ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                testScreenController.topic = newValue;
                                testScreenController.update();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
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
                              'TITLE: Obstetrics & Gynecology',
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        'LAUNCH DATE : OCT 20th 3:00 PM',
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: testScreenController.isClicked
                                ? () {
                                    print(testScreenController.isClicked);
                                    testScreenController.isClicked = false;
                                    print(testScreenController.isClicked);
                                    testScreenController.createOrder();
                                  }
                                : null,
                            child: Container(
                              height: 75,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffDC3638),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                'Test fees',
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(const ReffEarnScreen()),
                            child: Container(
                              height: 75,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffDC3638),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  'Refer\n   &\nEarn',
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(const CashBackScreen()),
                            child: Container(
                              height: 75,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffDC3638),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                'Cashback',
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  // color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  testScreenController.isGoingtoTest = true;
                  Get.off(Question(
                    isGoingtoTest: testScreenController.isGoingtoTest,
                  
                  ));
                },
                child: Text(
                  'Take Test',
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              )
            ],
          )),
        ),
      );
    }));
  }

  void onTapp(bool val) {}

  void prosess() {
    Future.delayed(const Duration(seconds: 3));
  }
}
