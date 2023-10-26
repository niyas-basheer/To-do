import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/color.dart';



Widget buildTextField({
  required BuildContext context,
  required TextEditingController controller,
  required String hintText,
  String labelText = "",
  bool obscureText = false,
  String? Function(String?)? validator,
  Widget? suffixIcon,  
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        if (labelText.isNotEmpty)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: const TextStyle(
                fontSize: 16,
                color: splachcolor,
              ),
            ),
          ),
        TextFormField(
          style: const TextStyle(
            color: blackcolor,
          ),
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,  
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}



Widget buildElevatedButton({
  required BuildContext context,
  required void Function() onPressed,
  required String text,
  Color? backgroundColor,
}) {
  return SizedBox(
    width: 0.9 * MediaQuery.of(context).size.width,
    height: 60,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        backgroundColor: backgroundColor ?? secondaryColor,
        alignment: Alignment.center,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: blackcolor,
        ),
      ),
    )
  );
  }



