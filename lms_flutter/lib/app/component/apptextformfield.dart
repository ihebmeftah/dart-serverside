import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField(
      {super.key,
      required this.label,
      this.hint,
      this.isPassword = false,
      this.isEmail = false,
      this.isRequired = true,
      this.profileDecoration = false,
      this.counter,
      this.onChange,
      this.maxLine = 1,
      this.controller});
  final String? label, hint;
  final bool isPassword, isRequired, isEmail, profileDecoration;
  final Widget? counter;
  final int? maxLine;
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool iserror = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label!,
          style: TextStyle(
              fontSize: GetPlatform.isWeb ? 6.sp : 16.sp,
              fontWeight: FontWeight.w500,
              color: iserror ? Colors.red.shade900 : Colors.black87),
        ),
        widget.profileDecoration ? 0.spaceH : 5.spaceH,
        TextFormField(
          maxLines: widget.maxLine,
          controller: widget.controller,
          obscureText: widget.isPassword,
          onChanged: widget.onChange,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          validator: widget.isRequired == false
              ? null
              : (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      iserror = true;
                    });
                    return 'This field is required';
                  }
                  if (widget.isEmail && !GetUtils.isEmail(value)) {
                    setState(() {
                      iserror = true;
                    });
                    return 'This field is email';
                  }
                  setState(() {
                    iserror = false;
                  });
                  return null;
                },
          decoration: InputDecoration(
            suffixIcon: !widget.profileDecoration
                ? null
                : Icon(
                    Icons.edit,
                    size: 15.r,
                  ),
            counter: widget.counter,
            filled: !widget.profileDecoration,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
            hintText: widget.hint,
            fillColor: ThemesApp.white,
            enabledBorder: widget.profileDecoration
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))
                : const OutlineInputBorder(borderSide: BorderSide.none),
            border: widget.profileDecoration
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))
                : const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: widget.profileDecoration
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade800))
                : OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.blue.shade800)),
            errorBorder: widget.profileDecoration
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade800))
                : OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.red.shade800)),
          ),
        )
      ],
    );
  }
}
