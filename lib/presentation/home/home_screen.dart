import 'package:flutter/material.dart';
import 'package:image_search_app_hackerton/presentation/component/search_input_text.dart';
import 'package:image_search_app_hackerton/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textEdtingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEdtingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    print('Images count: ${viewModel.state.images.length}');
    print('Is loading: ${viewModel.state.isLoading}');
    print('Error: ${viewModel.state.error}');

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              SearchInputText(
                hintText: 'Search',
                textEditingController: _textEdtingController,
                inputTitle: (String title) {
                  print('Searching for: $title');
                  viewModel.searchImage(title);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: viewModel.state.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: viewModel.state.images.length,
                        itemBuilder: (context, index) {
                          final image = viewModel.state.images[index];
                          print('Image URL: ${image.previewURL}');

                          return Image.network(
                              image.previewURL,
                          );
                        },
                        // children: [
                        //   Container(
                        //     height: 50,
                        //     width: 50,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   Container(
                        //     height: 50,
                        //     width: 50,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
