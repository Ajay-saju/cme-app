import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/models/get_eduid_list.model.dart';
import 'package:hslr/screen/education_details/education_controller.dart';
import 'package:hslr/screen/education_details/education_screen.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddEducationDetails extends StatefulWidget {
  const AddEducationDetails({Key? key}) : super(key: key);

  @override
  State<AddEducationDetails> createState() => _AddEducationDetailsState();
}

class _AddEducationDetailsState extends State<AddEducationDetails> {
  // final GlobalKey<FormState> addEduFormKey = GlobalKey<FormState>();
  final eduController = Get.find<EducationController>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eduController.degreeController.clear();
    eduController.universityController.clear();
    eduController.collegeController.clear();
  }

  // String? _selectedItem;
  // List<String> _items = ['value1', 'value2', 'value3', 'value4'];

  @override
  Widget build(BuildContext context) {
    // List<Strings> degreeItems = eduController.eduIdList.value!.courseList!;
    return GetBuilder<EducationController>(builder: ((_) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            body: SafeArea(
              child: eduController.eduIdList.value == null
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.black87),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      "Add Education Information",
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
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                              key: eduController.addEduFormKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Degree',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "Nunito",
                                              color: Colors.black87),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: context.width * 0.55,
                                          // decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(10),
                                          //     border: Border.all(
                                          //         color: Colors.black87)),
                                          child: TypeAheadFormField(

                                              // key: eduController.addEduFormKey,
                                              validator: (value) {
                                                var error =
                                                    degreeTypeAhead(value);
                                                return error;
                                              },
                                              errorBuilder: (context, error) =>
                                                  Text(error.toString()),
                                              hideOnError: true,
                                              hideSuggestionsOnKeyboardHide:
                                                  false,
                                              hideKeyboardOnDrag: true,
                                              // hideKeyboardOnDrag: true,
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(
                                                      // cursorHeight: 20,
                                                      cursorColor:
                                                          Colors.black87,
                                                      decoration:
                                                          new InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(
                                                                      10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black87)),
                                                              // focusedBorder:
                                                              //     InputBorder
                                                              //         .none,
                                                              // // enabledBorder:
                                                              //     InputBorder.none,
                                                              // errorBorder:
                                                              //     InputBorder.none,
                                                              errorBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(
                                                                      10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black87)),
                                                              // disabledBorder:
                                                              //     InputBorder
                                                              //         .none,
                                                              contentPadding: EdgeInsets.only(
                                                                  left: 15,
                                                                  bottom: 11,
                                                                  top: 11,
                                                                  right: 15),
                                                              hintText:
                                                                  "Select Degree"),
                                                      controller: eduController
                                                          .degreeController),
                                              suggestionsCallback: (pattern) {
                                                return eduController
                                                    .specialtyList
                                                    .where((element) => element
                                                        .specialtyName!
                                                        .toLowerCase()
                                                        .contains(pattern
                                                            .toLowerCase()));
                                              },
                                              itemBuilder: (context,
                                                  SpecialtyList suggestion) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(suggestion
                                                      .specialtyName!),
                                                );
                                              },
                                              onSuggestionSelected: (SpecialtyList suggestion) {
                                                eduController
                                                        .degreeController.text =
                                                    suggestion.specialtyName!;
                                                eduController.corseCode =
                                                    suggestion.specialtyId!
                                                        .toString();
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  // customeDropDownTextMonth(
                                  //     context: context,
                                  //     hintText: 'Select month',
                                  //     item: eduController.month,
                                  //     items: eduController.months,
                                  //     text: 'Year Of\nPassing'),
                                  // SizedBox(
                                  //   height: 15,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 15),
                                  //   child: Row(
                                  //     children: [
                                  //       Spacer(),
                                  //       Container(
                                  //         width: context.width * 0.55,
                                  //         child: DropdownButtonFormField(
                                  //             validator: (value) =>
                                  //                 value == null
                                  //                     ? 'field required'
                                  //                     : null,
                                  //             itemHeight: null,
                                  //             isExpanded: true,
                                  //             decoration: InputDecoration(
                                  //               contentPadding:
                                  //                   EdgeInsets.symmetric(
                                  //                       horizontal: 7),
                                  //               border: OutlineInputBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         10.0),
                                  //                 borderSide: const BorderSide(
                                  //                     color: Colors.black),
                                  //               ),
                                  //               enabledBorder:
                                  //                   OutlineInputBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         10.0),
                                  //                 borderSide: const BorderSide(
                                  //                     color: Colors.black),
                                  //               ),
                                  //               errorBorder: OutlineInputBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         10.0),
                                  //                 borderSide: const BorderSide(
                                  //                     color: Colors.black),
                                  //               ),
                                  //               focusedBorder:
                                  //                   OutlineInputBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         10.0),
                                  //                 borderSide: BorderSide(
                                  //                     color: Colors.black),
                                  //               ),
                                  //               focusedErrorBorder:
                                  //                   OutlineInputBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         10.0),
                                  //                 borderSide: const BorderSide(
                                  //                   color: Colors.black,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //             style: TextStyle(
                                  //                 fontSize: 17,
                                  //                 fontFamily: "Nunito",
                                  //                 color: Colors.black87),
                                  //             hint: Text(
                                  //               'Select Year',
                                  //               style: TextStyle(
                                  //                   fontSize: 16,
                                  //                   fontFamily: "Nunito",
                                  //                   color: Colors.black87),
                                  //             ),
                                  //             items: eduController.years
                                  //                 .map((item) {
                                  //               return eduController
                                  //                   .buildMenuItemYear(item);
                                  //             }).toList(),
                                  //             onChanged: (value) {
                                  //               eduController.year =
                                  //                   value.toString();
                                  //               eduController.update();
                                  //             }),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Select University',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "Nunito",
                                              color: Colors.black87),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          width: context.width * 0.55,
                                          // decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(10),
                                          //     border: Border.all(
                                          //         color: Colors.black87)),
                                          child: TypeAheadFormField(
                                              // hideKeyboardOnDrag: true,
                                              errorBuilder: (context, error) =>
                                                  Text(error.toString()),
                                              hideOnError: true,
                                              hideSuggestionsOnKeyboardHide:
                                                  false,
                                              hideKeyboardOnDrag: true,
                                              validator: (value) {
                                                var error =
                                                    validateUniversityTypeAhead(
                                                        value);
                                                return error;
                                              },
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(

                                                      // cursorHeight: 20,
                                                      cursorColor:
                                                          Colors.black87,
                                                      decoration:
                                                          new InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black87)),
                                                              // focusedBorder:
                                                              //     InputBorder.none,
                                                              // enabledBorder:
                                                              //     InputBorder.none,
                                                              errorBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black87)),
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      left: 15,
                                                                      bottom: 11,
                                                                      top: 11,
                                                                      right: 15),
                                                              hintText: "Select University"),
                                                      controller: eduController.universityController),
                                              suggestionsCallback: (pattern) {
                                                return eduController
                                                    .universityList
                                                    .where((element) => element
                                                        .universitName!
                                                        .toLowerCase()
                                                        .contains(pattern
                                                            .toLowerCase()));
                                              },
                                              itemBuilder: (context, UniversityList suggestion) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(suggestion
                                                      .universitName!),
                                                );
                                              },
                                              onSuggestionSelected: (UniversityList suggestion) {
                                                eduController
                                                        .universityController
                                                        .text =
                                                    suggestion.universitName!;
                                                eduController.universityCode =
                                                    suggestion.universitCode!;
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          'College',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "Nunito",
                                              color: Colors.black87),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          width: context.width * 0.55,
                                          child: TypeAheadFormField(
                                              validator: (value) {
                                                var error =
                                                    validateCollageTypeAhead(
                                                        value);
                                                print(error);
                                                return error;
                                              },
                                              errorBuilder: (context, error) =>
                                                  Text(error.toString()),
                                              hideOnError: true,
                                              hideSuggestionsOnKeyboardHide:
                                                  false,
                                              hideKeyboardOnDrag: true,
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(
                                                      cursorColor:
                                                          Colors.black87,
                                                      decoration:
                                                          InputDecoration(
                                                              errorBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black87)),
                                                              hintText:
                                                                  "Select college",
                                                              // errorBorder:
                                                              //     InputBorder(borderSide: BorderSide(color: Colors.black87)),

                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black87)),
                                                              contentPadding: EdgeInsets.only(
                                                                  left: 15,
                                                                  bottom: 11,
                                                                  top: 11,
                                                                  right: 15)),
                                                      controller: eduController
                                                          .collegeController),
                                              suggestionsCallback: (pattern) {
                                                return eduController
                                                    .collegeList!
                                                    .where((element) => element
                                                        .collegeName!
                                                        .toLowerCase()
                                                        .contains(pattern
                                                            .toLowerCase()));
                                              },
                                              itemBuilder: (context,
                                                  CollegeList suggestion) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      suggestion.collegeName!),
                                                );
                                              },
                                              onSuggestionSelected: (CollegeList suggestion) {
                                                eduController.collegeController
                                                        .text =
                                                    suggestion.collegeName!;
                                                eduController.collegeCode =
                                                    suggestion.collegeCode!;
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Get.off(EducationDetailsScreen());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                ElevatedButton(
                                    onPressed: () async {
                                      print(eduController.corseCode);
                                      if (eduController
                                          .addEduFormKey.currentState!
                                          .validate()) {
                                        eduController
                                            .addEduFormKey.currentState!
                                            .save();
                                        eduController.addEducationDetails(
                                            month:
                                                '',
                                            year: '',
                                            college: eduController.collegeCode,
                                            course: eduController.corseCode
                                                .toString(),
                                            university:
                                                eduController.universityCode);
                                      } else {}
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            )),
      );
    }));
  }

  Padding customeDropDownText(
      {required BuildContext context,
      required String selectedBox,
      required String text,
      required String? item,
      required List<dynamic> items,
      required String hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
          ),
          Spacer(),
          Container(
            width: context.width * 0.55,
            child: DropdownButtonFormField<UniversityList>(
                validator: (value) => value == null ? 'field required' : null,
                itemHeight: null,
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                style: TextStyle(
                    fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
                hint: Text(
                  hintText,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      color: Colors.black87),
                ),
                items: items.map((item) {
                  return eduController.buildMenuItem(item);
                }).toList(),
                onChanged: (value) {
                  item = value.toString();
                  eduController.universityCode =
                      value!.universitCode.toString();
                  eduController.update();
                }),
          ),
        ],
      ),
    );
  }

  Padding customeDropDownTextCource(
      {required BuildContext context,
      required String text,
      required String? item,
      required List<dynamic> items,
      required String hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
          ),
          Spacer(),
          Container(
            width: context.width * 0.55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black87)),
            child: TextField(
              onChanged: (value) {
                eduController.searchItem.value = value;
                eduController.searchItemMethod();
              },
              controller: eduController.degreeController,
              cursorHeight: 20,
              cursorColor: Colors.black87,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Select Degree"),
            ),

            //  DropdownButtonFormField<SpecialtyList>(
            //     validator: (value) => value == null ? 'field required' : null,
            //     itemHeight: null,
            //     isExpanded: true,
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.symmetric(horizontal: 7),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //         borderSide: const BorderSide(color: Colors.black),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //         borderSide: const BorderSide(color: Colors.black),
            //       ),
            //       errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //         borderSide: const BorderSide(color: Colors.black),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //         borderSide: const BorderSide(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //     style: TextStyle(
            //         fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
            //     hint: Text(
            //       hintText,
            //       style: TextStyle(
            //           fontSize: 16,
            //           fontFamily: "Nunito",
            //           color: Colors.black87),
            //     ),
            //     items: items.map((item) {
            //       return eduController.buildMenuItemCource(item);
            //     }).toList(),
            //     onChanged: (value) {
            //       item = value.toString();
            //       eduController.corseCode = value!.specialtyId.toString();

            //       eduController.update();
            //     }),
          ),
        ],
      ),
    );
  }

  Padding customeDropDownTextCollege(
      {required BuildContext context,
      required String text,
      required String? item,
      required List<dynamic> items,
      required String hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
          ),
          Spacer(),
          Container(
            width: context.width * 0.55,
            child: DropdownButtonFormField<CollegeList>(
                validator: (value) => value == null ? 'field required' : null,
                itemHeight: null,
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                style: TextStyle(
                    fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
                hint: Text(
                  hintText,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      color: Colors.black87),
                ),
                items: items.map((item) {
                  return eduController.buildMenuItemCollege(item);
                }).toList(),
                onChanged: (value) {
                  item = value.toString();
                  eduController.collegeCode = value!.collegeCode.toString();
                  eduController.update();
                }),
          ),
        ],
      ),
    );
  }

  Padding customeDropDownTextMonth(
      {required BuildContext context,
      required String text,
      required String? item,
      required List<dynamic> items,
      required String hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
          ),
          Spacer(),
          Container(
            width: context.width * 0.55,
            child: DropdownButtonFormField(
                validator: (value) => value == null ? 'field required' : null,
                itemHeight: null,
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                style: TextStyle(
                    fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
                hint: Text(
                  'Select Month',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      color: Colors.black87),
                ),
                items: eduController.months.map((item) {
                  return eduController.buildMenuItemYear(item);
                }).toList(),
                onChanged: (value) {
                  eduController.month = value.toString();
                  eduController.update();
                }),
          ),
        ],
      ),
    );
  }

  validateCollageTypeAhead(value) {
    print(value);
    print('validator is working');
    if (value == "") {
      return 'field required';
    } else if (eduController.collegeList!.contains(value) == true) {
      print(value);
      return 'Enter college name';
    } else {
      return null;
    }
  }

  validateUniversityTypeAhead(String? value) {
    if (value == "") {
      return 'field required';
    } else if (eduController.universityList.contains(value) == true) {
      return 'Enter University name';
    } else {
      return null;
    }
  }

  degreeTypeAhead(String? value) {
    if (value == "") {
      return 'field required';
    } else if (eduController.specialtyList.contains(value) == true) {
      return 'Enter Course name';
    } else {
      return null;
    }
  }
}
