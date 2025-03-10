import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/customWidgets/MovieItem.dart';
import '../../../core/resources/color_manager.dart';
import '../../home_tab/logic/home_tab_cubit.dart';
import '../logic/browse_cubit.dart';
import 'widgets/tab_category_widget.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = HomeTabCubit.get(context).genresSet.toList();
    return BlocProvider(
      create: (context) => BrowseCubit()
        ..setSelectedCategory(context)
        ..getMoviesListByGenre(),
      child: BlocBuilder<BrowseCubit, BrowseState>(
        builder: (context, state) {
          final cubit = BrowseCubit.get(context);
          final filteredMovies = cubit.moviesListByGenre?.data?.movies ?? [];
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                DefaultTabController(
                  initialIndex: cubit.selectedIndex,
                  length: categories.length,
                  child: TabBar(
                    onTap: (index) {
                      cubit.setIndex(index, context);
                      cubit.getMoviesListByGenre();
                    },
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: ColorManager.blackColor,
                    dividerColor: ColorManager.transparentColor,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                    tabs: categories.map((filmCategory) {
                      return TabCategoryWidget(
                        isSelected: cubit.selectedIndex ==
                            categories.indexOf(filmCategory),
                        filmCategory: filmCategory,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                state is BrowseLoading
                    ? const Center(child: Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(ColorManager.lowWhiteColor),
                      ),
                    ))
                    : Expanded(
                        child: filteredMovies.isEmpty
                            ? const Center(
                                child: Text(
                                  "No movies found!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 0.7,
                                ),
                                itemCount: filteredMovies.length,
                                itemBuilder: (context, index) {
                                  final movie = filteredMovies[index];
                                  return MovieItem(
                                    movieId: movie.id!,
                                    title: movie.title!,
                                    rating: movie.rating!,
                                    image: movie.largeCoverImage!,
                                  );
                                },
                              ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
