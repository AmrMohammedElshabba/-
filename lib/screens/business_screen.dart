import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componentes/components.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_status.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticlsItems(list[index],context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 10),
          fallback: (BuildContext context) =>  Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
