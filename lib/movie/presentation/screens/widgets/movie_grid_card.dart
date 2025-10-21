import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieGridCard extends StatelessWidget {
  const MovieGridCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.overview,
    required this.voteAverage,
  });

  final String imagePath;
  final String title;
  final String overview;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          width: double.infinity,
          imageUrl: "https://image.tmdb.org/t/p/original$imagePath",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          overview,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, color: Colors.redAccent, size: 20),
            const SizedBox(width: 4),
            Text(voteAverage.toStringAsFixed(1)),
          ],
        ),
      ],
    );
  }
}
