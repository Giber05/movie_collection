// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_collection/infrastructure/constant/network_constants.dart';

class MCNetworkImage extends StatelessWidget {
  const MCNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
  }) : super(key: key);

  final String? imageUrl;
  final BoxFit? fit;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${NetworkConstants.baseImageUrl}/$imageUrl",
      width: double.infinity,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) => Center(
          child: Container(
        color: Colors.grey,
      )),
      errorWidget: (context, url, error) => const Center(
        child: Text('Failed to load image'),
      ),
    );
  }
}
