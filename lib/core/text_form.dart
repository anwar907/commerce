import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/themes/text_style.dart';

class FormTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final bool secureText;
  final Function? onTapTrailingIcon;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final void Function(String value)? onSubmit;
  final void Function(String value)? onChanged;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isInputArea;
  final bool isDisabled;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;
  final String? initialValue;
  final double inputHeight;
  final TextInputAction? inputAction;
  final String? errorMessage;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;

  /// Force error on the text input
  /// If [isError] is [True]
  /// Borders will be [ThemeColors.redPressed] and
  /// error icon as [suffixIcon]
  // final bool isError;

  const FormTextInput(
      {Key? key,
      this.controller,
      this.label,
      this.placeholder,
      this.secureText = false,
      this.onTapTrailingIcon,
      this.leadingIcon,
      this.suffixIcon,
      this.onSubmit,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      this.isRequired = false,
      this.isDisabled = false,
      this.isInputArea = false,
      this.formatter,
      this.validator,
      this.initialValue,
      this.inputHeight = 46,
      this.inputAction = TextInputAction.done,
      this.errorMessage,
      this.contentPadding = const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isError = errorMessage != null && errorMessage != '';
    final borderDecoration = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: isError ? Colors.red : Colors.grey,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Column(
                children: [
                  Text(
                    label!,
                    style: MediumText.body1,
                  ),
                  const SizedBox(height: 8),
                ],
              )
            : const SizedBox(),
        Container(
          height: isInputArea ? null : inputHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFFE8F7F3),
          ),
          child: TextFormField(
            focusNode: focusNode,
            initialValue: initialValue,
            inputFormatters: formatter,
            validator: validator,
            enabled: !isDisabled,
            onChanged: onChanged,
            obscureText: secureText,
            style: RegularText.body1,
            keyboardType: keyboardType,
            controller: controller,
            onFieldSubmitted: onSubmit,
            minLines: isInputArea ? 4 : 1,
            maxLines: isInputArea ? 4 : 1,
            decoration: InputDecoration(
              hintStyle: RegularText.body1,
              hintText: placeholder,
              contentPadding: contentPadding,
              border: borderDecoration,
              enabledBorder: borderDecoration,
              focusedBorder: isError
                  ? borderDecoration
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
              prefixIcon: leadingIcon,
              suffixIcon: suffixIcon ??
                  (isError
                      ? const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                        )
                      : suffixIcon),
            ),
          ),
        ),
        if (errorMessage != null && errorMessage != '')
          Column(
            children: [
              const SizedBox(height: 8),
              Text(
                errorMessage ?? '',
                style: MediumText.body1,
              ),
            ],
          )
      ],
    );
  }
}

class FormSecureTextInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final bool secureText;
  final Function? onTapTrailingIcon;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final void Function(String value)? onSubmit;
  final void Function(String value)? onChanged;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isInputArea;
  final bool isDisabled;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;
  final String? initialValue;
  final double inputHeight;
  final TextInputAction? inputAction;
  final String? errorMessage;

  /// Force error on the text input
  /// If [isError] is [True]
  /// Borders will be [GOKColors.negative] and
  /// error icon as [suffixIcon]
  final bool isError;

  const FormSecureTextInput({
    Key? key,
    this.controller,
    this.label,
    this.placeholder,
    this.secureText = true,
    this.onTapTrailingIcon,
    this.leadingIcon,
    this.suffixIcon,
    this.onSubmit,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isRequired = false,
    this.isDisabled = false,
    this.isInputArea = false,
    this.formatter,
    this.validator,
    this.initialValue,
    this.inputHeight = 46,
    this.inputAction = TextInputAction.done,
    this.isError = false,
    this.errorMessage,
  }) : super(key: key);

  @override
  _FormSecureTextInputState createState() => _FormSecureTextInputState();
}

class _FormSecureTextInputState extends State<FormSecureTextInput> {
  bool isSecure = true;

  @override
  void initState() {
    super.initState();
    isSecure = widget.secureText;
  }

  @override
  Widget build(BuildContext context) {
    return FormTextInput(
      controller: widget.controller,
      label: widget.label,
      placeholder: widget.placeholder,
      secureText: isSecure,
      onTapTrailingIcon: widget.onTapTrailingIcon,
      leadingIcon: widget.leadingIcon,
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            isSecure = !isSecure;
          });
        },
        child: !isSecure
            ? const Icon(Icons.visibility_outlined)
            : const Icon(Icons.visibility_off_outlined),
      ),
      onSubmit: widget.onSubmit,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      isRequired: widget.isRequired,
      isDisabled: widget.isDisabled,
      isInputArea: widget.isInputArea,
      formatter: widget.formatter,
      validator: widget.validator,
      initialValue: widget.initialValue,
      inputHeight: widget.inputHeight,
      inputAction: widget.inputAction,
      // isError: widget.isError,
      errorMessage: widget.errorMessage,
    );
  }
}
