import 'package:flutter/material.dart';
import 'package:job_app_admin/common/constant/app_dimens.dart';
import 'package:job_app_admin/themes/app_themes.dart';

class KTextFormField extends StatefulWidget {
  KTextFormField({
    super.key,
    required this.autoCorrect,
    this.onChanged,
    this.validator,
    this.hintText,
    this.suffixIconColor,
    this.icon,
    this.obscureText = true,
    this.enable,
    this.hintStyle,
    this.maxLine,
    this.minLine,
    this.suffixIcon,
    this.textInputType,
    this.prefixIcon,
    required this.labelText,
  });
  final bool obscureText;
  final Icon? icon;
  final Color? suffixIconColor;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool autoCorrect;
  final void Function(String?)? onChanged;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? minLine;
  final bool? enable;
  final Icon? prefixIcon;
  final String labelText;

  @override
  State<KTextFormField> createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  late bool obscures;
  @override
  void initState() {
    super.initState();
    obscures = widget.obscureText;
  }

  Widget? suffixIconCondition() {
    if (widget.obscureText) {
      return IconButton(
        onPressed: () {
          setState(() {
            obscures = !obscures;
          });
          return null;
        },
        icon: Icon(obscures ? Icons.visibility_off : Icons.visibility),
        color: Colors.black,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: widget.minLine,
      maxLines: widget.obscureText ? 1 : widget.maxLine,
      onChanged: widget.onChanged,
      style: const TextStyle(fontSize: 15),
      obscureText: obscures,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      autocorrect: widget.autoCorrect,
      decoration: InputDecoration(
          errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.red.shade300,
              ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppDimens.ssBoarderRadius,
            borderSide: const BorderSide(color: textFieldColor),
          ),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ?? suffixIconCondition(),
          suffixIconColor: widget.suffixIconColor,
          border: OutlineInputBorder(),
          label: Text(
            widget.labelText,
            style: TextStyle(fontSize: 15),
          )),
    );
  }
}
