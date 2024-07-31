import 'package:brokr/core/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscure = false,
    this.readOnly = false,
    this.validator,
    this.maxLine,
    this.headingTitle,
    this.fillColor,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String? headingTitle;
  final Color? fillColor;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? obscure;
  final bool readOnly;
  final int? maxLine;
  final String? Function(String? value)? validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headingTitle ?? '',
          style: GoogleFonts.inter(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5,),
        TextFormField(
          controller: controller,
          obscureText: obscure!,
          validator: validator,
          maxLines: maxLine ?? 1,
          keyboardType: keyboardType,
          readOnly: readOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? Colors.grey.withOpacity(.2),
            hintText: hintText,
            suffixIcon: prefixIcon,
            hintStyle: GoogleFonts.inter(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
