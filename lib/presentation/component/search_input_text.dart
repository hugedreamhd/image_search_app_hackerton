import 'package:flutter/material.dart';
import 'package:image_search_app_hackerton/presentation/ui/color_styles.dart';
import 'package:image_search_app_hackerton/presentation/ui/text_styles.dart';

class SearchInputText extends StatelessWidget {
//data
  final TextEditingController textEditingController;
  final void Function(String) inputTitle;
  final String hintText;

  const SearchInputText({
    super.key,
    required this.inputTitle,
    required this.hintText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: inputTitle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.smallTextRegular.copyWith(
          color: ColorStyles.gray4,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorStyles.primary100,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorStyles.primary100,
          ),
        ),
      ),
    );
  }
}
