import 'package:flutter/material.dart';
import 'package:gmail_clone/widgets/custom_text.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> dropDownList;
  final String selectedValue;
  final bool isBorderEnabled;
  const CustomDropDown(
      {super.key, required this.dropDownList, required this.selectedValue, required this.isBorderEnabled});

  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
  String selectedDropValue = '';
  @override
  Widget build(BuildContext context) {
    selectedDropValue = widget.selectedValue;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 5,right: 5),
        height: 25,
        child: DropdownButtonFormField<String>(
          elevation: 0,
          
          icon:widget.isBorderEnabled?const Icon(
            Icons.keyboard_arrow_down,
            size: 18,
          ):null,
          decoration:  InputDecoration(
             
              contentPadding: EdgeInsets.zero,
              border:widget.isBorderEnabled? const OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.all(Radius.circular(3))):
                  const OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide.none,
                  
                
                  )
                  ),
          value: selectedDropValue,
          onChanged: (newValue) {
            setState(() {
              selectedDropValue = newValue!;
            });
          },
          items: widget.dropDownList.map((language) {
            return DropdownMenuItem<String>(
              value: language,
              child: CustomText(
                text: language,
                size: 13,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
