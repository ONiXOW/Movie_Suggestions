import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_App/features/home_tab/ui/widgets/movies_carousel_slider.dart';

import '../../../core/customWidgets/MovieItem.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/text_manager.dart';
import '../../app_layout/logic/app_cubit.dart';
import '../../movie_details/ui/movie_details.dart';
import '../data/model/MoviesListModel.dart';
import '../logic/home_tab_cubit.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabCubit, HomeTabState>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.sizeOf(context);
        final cubit = HomeTabCubit.get(context);
        final List<Movies>? movies = cubit.moviesListModel?.data?.movies;
        return movies == null || movies.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.58,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:CachedNetworkImageProvider(cubit.currentMovieImage??'https://www.shutterstock.com/image-vector/failed-send-message-concept-illustration-600nw-2312527071.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                                ColorManager.mainColor.withOpacity(0.4),
                                ColorManager.mainColor.withOpacity(0.8),
                                ColorManager.mainColor.withOpacity(0.99),
                              ],
                              stops: [0.0, 0.2, 0.5, 0.8, 0.9, 1.0],
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                MovieDetails.routeName,
                              );
                            },
                            child: const MoviesCarouselSlider(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      children: [
                        Text(cubit.currentGenre,
                            style: FontManager.robotoRegular20White),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            AppCubit.get(context)
                                .changeBottomNavigationBarIndex(2);
                          },
                          child: Row(
                            children: [
                              Text('See More',
                                  style: FontManager.robotoRegular16Yellow),
                              Icon(
                                Icons.arrow_forward,
                                color: ColorManager.yellowColor,
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.31,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.filteredMovies.length,
                      itemBuilder: (context, index) {
                        return MovieItem(
                            movieId: cubit.filteredMovies[index].id!,
                            title: cubit.filteredMovies[index].title!,
                            rating: cubit.filteredMovies[index].rating!,
                            image:
                                cubit.filteredMovies[index].largeCoverImage!);
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
