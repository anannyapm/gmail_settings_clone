import 'package:flutter/material.dart';
import 'package:gmail_clone/widgets/custom_dropdown.dart';
import 'package:gmail_clone/widgets/custom_text.dart';
import 'package:gmail_clone/widgets/drag_widget.dart';
import 'package:gmail_clone/widgets/signature_widget.dart';
import 'package:gmail_clone/widgets/star_rating_widget.dart';

class GenralPage extends StatefulWidget {
  const GenralPage({super.key});

  @override
  State<GenralPage> createState() => _GenralPageState();
}

class _GenralPageState extends State<GenralPage> {
  @override
  Widget build(BuildContext context) {
 

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomTileWidget(
              titleWidget: const CustomText(
                text: "Language:",
                weight: FontWeight.bold,
                size: 16,
              ),
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CustomText(
                        text: "Gmail display language:",
                        weight: FontWeight.bold,
                      ),
                      const CustomDropDown(
                        dropDownList: [
                          'English (US)',
                          'Spanish (Sp)',
                          'French (Fr)',
                          'German (Ger)',
                        ],
                        selectedValue: 'English (US)',
                        isBorderEnabled: true,
                      ),
                      InkWell(
                          onTap: () {},
                          child: const CustomText(
                            text:
                                "Change language settings for other Google products",
                            size: 14,
                            color: Colors.indigo,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                  InkWell(
                      onTap: () {},
                      child: const CustomText(
                        text: "Show all language options",
                        size: 14,
                        color: Colors.indigo,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTileWidget(
              titleWidget: CustomText(
                text: "Phone Numbers:",
                weight: FontWeight.bold,
                size: 16,
              ),
              bodyWidget: Row(
                children: [
                  CustomText(
                    text: "Default Country Code",
                    weight: FontWeight.bold,
                  ),
                  CustomDropDown(
                    dropDownList: [
                      'India',
                      'US',
                      'China',
                      'Japan',
                    ],
                    selectedValue: 'India',
                    isBorderEnabled: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTileWidget(
              titleWidget: const Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Default Text Style:",
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                  ),
                  CustomText(
                    text:
                        "(Use the 'Remove formatting' button on the toolbar to reset the default text style)",
    
                    size: 12,
                    //  overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(
                            0, 3), // Shadow position [horizontal, vertical]
                      )
                    ]),
                    width: 400,
                    height: 60,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CustomDropDown(
                                  dropDownList: ['Serif', 'Sans Serif', 'Roboto'],
                                  selectedValue: 'Serif',
                                  isBorderEnabled: false),
                              const CustomDropDown(
                                  dropDownList: ['Normal', 'Large', 'Small'],
                                  selectedValue: 'Normal',
                                  isBorderEnabled: false),
                              const CustomDropDown(
                                  dropDownList: ['Red', 'Green', 'Yellow'],
                                  selectedValue: 'Red',
                                  isBorderEnabled: false),
                              InkWell(
                                onTap: () {},
                                child: const Icon(Icons.format_clear),
                              )
                            ],
                          ),
                          const Text("This is what your text will look like")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTileWidget(
              titleWidget: const CustomText(
                text: "Stars:",
                weight: FontWeight.bold,
                size: 16,
              ),
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Drag the stars between the lists.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                            text:
                                'The stars will rotate in the order shown below when you click successively.'),
                      ],
                    ),
                  ),
                  const CustomText(
                    text:
                        'To learn the name of a star for search, hover your mouse over the image.',
                    size: 16,
                  ),
                  const Row(
                    children: [
                      CustomText(text: "Presets:"),
                      StarRatingWidget(),
                    ],
                  ),
                 
                  const DragAndDropScreen(),
                  // StarWidget()
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
             CustomTileWidget(
              titleWidget:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Signature:",
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                  ),
                  const CustomText(
                    text:
                        "(appended at the end of all outgoing messages)",
    
                    size: 12,
                    //  overflow: TextOverflow.ellipsis,
                  ),
                  InkWell(
                      onTap: () {},
                      child: const CustomText(
                        text: "Learn More",
                        size: 14,
                        color: Colors.indigo,
                      ))
    
                ],
              ),
              bodyWidget: const SignatureWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTileWidget extends StatelessWidget {
  final Widget titleWidget;
  final Widget bodyWidget;
  const CustomTileWidget({
    super.key,
    required this.titleWidget,
    required this.bodyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //minLeadingWidth: 200,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //leading:
        Container(
            padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width * 0.2,
            child: titleWidget),
        //  title:
        Expanded(child: bodyWidget)
      ],
    );
  }
}
