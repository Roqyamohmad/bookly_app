import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final secureImageUrl = imageUrl.replaceFirst("http://", "https://");

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            imageUrl: secureImageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) {
              print("Error loading image: $url, Error: $error");
              return const Icon(Icons.error);
            },
          )),
    );
  }
}
