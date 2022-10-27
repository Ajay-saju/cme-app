// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:hslr/screen/creat_account/create_account.dart';
// import 'package:hslr/screen/dashboard/dashboard.dart';
// import 'package:hslr/screen/forgotpassword/forgot_password.dart';
// import 'package:hslr/screen/login/login_controller.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   LoginController logController = Get.put(LoginController());



//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LoginController>(
//       builder: ((_) {
//         return GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: Scaffold(
//             backgroundColor: Colors.grey,
//             body: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(40.0),
//                 child: Form(
//                   key: logController.formkey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20.0),
//                           child: Row(
//                             children: [
//                               ClipOval(
//                                 child: Image.asset(
//                                   'assets/man.png',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20.0),
//                                 child: Text(
//                                   "Name",
//                                   style: TextStyle(fontSize: 35.0),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 50.0),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 20.0, top: 2.5, bottom: 2.5),
//                               child: TextFormField(
//                                 inputFormatters: [
//                                   LengthLimitingTextInputFormatter(10),
//                                 ],
//                                 keyboardType: TextInputType.phone,
//                                 controller: logController.mobNumb,
//                                 validator: (value) {
//                                   if (value!.isNotEmpty && value.length > 9) {
//                                     return null;
//                                   } else if (value.length < 9 &&
//                                       value.isNotEmpty) {
//                                     return "Your Mobile Is Short";
//                                   } else {
//                                     return 'Required Mobile No ';
//                                   }
//                                 },
//                                 decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50.0),
//                                       borderSide:
//                                           const BorderSide(color: Colors.green),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50.0),
//                                       borderSide: const BorderSide(
//                                           color: Colors.transparent),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50.0),
//                                       borderSide:
//                                           const BorderSide(color: Colors.grey),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50.0),
//                                       borderSide:
//                                           BorderSide(color: Colors.transparent),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50.0),
//                                       borderSide: BorderSide(
//                                         color: Colors.transparent,
//                                       ),
//                                     ),
//                                     hintText: "Mobile Number",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     contentPadding:
//                                         const EdgeInsets.only(left: 20.0)),
//                                 // decoration: InputDecoration.collapsed(
//                                 //   border: BorderRadius.circular(radius),
//                                 //     hintStyle: TextStyle(color: Colors.grey),
//                                 //     hintText: "Mobile Number"),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 50,
//                         ),
//                         SizedBox(
//                           height: logController.sizetext
//                               ? context.height * 0.1
//                               : context.height * 0.07,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20.0),
//                             child: TextFormField(
//                               onTap: () {},
//                               obscureText: logController.isObscure,
//                               inputFormatters: [
//                                 LengthLimitingTextInputFormatter(6),
//                               ],
//                               keyboardType: TextInputType.text,
//                               controller: logController.password,
//                               validator: (value) {
//                                 if (value!.isNotEmpty && value.length > 5) {
//                                   return null;
//                                 } else if (value.length < 5 &&
//                                     value.isNotEmpty) {
//                                   return "Your Password is Short";
//                                 } else {
//                                   logController.sizedtext();
//                                   return 'Required Password';
//                                 }
//                               },
//                               decoration: InputDecoration(
//                                   suffix: Container(
//                                     transform:
//                                         Matrix4.translationValues(-10, 8, 0),
//                                     child: IconButton(
//                                         // iconSize: 15.0,
//                                         color: Colors.grey,
//                                         onPressed: () {
//                                           logController.isObscure =
//                                               !logController.isObscure;
//                                           logController.update();
//                                         },
//                                         icon: Icon(logController.isObscure
//                                             ? Icons.visibility_off
//                                             : Icons.visibility)),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(50.0),
//                                     borderSide:
//                                         const BorderSide(color: Colors.green),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(50.0),
//                                     borderSide: const BorderSide(
//                                         color: Colors.transparent),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(50.0),
//                                     borderSide:
//                                         const BorderSide(color: Colors.grey),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(50.0),
//                                     borderSide:
//                                         BorderSide(color: Colors.transparent),
//                                   ),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(50.0),
//                                     borderSide: BorderSide(
//                                       color: Colors.transparent,
//                                     ),
//                                   ),
//                                   // hintStyle: TextStyle(color: Colors.white),
//                                   hintText: "Password",
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   contentPadding:
//                                       EdgeInsets.only(left: 20.0, bottom: 30)),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: context.height * 0.1,
//                         ),
//                         Center(
//                             child: SizedBox(
//                           width: context.width * 0.3,
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 if (logController.formkey.currentState!
//                                     .validate()) {
//                                   logController.sessionlogin();
                                  
//                                 } else {
//                                   print("not valid");
//                                 }
//                               },
//                               child: Text("Login")),
//                         )),
//                         SizedBox(
//                           height: context.height * 0.01,
//                         ),
//                         GestureDetector(
//                             onTap: () {
//                               Get.to(Forgotpassword());
//                             },
//                             child: Center(child: Text("Forgot Password ?"))),
//                         SizedBox(
//                           height: context.height * 0.05,
//                         ),
//                         Center(
//                             child: SizedBox(
//                           width: context.width * 0.5,
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 Get.to(CreateAccount());
//                               },
//                               child: Text("Create New Account")),
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
