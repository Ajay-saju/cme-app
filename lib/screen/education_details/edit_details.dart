import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:hslr/models/get_eduid_list.model.dart';
import 'package:hslr/screen/profile_tab/profile_tab_controller.dart';
import '../../models/college_list_model.dart';
import '../profile_tab/profile_tab.dart';

class EditEduDetails extends StatefulWidget {
  final index;

  const EditEduDetails({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<EditEduDetails> createState() => _EditEduDetailsState();
}

class _EditEduDetailsState extends State<EditEduDetails> {
  final profileController = Get.find<ProfileTabController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.collegeController.text = profileController
        .eduList.value.result![widget.index].cOLLEGE
        .toString();
    profileController.universityController.text = profileController
        .eduList.value.result![widget.index].uNIVERSITY
        .toString();
    profileController.degreeController.text =
        profileController.eduList.value.result![widget.index].dEGREE.toString();
    //
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    profileController.degreeController.clear();
    profileController.universityController.clear();
    profileController.collegeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    callCollegeId();
    print(profileController.universityController.toString());
    return GetBuilder<ProfileTabController>(builder: ((_) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            body: SafeArea(
              child: Form(
                // key: eduController.formkey,
                child: SingleChildScrollView(
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
                                  "Edit Education Details",
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
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.black87)),
                                  child: TypeAheadFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return profileController
                                              .degreeController.text;
                                        }
                                      },
                                      hideOnError: true,
                                      hideSuggestionsOnKeyboardHide: false,
                                      hideKeyboardOnDrag: true,
                                      textFieldConfiguration:
                                          TextFieldConfiguration(

                                              // cursorHeight: 20,
                                              cursorColor: Colors.black87,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 11,
                                                    right: 15),
                                                hintText: 'Select Course',
                                              ),
                                              controller: profileController
                                                  .degreeController),
                                      suggestionsCallback: (pattern) {
                                        return profileController.specialtyList
                                            .where((element) => element
                                                .specialtyName!
                                                .toLowerCase()
                                                .contains(
                                                    pattern.toLowerCase()));
                                      },
                                      itemBuilder:
                                          (context, SpecialtyList suggestion) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Text(suggestion.specialtyName!),
                                        );
                                      },
                                      onSuggestionSelected:
                                          (SpecialtyList suggestion) {
                                        profileController.degreeController
                                            .text = suggestion.specialtyName!;
                                        profileController.corseCode =
                                            suggestion.specialtyId!.toString();
                                      }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                Container(
                                  width: context.width * 0.55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.black87)),
                                  child: TypeAheadFormField(
                                      getImmediateSuggestions: true,
                                      validator: (value) {
                                        // if(value==null){
                                        //   profileController.universityCode =
                                        //       suggestion.universitCode!
                                        // }
                                      },
                                      hideOnError: true,
                                      hideSuggestionsOnKeyboardHide: false,
                                      hideKeyboardOnDrag: true,
                                      textFieldConfiguration:
                                          TextFieldConfiguration(

                                              // cursorHeight: 20,
                                              cursorColor: Colors.black87,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 11,
                                                    right: 15),
                                                hintText: 'Select University',
                                              ),
                                              controller: profileController
                                                  .universityController),
                                      suggestionsCallback: (pattern) {
                                        return profileController.universityList
                                            .where((element) => element
                                                .universitName!
                                                .toLowerCase()
                                                .contains(
                                                    pattern.toLowerCase()));
                                      },
                                      itemBuilder:
                                          (context, UniversityList suggestion) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Text(suggestion.universitName!),
                                        );
                                      },
                                      onSuggestionSelected:
                                          (UniversityList suggestion) async {
                                        profileController.getCollageCode(
                                            universityId:
                                                suggestion.universitCode!);
                                        profileController
                                                .universityController.text =
                                            await suggestion.universitName!;
                                        profileController.universityCode =
                                            await suggestion.universitCode!;
                                      }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                Container(
                                  width: context.width * 0.55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.black87)),
                                  child: TypeAheadField(
                                    hideOnError: true,
                                    hideSuggestionsOnKeyboardHide: false,
                                    hideKeyboardOnDrag: true,
                                    textFieldConfiguration:
                                        TextFieldConfiguration(

                                            // onTap: () => callCollegeId(),
                                            cursorColor: Colors.black87,
                                            decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  left: 15,
                                                  bottom: 11,
                                                  top: 11,
                                                  right: 15),
                                              hintText: "Select Collage",
                                            ),
                                            controller: profileController
                                                .collegeController),
                                    suggestionsCallback: (pattern) {
                                      return profileController.collegeList!
                                          .where((element) => element
                                              .collegeName!
                                              .toLowerCase()
                                              .contains(pattern.toLowerCase()));
                                    },
                                    itemBuilder:
                                        (context, CollegeList suggestion) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(suggestion.collegeName!),
                                      );
                                    },
                                    onSuggestionSelected:
                                        (CollegeList suggestion) {
                                      profileController.collegeController.text =
                                          suggestion.collegeName!;
                                      profileController.collegeCode =
                                          suggestion.collegeCode!;
                                    },
                                  ),
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
                                  Get.off(ProfileScreenTab());
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
                                  await profileController.editEducationDetails(
                                    collegeId: profileController.collegeCode,
                                    courseId: profileController.corseCode,
                                    month: profileController.month.toString(),
                                    year: profileController.year.toString(),
                                    universityId:
                                        profileController.universityCode,
                                  );
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
              ),
            )),
      );
    }));
  }

  void callCollegeId() async {
    await profileController.getInitialCollageList(
        universityId: profileController
            .eduList.value.result![widget.index].uNIVERSITYId
            .toString());
  }
}
