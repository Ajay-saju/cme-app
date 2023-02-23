import 'package:flutter/material.dart';

class TestInstructionScreen extends StatelessWidget {
  const TestInstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('ONLINE CME TEST'),
            SizedBox(
              height: 10,
            ),
            Text(
                '1. Read the Questions given in your question paper carefully and select the appropriate answer.'),
            SizedBox(
              height: 10,
            ),
            Text(
                '2. Use Next or Previous Buttons to get next or previous questions.'),
            SizedBox(
              height: 10,
            ),
            Text(
                "{3. Once you have completed your test, Click on the 'Submit' button then say 'OK' to submit the paper.}"),
            SizedBox(
              height: 10,
            ),
            Text(
                '4.While attending test  attendees face photos will be captured by camera device and the same will be  sent for the face detection to the respective authority.'),
            SizedBox(
              height: 10,
            ),
            Text(
                '5. If the captured photo does not contain your face. Your test will be rejected. So, Kindly make sure that your  camera is ON.'),
            SizedBox(
              height: 10,
            ),
            Text(
                '6. Make sure that your face is facing the camera .So, do the necessary camera adjustment.'),
            SizedBox(
              height: 10,
            ),
            Text(
                '7.On approval of genuinity CME credit points will be allocated on successful test pass.'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                ElevatedButton(onPressed: () {}, child: Text('OK'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
