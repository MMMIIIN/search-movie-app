import 'package:flutter/material.dart';
import 'package:riverpod_example/movie/domain/usecase/sort_movies_usecase.dart';

class SortFilterButton extends StatelessWidget {
  final MovieSortType currentSortType;
  final ValueChanged<MovieSortType> onSortTypeChanged;

  const SortFilterButton({
    super.key,
    required this.currentSortType,
    required this.onSortTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MovieSortType>(
      color: Colors.white,
      icon: const Icon(Icons.filter_list),
      tooltip: '정렬',
      onSelected: onSortTypeChanged,
      itemBuilder: (context) => [
        _buildMenuItem(
          type: MovieSortType.voteAverageHigh,
          label: '평점 높은순',
        ),
        _buildMenuItem(
          type: MovieSortType.voteAverageLow,
          label: '평점 낮은순',
        ),
        _buildMenuItem(
          type: MovieSortType.popularityHigh,
          label: '인기 높은순',
        ),
        _buildMenuItem(
          type: MovieSortType.popularityLow,
          label: '인기 낮은순',
        ),
        _buildMenuItem(
          type: MovieSortType.releaseDateNew,
          label: '최신 개봉순',
        ),
        _buildMenuItem(
          type: MovieSortType.releaseDateOld,
          label: '오래된 개봉순',
        ),
      ],
    );
  }

  PopupMenuItem<MovieSortType> _buildMenuItem({
    required MovieSortType type,
    required String label,
  }) {
    final isSelected = currentSortType == type;

    return PopupMenuItem(
      value: type,
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check : Icons.circle_outlined,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(label),
        ],
      ),
    );
  }
}
