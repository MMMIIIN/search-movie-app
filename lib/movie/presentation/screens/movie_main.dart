import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/movie/domain/usecase/sort_movies_usecase.dart';
import 'package:riverpod_example/movie/presentation/provider/playing_movie.dart';
import 'package:riverpod_example/movie/presentation/screens/widgets/movie_card.dart';

class MovieMain extends HookConsumerWidget {
  const MovieMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType = useState(MovieSortType.voteAverageHigh);
    final state = ref.watch(playingMovieProvider(sortType.value));

    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Sort',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: MovieSortType.voteAverageHigh,
                    child: Text(MovieSortType.voteAverageHigh.name),
                  ),
                  DropdownMenuItem(
                    value: MovieSortType.voteAverageLow,
                    child: Text(MovieSortType.voteAverageLow.name),
                  ),
                  DropdownMenuItem(
                    value: MovieSortType.popularityHigh,
                    child: Text(MovieSortType.popularityHigh.name),
                  ),
                  DropdownMenuItem(
                    value: MovieSortType.popularityLow,
                    child: Text(MovieSortType.popularityLow.name),
                  ),
                  DropdownMenuItem(
                    value: MovieSortType.releaseDateNew,
                    child: Text(MovieSortType.releaseDateNew.name),
                  ),
                  DropdownMenuItem(
                    value: MovieSortType.releaseDateOld,
                    child: Text(MovieSortType.releaseDateOld.name),
                  ),
                ],
                value: sortType.value,
                onChanged: (value) {
                  if (value != null) {
                    sortType.value = value;
                    // sortType.value가 변경되면 자동으로 playingMovieProvider가 재실행됨
                  }
                },
              ),
            ],
          ),
          Expanded(
            child: state.when(
              data: (movieResult) {
                if (movieResult.results.isEmpty) {
                  return const Center(child: Text('No Data'));
                }
                return ListView.builder(
                  itemCount: movieResult.results.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      imagePath: movieResult.results[index].posterPath,
                      title: movieResult.results[index].title,
                      overview: movieResult.results[index].overview,
                      voteAverage: movieResult.results[index].voteAverage,
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
            ),
          ),
        ],
      ),
    );
  }
}
