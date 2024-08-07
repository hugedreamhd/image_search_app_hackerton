import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app_hackerton/presentation/component/search_input_text.dart';
import 'package:image_search_app_hackerton/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _textEdtingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // _textEdtingController.dispose();
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
                // textEditingController: _textEdtingController,
                inputTitle: (String title) {
                  print('Searching for: $title');
                  viewModel.searchImage(title);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: viewModel.state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: viewModel.state.images.length,
                        itemBuilder: (context, index) {
                          final image = viewModel.state.images[index];
                          print('Image URL: ${image.previewURL}');

                          return GestureDetector(
                            onTap: () {
                              context.push('/detail_screen', extra: image);
                            },
                            child: Image.network(
                              image.previewURL,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
