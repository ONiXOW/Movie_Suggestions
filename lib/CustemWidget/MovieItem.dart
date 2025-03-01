import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/app_colors.dart';
import '../domain/use_cases/MoviesResponseList.dart';


class MovieItem extends StatelessWidget {
  Movies moviesList;
  MovieItem({required this.moviesList});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryColor,width: 2),
      ),
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child:  Image.network(
                fit: BoxFit.cover,
                width: 210.w,
                height: 243.5.w,
                moviesList.backgroundImage??"",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);},
              ),
            ),
            Positioned(
                top: 8.h,
                right: 8.w,
                child: IconButton(onPressed: (){},
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.zero,
                    iconSize: 30.r,
                    icon:Icon(Icons.favorite_border_rounded,
                      color: AppColors.primaryColor,
                    )

                ))
          ],
        )
      ],),
    );
  }
}
