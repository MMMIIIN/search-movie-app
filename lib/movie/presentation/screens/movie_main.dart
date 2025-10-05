import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/movie/presentation/provider/playing_movie.dart';

class MovieMain extends ConsumerWidget {
  const MovieMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(playingMovieProvider);

    return state.when(
      data: (movieResult) {
        if (movieResult.results.isEmpty) {
          return const Center(child: Text('No Data'));
        }
        return ListView.builder(
          itemCount: movieResult.results.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(movieResult.results[index].title),
              subtitle: Text(movieResult.results[index].overview),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.invalidate(playingMovieProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
