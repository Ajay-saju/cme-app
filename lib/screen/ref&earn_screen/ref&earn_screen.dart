import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReffEarnScreen extends StatelessWidget {
  const ReffEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> refFormkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
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
                        "Refer & Earn",
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
                height: 565,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffDC3638),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Refer & Earn',
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 35,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: refFormkey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.black,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType: TextInputType.text,
                              // controller: mebController.memName,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 3) {
                                  return null;
                                } else if (value.length < 3 &&
                                    value.isNotEmpty) {
                                  return "Your Name Is Short";
                                } else {
                                  return 'Required Name ';
                                }
                              },
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      color: Color.fromARGB(255, 191, 36, 36)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Doctor Name",
                                  hintStyle: TextStyle(
                                    fontFamily: "Nunito",
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsets.only(left: 20.0)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              cursorColor: Colors.black,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType: TextInputType.number,
                              // controller: mebController.membmobile,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 10) {
                                  return null;
                                } else if (value.length < 10 &&
                                    value.isNotEmpty) {
                                  return "Your Mobile No Short";
                                } else {
                                  return 'Required Mobile Number ';
                                }
                              },
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Color.fromARGB(255, 191, 36, 36)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Mobile Number",
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsets.only(left: 20.0)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 150,
                              child: TextFormField(
                                maxLines: 10,
                                //  minLines: 3,

                                decoration: InputDecoration(
                                  hintText: "Message to Doctor",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // ElevatedButton(onPressed: (){}, child: Text('Submit'),style: ElevatedButton.styleFrom({}),)
                            InkWell(
                              onTap: () => refFormkey.currentState!.validate(),
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black87,
                                ),
                                child: Center(
                                    child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontFamily: "Nunito",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
