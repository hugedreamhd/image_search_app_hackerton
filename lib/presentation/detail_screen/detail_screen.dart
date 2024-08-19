import 'package:flutter/material.dart';
import 'package:image_search_app_hackerton/domain/model/pixabay.dart';

class DetailScreen extends StatelessWidget {
  final Pixabay image;

  const DetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Hero(
                tag: image.id,
                child: Image.network(
                  image.imageUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
