import 'package:flutter/material.dart';
import 'package:to_do/utils/validators/validation.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final int hight;
  const MyInputField(
      {required this.title,
      required this.hint,
      this.controller,
      this.widget,
      super.key,
      required this.hight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            height: hight == 1 ? 52 : 105,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget != null ? true : false,
                    controller: controller,
                    validator: (value) =>
                        TValidator.validateEmptyText(title, value),
                    decoration: InputDecoration(
                      hintText: hint,
                    ),
                    
                    maxLines: hight,
                  ),
                ),
                widget == null
                    ? const SizedBox()
                    : SizedBox(
                        child: widget,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
