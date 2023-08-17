import 'package:flutter/material.dart';
import 'package:gmail_clone/widgets/custom_dropdown.dart';
import 'package:gmail_clone/widgets/custom_text.dart';
import 'package:signature/signature.dart';

class SignatureWidget extends StatefulWidget {
  const SignatureWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  SignatureWidgetState createState() => SignatureWidgetState();
}

List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
String? selectedOption;
bool isChecked = false;

class SignatureWidgetState extends State<SignatureWidget> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          height: 50,
          color: Colors.blue[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: 'My Signature'),
                // SizedBox(
                //   width: 100,
                // ),

                const Icon(
                  Icons.create,
                  size: 18,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 18,
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Signature(
            controller: _controller,
            height: 200,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: Colors.blue,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Create new',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ),
        SizedBox(height: 15,),
        const CustomText(
          text: 'Signature Defaults',
          weight: FontWeight.bold,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'FOR NEW EMAILS USE'),
                SizedBox(
                    width: 200,
                    child: CustomDropDown(
                        dropDownList: ['My Signature', 'ABCD'],
                        selectedValue: 'My Signature',
                        isBorderEnabled: true))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                CustomText(text: 'FOR REPLY/FORWARD USE'),
                SizedBox(
                    width: 200,
                    child: CustomDropDown(
                        dropDownList: ['My Signature', 'ABCD'],
                        selectedValue: 'My Signature',
                        isBorderEnabled: true))
              ],
            )
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (newValue) {
                setState(() {
                  isChecked = newValue!;
                });
              },
            ),
        SizedBox(height: 15,),

            const Text('Insert signature before quoted text in replies'),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
