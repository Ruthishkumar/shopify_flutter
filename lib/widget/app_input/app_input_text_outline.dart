import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputTextOutline extends StatefulWidget {
  final TextEditingController inputController;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final String hintText;
  final TextInputType? keyBoardType;
  final TextInputAction? textInputAction;
  final bool? isNumber;
  final List<TextInputFormatter>? inputFormatters;
  final Widget prefixIcon;
  final bool? password;
  final bool? disabled;
  const AppInputTextOutline(
      {Key? key,
      required this.inputController,
      this.onChanged,
      this.focusNode,
      this.validator,
      this.fillColor,
      required this.hintText,
      this.keyBoardType,
      this.textInputAction,
      this.isNumber,
      this.inputFormatters,
      required this.prefixIcon,
      this.password,
      this.disabled})
      : super(key: key);

  @override
  State<AppInputTextOutline> createState() => _AppInputTextOutlineState(
      inputController,
      onChanged,
      focusNode,
      validator,
      fillColor,
      hintText,
      keyBoardType,
      textInputAction,
      isNumber,
      inputFormatters,
      prefixIcon,
      password,
      disabled);
}

class _AppInputTextOutlineState extends State<AppInputTextOutline> {
  final TextEditingController inputController;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final String hintText;
  final TextInputType? keyBoardType;
  final TextInputAction? textInputAction;
  final bool? isNumber;
  final List<TextInputFormatter>? inputFormatters;
  final Widget prefixIcon;
  bool? password;
  final bool? disabled;

  _AppInputTextOutlineState(
      this.inputController,
      this.onChanged,
      this.focusNode,
      this.validator,
      this.fillColor,
      this.hintText,
      this.keyBoardType,
      this.textInputAction,
      this.isNumber,
      this.inputFormatters,
      this.prefixIcon,
      this.password,
      this.disabled);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
            keyboardType: (widget.isNumber ?? false)
                ? const TextInputType.numberWithOptions(decimal: true)
                : null,
            inputFormatters:
                ((widget.isNumber ?? false) && widget.inputFormatters == null)
                    ? [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ]
                    : (widget.inputFormatters != null)
                        ? widget.inputFormatters
                        : null,
            readOnly: disabled ?? false,
            textInputAction: widget.textInputAction,
            controller: widget.inputController,
            onChanged: widget.onChanged,
            focusNode: widget.focusNode,
            autofocus: false,
            obscureText: this.password ?? false,
            validator: widget.validator,
            style: GoogleFonts.openSans(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 14.sp),
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: widget.prefixIcon,
                fillColor: widget.fillColor,
                filled: true,
                errorStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.sp,
                    color: const Color(0xffF15252)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffF15252)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Color(0xffD2D2D4), width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 1)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: AppColors.primaryBorderColor, width: 1)),
                contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 0.sp, 0.sp),
                hintStyle: GoogleFonts.openSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff78787D)),
                hintText: widget.hintText)),
        if (password != null)
          IconButton(
            onPressed: () {
              setState(() {
                this.password = !(this.password!);
              });
            },
            icon: Icon(
              this.password! ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          )
      ],
    );
  }
}
