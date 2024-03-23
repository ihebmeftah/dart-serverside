import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';

class AppDropdown<T> extends StatefulWidget {
  const AppDropdown(
      {super.key,
      required this.label,
      this.hint,
      this.value,
      required this.items,
      this.profileDecoration = false,
      this.counter,
      this.onChange,
      this.controller});
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final String? label, hint;
  final bool profileDecoration;
  final Widget? counter;
  final ValueChanged<T?>? onChange;
  final TextEditingController? controller;
  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
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
        DropdownButtonFormField<T>(
          value: widget.value,
          onChanged: widget.onChange,
          items: widget.items,
          validator: (value) {
            if (value == null) {
              setState(() {
                iserror = true;
              });
              return 'This field is required';
            }

            setState(() {
              iserror = false;
            });
            return null;
          },
          decoration: InputDecoration(
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
