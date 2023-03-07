import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';

enum AppButtonFullType { primary, secondary }

class AppButtonFull extends StatelessWidget {
  final VoidCallback onPressed;

  final Widget label;
  final BoxBorder? border;
  final AppButtonFullType type;
  final bool showShadow;
  final bool isLoading;
  final bool disabled;
  final double? width;

  const AppButtonFull({
    Key? key,
    this.type = AppButtonFullType.primary,
    required this.onPressed,
    required this.label,
    this.border,
    this.showShadow = true,
    this.isLoading = false,
    this.disabled = false,
    this.width,
  }) : super(key: key);

  Color _getColor() {
    if (type == AppButtonFullType.primary) {
      return AppColors.primaryColor;
    } else if (type == AppButtonFullType.secondary) {
      return Colors.white;
    }
    return Colors.white;
  }

  Color getBorderColor() {
    if (type == AppButtonFullType.primary) {
      return AppColors.primaryColor;
    } else if (type == AppButtonFullType.secondary) {
      return AppColors.primaryColor;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 40.0,
        minWidth: width ?? double.infinity,
      ),
      child: GestureDetector(
        onTap: () {
          if (!disabled) onPressed();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          decoration: BoxDecoration(
              color: _getColor().withOpacity(disabled ? 0.5 : 1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: getBorderColor())),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              label,
            ],
          ),
        ),
      ),
    );
  }
}
