import 'package:flutter/material.dart';
import 'package:image_search_app_hackerton/presentation/ui/color_styles.dart';
import 'package:image_search_app_hackerton/presentation/ui/text_styles.dart';

class SearchInputText extends StatefulWidget {
//data
  final String inputTitle;
  final String hintText;

  const SearchInputText({
    super.key,
    required this.inputTitle,
    required this.hintText,
  });

  @override
  State<SearchInputText> createState() => _SearchInputTextState();
}

class _SearchInputTextState extends State<SearchInputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: widget.hintText,
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
        ),
      ],
    );
  }
}
