
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../CustemWidget/MovieItem.dart';
import '../../../di/di.dart';

import 'Cubit/Movies_States.dart';
import 'Cubit/View_Model.dart';




class  ProductTab extends StatelessWidget {
  MoviesViewModel moviesViewModel=getIt<MoviesViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesViewModel,MoviesStates>(
        bloc: moviesViewModel..getAllMovies(),
        builder: (context,state) {
          return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 /3.2.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,)
                    ,itemCount: moviesViewModel.moviesList.length,
                    itemBuilder: (context ,index){
                      return InkWell(
                        onTap: (){
                          // Navigator
                          // Navigator.pushNamed(context, ProuductDetails.routeName,
                          //   arguments: moviesViewModel.moviesList[index],
                          // );
                        },
                        child: MovieItem( moviesList: moviesViewModel.moviesList[index],
                          // productViewModel.ProductList[index],
                        ),
                      );
                    },


                  ))
                ],
              ));}
    );
  }
}


