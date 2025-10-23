import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/movie/domain/usecase/sort_movies_usecase.dart';
import 'package:riverpod_example/movie/presentation/provider/playing_movie.dart';
import 'package:riverpod_example/movie/presentation/provider/search_movie.dart';
import 'package:riverpod_example/movie/presentation/screens/widgets/movie_grid_card.dart';
import 'package:riverpod_example/movie/presentation/screens/widgets/movie_list_card.dart';
import 'package:riverpod_example/movie/presentation/screens/widgets/sort_filter_button.dart';

class MovieMain extends HookConsumerWidget {
  const MovieMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType = useState(MovieSortType.voteAverageHigh);
    final isGridView = useState(false);
    final searchQuery = useState('');
    final debouncedSearchQuery = useDebounced(
      searchQuery.value,
      const Duration(seconds: 1),
    );

    // 두 provider를 각각 watch
    final playingMovies = ref.watch(playingMovieProvider(sortType.value));
    final searchMovies = ref.watch(
      searchMovieProvider(debouncedSearchQuery ?? "", sortType.value),
    );

    // 검색어에 따라 어떤 state를 사용할지 결정
    final state = debouncedSearchQuery?.isEmpty ?? true
        ? playingMovies
        : searchMovies;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TMDB Movie'),
        backgroundColor: Colors.white,
        actions: [
          // GridView/ListView 토글 버튼
          IconButton(
            icon: Icon(isGridView.value ? Icons.list : Icons.grid_view),
            tooltip: isGridView.value ? '리스트 뷰' : '그리드 뷰',
            onPressed: () {
              isGridView.value = !isGridView.value;
            },
          ),
          // 필터 아이콘 버튼
          SortFilterButton(
            currentSortType: sortType.value,
            onSortTypeChanged: (value) {
              sortType.value = value;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: CupertinoSearchTextField(
              onChanged: (value) {
                // 입력할 때마다 searchQuery 업데이트 (즉시)
                searchQuery.value = value;
                // useEffect가 자동으로 타이머 리셋 & 1초 후 실행
              },
            ),
          ),
          Expanded(
            child: state.when(
              data: (movieResult) {
                if (movieResult.results.isEmpty) {
                  return const Center(child: Text('No Data'));
                }
                return isGridView.value
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 7 / 16,
                              ),
                          itemCount: movieResult.results.length,
                          itemBuilder: (context, index) {
                            return MovieGridCard(
                              imagePath: movieResult.results[index].posterPath,
                              title: movieResult.results[index].title,
                              overview: movieResult.results[index].overview,
                              voteAverage:
                                  movieResult.results[index].voteAverage,
                            );
                          },
                        ),
                      )
                    : ListView.builder(
                        itemCount: movieResult.results.length,
                        itemBuilder: (context, index) {
                          return MovieListCard(
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
