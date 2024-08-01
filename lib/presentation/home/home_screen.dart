import 'package:flutter/material.dart';
import 'package:image_search_app_hackerton/presentation/component/search_input_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              SearchInputText(
                inputTitle: 'Search Text',
                hintText: 'Search',
              ),
              Center(
                child: Text('home screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
