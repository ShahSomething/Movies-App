import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/ui/widgets/common/genre_image_container/genre_image_container.dart';

class AllGenresView extends StatelessWidget {
  const AllGenresView({super.key, required this.genres});
  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GenreImageContainer(
          genre: genres[index],
        );
      },
      itemCount: genres.length,
    );
  }
}
