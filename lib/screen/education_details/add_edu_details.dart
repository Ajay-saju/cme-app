import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/models/get_eduid_list.model.dart';
import 'package:hslr/screen/education_details/education_controller.dart';
import 'package:hslr/screen/education_details/education_screen.dart';

class AddEducationDetails extends StatefulWidget {
  const AddEducationDetails({Key? key}) : super(key: key);

  @override
  State<AddEducationDetails> createState() => _AddEducationDetailsState();
}

class _AddEducationDetailsState extends State<AddEducationDetails> {
  // final GlobalKey<FormState> addEduFormKey = GlobalKey<FormState>();
  final eduController = Get.find<EducationController>();

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
              child:
                  // eduController.eduIdList.value == null
                  // ? Center(
                  //     child: CircularProgressIndicator(color: Colors.black87),
                  //   )
                  // :
                  SingleChildScrollView(
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
                            customeDropDownTextCource(
                                context: context,
                                hintText: 'Select Degree',
                                item: eduController.specialtyList![0].specialtyName,
                                text: 'Degree',
                                items: eduController.specialtyList!),
                            // customeDropDownText(
                            //     context: context,
                            //     hintText: 'Select Degree',
                            //     item: eduController.degree,
                            //     items: eduController.degreeItem,
                            //     text: 'Degree'),
                            SizedBox(
                              height: 15,
                            ),
                            customeDropDownTextMonth(
                                context: context,
                                hintText: 'Select month',
                                item: eduController.month,
                                items: eduController.months,
                                text: 'Year Of\nPassing'),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    width: context.width * 0.55,
                                    child: DropdownButtonFormField(
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        itemHeight: null,
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: "Nunito",
                                            color: Colors.black87),
                                        hint: Text(
                                          'Select Year',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Nunito",
                                              color: Colors.black87),
                                        ),
                                        items: eduController.years.map((item) {
                                          return eduController
                                              .buildMenuItemYear(item);
                                        }).toList(),
                                        onChanged: (value) {
                                          eduController.year = value.toString();
                                          eduController.update();
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            customeDropDownText(
                                context: context,
                                hintText: 'Select University',
                                item: eduController
                                    .universityList![0].universitName,
                                items: eduController.universityList!,
                                text: 'University\nName',
                                selectedBox: 'Select University'),
                            SizedBox(
                              height: 15,
                            ),
                            customeDropDownTextCollege(
                                context: context,
                                hintText: 'Select College',
                                item: eduController.collegeList![0].collegeName,
                                items: eduController.collegeList!,
                                text: 'College'),
                            // customeDropDownText(
                            //     context: context,
                            //     hintText: 'Select University',
                            //     item: eduController.collegeList![0].collegeName,
                            //     items: eduController.collegeList!,
                            //     text: 'College'),
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
                                    borderRadius: BorderRadius.circular(30),
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
                                if (eduController.addEduFormKey.currentState!
                                    .validate()) {
                                  eduController.addEduFormKey.currentState!
                                      .save();
                                  eduController.addEducationDetails(
                                      month: eduController.month.toString(),
                                      year: eduController.year.toString(),
                                      college: eduController.collegeCode,
                                      course: eduController.corseCode,
                                      university: eduController.universityCode);
                                } else {}
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
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
            child: DropdownButtonFormField<SpecialtyList>(
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
                  return eduController.buildMenuItemCource(item);
                }).toList(),
                onChanged: (value) {
                  item = value.toString();
                  eduController.corseCode = value!.specialtyId.toString();

                  eduController.update();
                }),
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
}
