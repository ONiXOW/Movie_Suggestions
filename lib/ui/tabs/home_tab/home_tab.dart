import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_suggestions/ui/tabs/movie_details_screen/movies_details_screen.dart';
import 'package:movie_suggestions/utils/app_styles.dart';
import 'package:movie_suggestions/utils/assets_manager.dart';
import 'package:movie_suggestions/web_services/model/MoviesResponseModel.dart';
import 'package:movie_suggestions/web_services/model/api_manager.dart';
import '../../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = "Home Tab";

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Movies? currentMovie;
  final ValueNotifier<String?> _backgroundImageNotifier = ValueNotifier(null);

  @override
  void dispose() {
    _backgroundImageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: FutureBuilder<MoviesResponseModel>(
        future: ApiManager.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Something Went Wrong", style: AppStyles.regular14White),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Try Again"),
                ),
              ],
            );
          }

          final data = snapshot.data!;
          final moviesList = data.data?.movies ?? [];
          moviesList.sort((a, b) {
            DateTime dateA = DateTime.parse(a.dateUploaded ?? "1970-01-01");
            DateTime dateB = DateTime.parse(b.dateUploaded ?? "1970-01-01");
            return dateB.compareTo(dateA);
          });

          if (moviesList.isEmpty) {
            return Center(child: Text("No movies found", style: AppStyles.regular14White));
          }

          if (currentMovie == null) {
            currentMovie = moviesList.first;
            _backgroundImageNotifier.value = currentMovie?.backgroundImageOriginal;
          }

          return Stack(
            children: [

              Positioned.fill(
                child: ValueListenableBuilder<String?>(
                  valueListenable: _backgroundImageNotifier,
                  builder: (context, backgroundImage, _) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 600),
                      transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                      child: CachedNetworkImage(
                        key: ValueKey(backgroundImage),
                        imageUrl: backgroundImage ?? "",
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                        placeholder: (context, url) => Container(color: Colors.black),
                        errorWidget: (context, url, error) => Container(color: Colors.black),
                      ),
                    );
                  },
                ),
              ),

              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.84),
                ),
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AssetsManager.availableNow, alignment: Alignment.center),

                  SizedBox(
                    height: height * 0.22,
                    child: CarouselSlider(
                      items: moviesList.map((movie) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MoviesDetailsScreen.routeName,
                              arguments: movie,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: movie.mediumCoverImage ?? "",
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 500),
                                  errorWidget: (context, url, error) => Container(color: Colors.black),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.0030,
                                    vertical: height * 0.003,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.0060,
                                    vertical: height * 0.003,
                                  ),
                                  width: width * 0.070,
                                  height: height * 0.029,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    shape: BoxShape.rectangle,
                                    color: AppColors.ratingColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(movie.rating.toString(), style: AppStyles.regular14White),
                                      Image.asset(AssetsManager.starIcon),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: height * 0.22,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.39,
                        initialPage: 0,
                        animateToClosest: true,
                        reverse: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        clipBehavior: Clip.antiAlias,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, _) {
                          currentMovie = moviesList[index];
                          _backgroundImageNotifier.value = currentMovie?.mediumCoverImage;
                        },
                      ),
                    ),
                  ),

                  Image.asset(AssetsManager.watchNow),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}