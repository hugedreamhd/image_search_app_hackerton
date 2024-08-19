import 'package:flutter/material.dart';
import 'package:image_search_app_hackerton/presentation/home/home_view_model.dart';
import 'package:image_search_app_hackerton/presentation/ui/color_styles.dart';
import 'package:image_search_app_hackerton/presentation/ui/text_styles.dart';
import 'package:provider/provider.dart';

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
    final viewModel = context.watch<HomeViewModel>();

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorStyles.primary100),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: TextField(
                    controller: textEditingController,
                    // onChanged: inputTitle,
                    onSubmitted: (query) {
                      viewModel.searchImage(query);
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyles.smallTextRegular.copyWith(
                        color: ColorStyles.gray4,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final query = textEditingController.text;
                  viewModel.searchImage(query);
                  FocusScope.of(context).unfocus();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.search,
                    color: ColorStyles.primary100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
