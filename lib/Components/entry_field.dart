import 'package:dj_mania/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EntryField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? labelText;
  final String? initialValue;
  final Color? fillColor;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool? obscureText;

  EntryField(
      {this.hintText,
      this.suffix,
      this.prefixIcon,
      this.labelText,
      this.initialValue,
      this.fillColor,
      this.contentPadding,
      this.controller,
      this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().textfield,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText == true ? true : false,
        //  initialValue: initialValue,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          labelText: labelText,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16, color: AppColors().textColorGeneral.withOpacity(0.5), fontWeight: FontWeight.normal),
          hintStyle: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Theme.of(context).hintColor, fontSize: 18, fontWeight: FontWeight.normal),
        ),
        style: TextStyle(color: AppColors().textColorGeneral, fontSize: 15, fontWeight: FontWeight.normal),
      ),
    );
  }
}
